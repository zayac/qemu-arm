# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-microblazeel"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=4
TARGET_LLONG_ALIGNMENT=8
TARGET_ARCH=microblaze
TARGET_MICROBLAZE=y
TARGET_ARCH2=microblazeel
TARGET_BASE_ARCH=microblaze
TARGET_ABI_DIR=microblaze
TARGET_PHYS_ADDR_BITS=32
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses -lbrlapi  -lvdeplug -luuid -lpng -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw32
CONFIG_I386_DIS=y
CONFIG_MICROBLAZE_DIS=y
CONFIG_NEED_MMU=y
LDFLAGS+=
QEMU_CFLAGS+=
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
