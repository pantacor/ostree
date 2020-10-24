LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ostree
LOCAL_DESCRIPTION := ostree

LOCAL_LIBRARIES := \
	e2fsprogs \
	liblzma \
	zlib \
	gpgme \
	glib \
	$(NULL)

LOCAL_EXPORT_LDLIBS = -l:libostree.a

LOCAL_AUTOTOOLS_VERSION := 2.0.4
LOCAL_AUTOTOOLS_CONFIGURE_ARGS := \
	YACC="bison -y" \
	--with-gpgme-prefix=$(TARGET_OUT_STAGING)/usr \
	--enable-rofiles-fuse=no \
	$(NULL)
LOCAL_AUTOTOOLS_CONFIGURE_ENV := 


#LOCAL_CLEAN_DIRS := $(call local-get-build-dir)/usr/share/ $(call local-get-build-dir)/usr/include/

include $(BUILD_AUTOTOOLS)

