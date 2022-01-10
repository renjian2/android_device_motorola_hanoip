#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from hanoip device
$(call inherit-product, device/motorola/hanoip/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hanoip
PRODUCT_NAME := twrp_hanoip
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(60)
PRODUCT_MANUFACTURER := motorola
