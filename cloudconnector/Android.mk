-include $(TOPDIR)frameworks/opt/cloudconnector/se/android/src_available.mk

ifneq ($(CLOUD_CONNECTOR_SRC_AVAILABLE),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := CloudConnectorAndroid
LOCAL_STATIC_JAVA_LIBRARIES := libcloudconnector
include $(BUILD_JAVA_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := libcloudconnector:CloudConnectorAndroid.jar
include $(BUILD_MULTI_PREBUILT)

endif
