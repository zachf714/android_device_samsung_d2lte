#
# Copyright (C) 2014 The CyanogenMod Project
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

## Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/d2lte/d2lte-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/d2lte/overlay

# Boot animation and screen size
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

#RomDashBoard Config
PRODUCT_COPY_FILES += \
	device/samsung/d2lte/prebuilt/app/ROMdBDevTool-v1.0.7.apk:system/app/ROMdBDevTool-v1.0.7.apk

# RomDashboard Props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.romdb.hash=6e06eada2e777bea33a75227bdec51dcffe2d95f59dface5253aaf49c1255c84 \
    ro.romdb.autosubscribe=y \
    ro.romdb.version=49 \
    ro.romdb.paranoid=y

#Verizon Properties
PRODUCT_COPY_FILES += \
	device/samsung/d2lte/prebuilt/app/VerizonSSO.apk:system/blobs/vzw/app/VerizonSSO.apk \
	device/samsung/d2lte/prebuilt/etc/permissions/com.vzw.hardware.ehrpd.xml:system/blobs/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml \
	device/samsung/d2lte/prebuilt/etc/permissions/com.vzw.hardware.lte.xml:system/blobs/vzw/etc/permissions/com.vzw.hardware.lte.xml \
	device/samsung/d2lte/prebuilt/etc/permissions/com.vzw.vzwapnlib.xml:system/blobs/vzw/etc/permissions/com.vzw.vzwapnlib.xml \
	device/samsung/d2lte/prebuilt/lib/libmotricity.so:system/blobs/vzw/lib/libmotricity.so

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/d2lte/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/samsung/d2lte/audio/audio_policy.conf:system/etc/audio_policy.conf

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/d2lte/keylayout/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    device/samsung/d2lte/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/samsung/d2lte/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/d2lte/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    device/samsung/d2lte/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/d2lte/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/d2lte/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Logo
PRODUCT_COPY_FILES += \
    device/samsung/d2lte/initlogo.rle:root/initlogo.rle

# Media configuration
PRODUCT_COPY_FILES += \
    device/samsung/d2lte/media/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/d2lte/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/d2lte/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libnetcmdiface

# common msm8960
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)
