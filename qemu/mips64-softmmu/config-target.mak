# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-mips64"
TARGET_ABI_MIPSN64=y
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=8
TARGET_LLONG_ALIGNMENT=8
TARGET_ARCH=mips64
TARGET_MIPS64=y
TARGET_ARCH2=mips64
TARGET_BASE_ARCH=mips
TARGET_ABI_DIR=mips64
TARGET_WORDS_BIGENDIAN=y
TARGET_PHYS_ADDR_BITS=64
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses -lbrlapi  -lvdeplug -luuid -lpng -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw64
CONFIG_I386_DIS=y
CONFIG_MIPS_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=-DHAS_AUDIO -DHAS_AUDIO_CHOICE 
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
