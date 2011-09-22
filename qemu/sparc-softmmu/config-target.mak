# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-sparc"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=4
TARGET_LLONG_ALIGNMENT=8
TARGET_ARCH=sparc
TARGET_SPARC=y
TARGET_ARCH2=sparc
TARGET_BASE_ARCH=sparc
TARGET_ABI_DIR=sparc
TARGET_WORDS_BIGENDIAN=y
TARGET_PHYS_ADDR_BITS=64
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses  -lvdeplug -luuid -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw64
CONFIG_I386_DIS=y
CONFIG_SPARC_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
