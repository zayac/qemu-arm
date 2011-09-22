# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-ppc"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=4
TARGET_LLONG_ALIGNMENT=8
TARGET_ARCH=ppc
TARGET_PPC=y
TARGET_ARCH2=ppc
TARGET_BASE_ARCH=ppc
TARGET_ABI_DIR=ppc
TARGET_WORDS_BIGENDIAN=y
TARGET_PHYS_ADDR_BITS=32
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses  -lvdeplug -luuid -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw32
TARGET_XML_FILES= /home/zayac/code/qemu-arm/qemu/gdb-xml/power-core.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/power-fpu.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/power-altivec.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/power-spe.xml
CONFIG_I386_DIS=y
CONFIG_PPC_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=-DHAS_AUDIO -DHAS_AUDIO_CHOICE 
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
