# Copyright 2012 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../include

LOCAL_SRC_FILES:= \
	scsi_ioctls.c \
	crc32.c \
	gpt.c \
	efivars_sysfs.c \
	unparse_path.c \
	efichar.c \
	disk.c \
	efivars_procfs.c \
	efi.c \

ifeq ($(TARGET_KERNEL_ARCH),x86_64)
LOCAL_CFLAGS += -DFORCE_32BIT_EBM_RUN_ON_64BIT_OS
endif

LOCAL_MODULE := libefibootmgr
LOCAL_STATIC_LIBRARIES := libpci_static

include $(BUILD_STATIC_LIBRARY)
