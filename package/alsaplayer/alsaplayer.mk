################################################################################
#
# alsaplayer
#
################################################################################

ALSAPLAYER_VERSION = 0.99.81
ALSAPLAYER_SOURCE = alsaplayer-$(ALSAPLAYER_VERSION).tar.gz
ALSAPLAYER_SITE = https://alsaplayer.sourceforge.net
ALSAPLAYER_LICENSE = GPL-3.0+
ALSAPLAYER_LICENSE_FILES = COPYING
ALSAPLAYER_CFLAGS = $(TARGET_CFLAGS) -DEMBEDDED
ALSAPLAYER_AUTORECONF = YES
ALSAPLAYER_DEPENDENCIES = host-pkgconf alsa-lib libmad libogg libvorbis

ALSAPLAYER_CONF_OPTS = \
	--prefix=/usr --enable-mad \
	--enable-shared=no \
	--disable-option-checking \
	--disable-audiofiletest \
	--disable-vorbistest \
	--disable-oggtest \
	--disable-oss \
	--disable-nas \
	--disable-nls \
	--disable-jack \
	--disable-gtk2 \
	--disable-esd \
	--disable-opengl

# # Build and installation rules
define ALSAPLAYER_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define ALSAPLAYER_INSTALL_TARGET_CMDS
    $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
endef

# Hook package into Buildroot infrastructure
$(eval $(autotools-package))