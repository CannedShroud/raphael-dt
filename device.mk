#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# You should not be here
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/start_dmesg:$(TARGET_COPY_OUT_SYSTEM)/bin/start_dmesg
    
#Set dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/raphael/raphael-vendor.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-ancient

# Properties
-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Permissions
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
   frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
   $(LOCAL_PATH)/configs/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.ar.xml \
   $(LOCAL_PATH)/configs/android.hardware.gamepad.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.gamepad.xml \
   $(LOCAL_PATH)/configs/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vr.high_performance.xml \
   $(LOCAL_PATH)/configs/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.dialer.support.xml \
   $(LOCAL_PATH)/configs/google_build.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/google_build.xml \
   $(LOCAL_PATH)/configs/nexus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/nexus.xml \
   $(LOCAL_PATH)/configs/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/pixel_2016_exclusive.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml

# Binder
PRODUCT_PACKAGES += \
    libhwbinder

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan

PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1 \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss.measurement_corrections@1.1 \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0 \
    android.hardware.gnss.visibility_control@1.0.vendor

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0 \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1 \
    android.hardware.keymaster@4.1.vendor

# Netd
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.2 \
    android.hardware.neuralnetworks@1.2.vendor

#Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2 \
    android.hardware.secure_element@1.2.vendor

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.5 \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2 \
    android.hardware.radio.config@1.2.vendor

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# GoogleCamera
PRODUCT_PACKAGES += \
    GoogleCamera

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/GoogleCamera/privapp-permissions-googlecamera.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-googlecamera.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(LOCAL_PATH)/configs/hotword-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hotword-hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc \
    init.qcom.rc \
    init.recovery.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init-qcril-data.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/init-qcril-data.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sm8150-tavil-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sm8150-tavil-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl.raphael

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.0

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.raphael

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Ril
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# WiFi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# WiFi Display
PRODUCT_PACKAGES += \
    libnl
