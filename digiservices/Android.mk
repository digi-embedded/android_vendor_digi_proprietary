-include $(TOPDIR)frameworks/opt/digiservices/src_available.mk

ifneq ($(DIGI_SERVICES_SRC_AVAILABLE),true)

LOCAL_PATH := $(call my-dir)

# Copy libdigiservices.so to /system/lib/
include $(CLEAR_VARS)
LOCAL_MODULE := libdigiservices
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := libsocketcan
LOCAL_SRC_FILES_32 := $(LOCAL_MODULE)-arm32$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_64 := $(LOCAL_MODULE)-arm64$(LOCAL_MODULE_SUFFIX)
include $(BUILD_PREBUILT)

# Build digiservices.jar from the static library
include $(CLEAR_VARS)
LOCAL_MODULE := digiservices
LOCAL_REQUIRED_MODULES := services RXTXcomm CloudConnectorAndroid
LOCAL_STATIC_JAVA_LIBRARIES := staticdigiservices
include $(BUILD_JAVA_LIBRARY)
include $(CLEAR_VARS)
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := staticdigiservices:digiservices.jar
include $(BUILD_MULTI_PREBUILT)

# Copy digiservices.xml to /system/etc/permissions/
include $(CLEAR_VARS)
LOCAL_MODULE := digiservices.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif
