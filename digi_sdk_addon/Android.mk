-include $(TOPDIR)device/digi-addons/digi_sdk_addon/src_available.mk

ifneq ($(DIGI_SDK_ADDON_SRC_AVAILABLE),true)

LOCAL_PATH := $(call my-dir)

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

# Digi API stubs
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.digi.android.stubs
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_JAVA_LIBRARIES)
LOCAL_MODULE_SUFFIX := $(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
include $(BUILD_PREBUILT)

# Transfer the stubs jar to the proper place (intermediates/classes-header.jar)
# so the applications depending on it, are able to find it.
com_digi_android_stubs_classes := $(common_header_jar)
com_digi_android_stubs_src := $(my_src_jar)
$(com_digi_android_stubs_classes): $(com_digi_android_stubs_src)
	$(transform-prebuilt-to-target)

# Copy com.digi.android.xml to /system/etc/permissions/
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.digi.android.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif
