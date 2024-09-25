# 模块名
MODULE_NAME = flashdb

# 源文件
MODULE_OBJECTS += main.o

# 编译选项
EXTRA_CFLAGS += -DFDB_LKM -I$(PWD)
CFLAGS_main.o = -DDEBUG

# Toolchain Path
CROSS_COMPILE ?=
# Linux Kernel header
KERNEL ?= /lib/modules/$(shell uname -r)/build
# Architecture
ARCH := arm

FLASHDB_PATH := $(PWD)/..

#enable logging by default
CONFIG_DEBUG_LOGS := y

obj-m := $(MODULE_NAME).o

# porting
EXTRA_CFLAGS += -I$(FLASHDB_PATH)/lkm/porting/inc
MODULE_OBJECTS += porting/fal_flash_lkm_port.o

# fal
EXTRA_CFLAGS += -I$(FLASHDB_PATH)/port/fal/inc
MODULE_OBJECTS += ../port/fal/src/fal.o ../port/fal/src/fal_flash.o ../port/fal/src/fal_partition.o 

# flashdb
EXTRA_CFLAGS += -I$(FLASHDB_PATH)/inc
# MODULE_OBJECTS += FlashDB/src/fdb_file.o FlashDB/src/fdb_kvdb.o FlashDB/src/fdb_tsdb.o FlashDB/src/fdb_utils.o FlashDB/src/fdb.o
MODULE_OBJECTS += ../src/fdb_kvdb.o ../src/fdb_tsdb.o ../src/fdb_utils.o ../src/fdb.o

$(MODULE_NAME)-y := $(MODULE_OBJECTS)

.PHONY: clean info

all: clean
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules

clean:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
	@find .. \( -name '*.o' -o -name '*.ko' -o -name '.*.cmd' -o -name '*~' \
		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' -o -name '.#*' \) \
		-type f -print | xargs rm -f

info:
	@echo "KERNEL=$(KERNEL)"
	@echo "MODULE_NAME=$(MODULE_NAME)"
	@echo "SRC=$(MODULE_OBJECTS)"
	@echo "PWD=$(PWD)"
