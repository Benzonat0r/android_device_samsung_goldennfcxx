#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
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

# Inherit CM common GSM/Phone stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/goldennfcxx/device_goldennfcxx.mk)

# Device identifier
PRODUCT_DEVICE := goldennfcxx
PRODUCT_NAME := cm_goldennfcxx
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8190N
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint and ID
BUILD_ID := TRIANA00$(shell date -u +%Y%m%d)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_goldennfcxx BUILD_FINGERPRINT=cyanogenmod/cm_goldennfcxx/golden:4.2.2/$(BUILD_ID) PRIVATE_BUILD_DESC="GT-I8190N 4.2.2"
