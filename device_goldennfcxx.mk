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

# Inherit common configuration for all Samsung Golden variants
$(call inherit-product-if-exists, device/samsung/golden-common/device_golden-common.mk)

# Inherit the proprietary vendors blobs for Samsung Golden.
$(call inherit-product-if-exists, vendor/samsung/golden/golden-vendor.mk)

# NFC
PRODUCT_PACKAGES += \
	libnfc \
	libnfc_jni \
	Nfc \
	Tag

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# file that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
	NFCEE_ACCESS_PATH := device/samsung/goldennfc/nfc/nfcee_access.xml
else
	NFCEE_ACCESS_PATH := device/samsung/goldennfc/nfc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.samsunggoldennfcxx.rc:root/init.samsunggoldennfcxx.rc \
    $(LOCAL_PATH)/rootdir/ueventd.samsunggoldennfcxx.rc:root/ueventd.samsunggoldennfcxx.rc

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/AT/manuf_id.cfg:system/etc/AT/manuf_id.cfg \
    $(LOCAL_PATH)/configs/etc/AT/model_id.cfg:system/etc/AT/model_id.cfg \
    $(LOCAL_PATH)/configs/etc/AT/system_id.cfg:system/etc/AT/system_id.cfg
