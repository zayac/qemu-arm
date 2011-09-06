# Automatically generated by configure - do not modify
CONFIG_QEMU_INTERP_PREFIX="/usr/gnemul/qemu-unicore32"
TARGET_SHORT_ALIGNMENT=2
TARGET_INT_ALIGNMENT=4
TARGET_LONG_ALIGNMENT=4
TARGET_LLONG_ALIGNMENT=8
TARGET_ARCH=unicore32
TARGET_UNICORE32=y
TARGET_ARCH2=unicore32
TARGET_BASE_ARCH=unicore32
TARGET_ABI_DIR=unicore32
CONFIG_USER_ONLY=y
CONFIG_LINUX_USER=y
CONFIG_USE_GUEST_BASE=y
CONFIG_I386_DIS=y
LDFLAGS+=-Wl,-T../config-host.ld -Wl,-T,$(SRC_PATH)/$(ARCH).ld 
QEMU_CFLAGS+=
QEMU_INCLUDES+=-I$(SRC_PATH)/linux-headers -I$(SRC_PATH)/fpu -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/$(ARCH) 
