# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-arm"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=4
TARGET_LLONG_ALIGNMENT=4
TARGET_ARCH=arm
TARGET_ARM=y
TARGET_ARCH2=arm
TARGET_BASE_ARCH=arm
TARGET_ABI_DIR=arm
TARGET_PHYS_ADDR_BITS=32
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses -lbrlapi  -lvdeplug -luuid -lpng -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw32
TARGET_XML_FILES= /home/zayac/code/qemu-arm/qemu/gdb-xml/arm-core.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/arm-vfp.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/arm-vfp3.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/arm-neon.xml
CONFIG_I386_DIS=y
CONFIG_ARM_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=-DHAS_AUDIO 
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
