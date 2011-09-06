/******************************************************************************
 * Copyright (c) 2004, 2011 IBM Corporation
 * All rights reserved.
 * This program and the accompanying materials
 * are made available under the terms of the BSD License
 * which accompanies this distribution, and is available at
 * http://www.opensource.org/licenses/bsd-license.php
 *
 * Contributors:
 *     IBM Corporation - initial implementation
 *****************************************************************************/

#include <stdint.h>
#include <xvect.h>
#include <hw.h>
#include <stdio.h>
#include <romfs.h>
#include "memmap.h"
#include "stage2.h"
#include <termctrl.h>
#include "product.h"
#include "calculatecrc.h"
#include <cpu.h>
#include <libelf.h>
#include <string.h>

#define DEBUG(fmt...)
//#define DEBUG(fmt...) printf(fmt)

uint64_t gVecNum;

uint64_t exception_stack_frame;

typedef void (*pInterruptFunc_t) (void);

pInterruptFunc_t vectorTable[0x2E << 1];

void c_memInit(uint64_t r3, uint64_t r4);

void proceedInterrupt();

void exception_forward(void)
{
	uint64_t val;

	if (*(uint64_t *) XVECT_M_HANDLER) {
		proceedInterrupt();
	}

	printf("\r\n exception %llx ", gVecNum);
	asm volatile ("mfsrr0	%0":"=r" (val):);
	printf("\r\nSRR0 = %08llx%08llx ", val >> 32, val);
	asm volatile ("mfsrr1	%0":"=r" (val):);
	printf(" SRR1 = %08llx%08llx ", val >> 32, val);

	asm volatile ("mfsprg	%0,2":"=r" (val):);
	printf("\r\nSPRG2 = %08llx%08llx ", val >> 32, val);
	asm volatile ("mfsprg	%0,3":"=r" (val):);
	printf(" SPRG3 = %08llx%08llx \r\n", val >> 32, val);
	while (1);
}

void c_interrupt(uint64_t vecNum)
{
	gVecNum = vecNum;
	if (vectorTable[vecNum >> 7]) {
		vectorTable[vecNum >> 7] ();
	} else {
		exception_forward();
	}
}

void set_exceptionVector(int num, void *func)
{
	vectorTable[num >> 7] = (pInterruptFunc_t) func;
}

uint64_t get_dec(void)
{
	return 0xdeadaffe;
}

void set_dec(uint64_t val)
{
}

uint64_t tb_frequency(void)
{
	return 0;
}

static void load_file(uint64_t destAddr, char *name, uint64_t maxSize,
		      uint64_t romfs_base)
{
	uint64_t *src, *dest, cnt;
	struct romfs_lookup_t fileInfo;
	int rc;

	rc = c_romfs_lookup(name, romfs_base, &fileInfo);
	if (rc) {
		printf("Cannot find romfs file %s\n", name);
		return;
	}
	DEBUG("Found romfs file %s\n", name);
	if (maxSize) {
		cnt = maxSize;
	} else {
		cnt = fileInfo.size_data;
	}
	memcpy((void *)destAddr, (void *)fileInfo.addr_data, cnt);
	dest = (uint64_t *) destAddr;
	src = (uint64_t *) fileInfo.addr_data;
	flush_cache((void *) destAddr, fileInfo.size_data);
}

/***************************************************************************
 * Function: early_c_entry
 * Input   : start_addr
 *
 * Description:
 **************************************************************************/
void early_c_entry(uint64_t start_addr, uint64_t fdt_addr)
{
	struct romfs_lookup_t fileInfo;
	void (*ofw_start) (uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
	uint64_t *boot_info;
	uint64_t romfs_base;
	// romfs header values
	struct stH *header = (struct stH *) (start_addr + 0x28);
	uint64_t flashlen = 0;
	unsigned long ofw_addr[2];
	int rc;

	flashlen = header->flashlen;

	romfs_base = 0x10000000 - 0x400000;
	if (romfs_base)
		memcpy((char *)romfs_base, 0, 0x400000);

	exception_stack_frame = 0;

	printf(" Press \"s\" to enter Open Firmware.\r\n\r\n");

	DEBUG("  [c_romfs_lookup at %p]\n", c_romfs_lookup);
	rc = c_romfs_lookup("bootinfo", romfs_base, &fileInfo);
	if (rc)
		printf("  !!! roomfs lookup(bootinfo) = %d\n", rc);
	boot_info = (uint64_t *) fileInfo.addr_data;
	boot_info[1] = start_addr;
	load_file(0x100, "xvect", 0, romfs_base);
	rc = c_romfs_lookup("ofw_main", romfs_base, &fileInfo);
	if (rc)
		printf("  !!! roomfs lookup(bootinfo) = %d\n", rc);

	DEBUG("  [ofw_main addr hdr  0x%lx]\n", fileInfo.addr_header);
	DEBUG("  [ofw_main addr data 0x%lx]\n", fileInfo.addr_data);
	DEBUG("  [ofw_main size data 0x%lx]\n", fileInfo.size_data);
	DEBUG("  [ofw_main flags     0x%lx]\n", fileInfo.flags);
	DEBUG("  [hdr: 0x%08lx 0x%08lx]\n  [     0x%08lx 0x%08lx]\n",
	       ((uint64_t *)fileInfo.addr_header)[0],	
	       ((uint64_t *)fileInfo.addr_header)[1],
	       ((uint64_t *)fileInfo.addr_header)[2],
	       ((uint64_t *)fileInfo.addr_header)[3]);
	rc = load_elf_file((void *)fileInfo.addr_data, ofw_addr);
	DEBUG("  [load_elf_file returned %d]\n", rc);
	ofw_start =
	    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
	    &ofw_addr;
	// re-enable the cursor
	printf("%s%s", TERM_CTRL_RESET, TERM_CTRL_CRSON);
	DEBUG("  [ofw_start=%p ofw_addr=0x%lx]\n", ofw_start, ofw_addr[0]);
	ofw_addr[1] = ofw_addr[0];
	/* ePAPR 0.5
	 * r3 = R3 Effective address of the device tree image. Note: this
	 *      address must be 8-byte aligned in memory.
	 * r4 = implementation dependent
	 * r5 = 0
	 * r6 = 0x65504150 -- ePAPR magic value-to distinguish from
	 *      non-ePAPR-compliant firmware
	 * r7 = implementation dependent
	 */
	asm volatile("isync; sync;" : : : "memory");
	ofw_start(fdt_addr, romfs_base, 0, 0, 0);
	asm volatile("isync; sync;" : : : "memory");
	// never return
}
