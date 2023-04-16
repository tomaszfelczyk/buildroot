################################################################################
#
# alsaplayer
#
################################################################################

ALSAPLAYER_VERSION = 0.99.81
ALSAPLAYER_SOURCE = alsaplayer-$(ALSAPLAYER_VERSION).tar.bz2
ALSAPLAYER_SITE = https://alsaplayer.sourceforge.net
ALSAPLAYER_LICENSE = GPL-2.0
ALSAPLAYER_LICENSE_FILES = COPYING
ALSAPLAYER_DEPENDENCIES = alsa-lib libogg libmad libvorbis
ALSAPLAYER_CFLAGS = $(TARGET_CFLAGS)

ALSAPLAYER_CONF_OPTS =  --prefix=$(TARGET_DIR)/usr --disable-nls --disable-jack --disable-gtk2 --disable-esd --disable-opengl --disable-oggvorbis

ALSAPLAYER_CONF_ENV = \
	CFLAGS="$(ALSAPLAYER_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) -lm"


# Build and installation rules
define ALSAPLAYER_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define ALSAPLAYER_INSTALL_TARGET_CMDS
    $(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) -C $(@D) install
endef

# Hook package into Buildroot infrastructure
$(eval $(autotools-package))