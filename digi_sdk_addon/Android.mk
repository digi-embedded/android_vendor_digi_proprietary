-include $(TOPDIR)device/digi-addons/digi_sdk_addon/src_available.mk

ifneq ($(DIGI_SDK_ADDON_SRC_AVAILABLE),true)

LOCAL_PATH := $(call my-dir)

# Copy libdigiapi_jni.so to /system/lib/
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdigiapi_jni
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_BUILT_MODULE_STEM := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
include $(BUILD_PREBUILT)

# Copy com.digi.android.jar to /system/framework/
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.digi.android
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_JAVA_LIBRARIES)
LOCAL_MODULE_SUFFIX := $(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_BUILT_MODULE_STEM := $(LOCAL_MODULE)$(COMMON_JAVA_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

# Copy com.digi.android.xml to /system/etc/permissions/
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.digi.android.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif
