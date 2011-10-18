start:
LDR r1, =0x00C00000            
MCR p15, 0, r1, c13, c3, 4 @     Read I-TLB PA into data L1 data 0 Register
MRC p15, 0, r0, c13, c1, 0 @     Move I-L1 data 0 Register to R0

stop:
  b stop	      @ Infinite loop to stop execution
