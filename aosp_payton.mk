#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common havoc stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/aosp/config/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device
$(call inherit-product, device/motorola/payton/device.mk)

# PE stuff	
TARGET_GAPPS_ARCH := arm64	
TARGET_BOOT_ANIMATION_RES := 1080

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.sdm660

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    libcutils \
    bootctrl.sdm660 \
    libgptutils \
    libz

# TWRP
ifeq ($(WITH_TWRP),true)
    $(call inherit-product, device/motorola/payton/twrp/twrp.mk)
else
    TARGET_RECOVERY_FSTAB := device/motorola/sdm660-common/rootdir/etc/fstab.qcom
endif

# Device identifiers
PRODUCT_DEVICE := payton
PRODUCT_NAME := aosp_payton
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto X4
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := payton

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=payton \
        PRIVATE_BUILD_DESC="payton-user 9 PPW29.69-39-1 baeeff release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/payton/payton:9/PPW29.69-39-1/baeeff:user/release-keys
