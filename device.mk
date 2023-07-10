#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Camera
PRODUCT_PACKAGES += \
    libMegviiFacepp-0.5.2 \
    libmegface

# Kernel
TARGET_KERNEL_DIR ?= device/xiaomi/lisa-kernel
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-statix

# Overlays-RRO
PRODUCT_PACKAGES += \
    lisaCNWifiOverlay \
    lisaGLWifiOverlay \
    lisaINWifiOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/audio_platform_info_yupikqrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_yupikqrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_mixer_paths_yupikqrd.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_platform_info.xml

#Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/yupik/media_codecs_system_default_yupik.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_system_default_yupik.xml

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.lisa.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.lisa.rc

# Variant Properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,odm.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_ODM)) \
    $(call find-copy-subdir-files,product.*.prop,$(LOCAL_PATH)/props/,$(TARGET_COPY_OUT_PRODUCT))

# WiFi Display
PRODUCT_SYSTEM_PROPERTIES += \
    vendor.sys.video.disable.ubwc=1

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/lisa/lisa-vendor.mk)
