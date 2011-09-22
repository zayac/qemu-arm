# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-m68k"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=2
TARGET_LONG_ALIGNMENT=2
TARGET_LLONG_ALIGNMENT=2
TARGET_ARCH=m68k
TARGET_M68K=y
TARGET_ARCH2=m68k
TARGET_BASE_ARCH=m68k
TARGET_ABI_DIR=m68k
TARGET_WORDS_BIGENDIAN=y
TARGET_PHYS_ADDR_BITS=32
CONFIG_SOFTMMU=y
LIBS+=-lutil -lglib-2.0   -lbluetooth   -lcurl   -lncurses  -lvdeplug -luuid -ljpeg -lsasl2 -lgnutls   -lSDL -lpthread   -lX11  
HWDIR=../libhw32
TARGET_XML_FILES= /home/zayac/code/qemu-arm/qemu/gdb-xml/cf-core.xml /home/zayac/code/qemu-arm/qemu/gdb-xml/cf-fp.xml
CONFIG_I386_DIS=y
CONFIG_M68K_DIS=y
LDFLAGS+=
QEMU_CFLAGS+=
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
