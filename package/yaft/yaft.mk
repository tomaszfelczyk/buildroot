################################################################################
#
# yaft
#
################################################################################

YAFT_VERSION = 0.2.9
YAFT_SOURCE = v$(YAFT_VERSION).tar.gz
YAFT_SITE = https://github.com/uobikiemukot/yaft/archive
YAFT_CFLAGS = $(TARGET_CFLAGS)
YAFT_LICENSE = MIT
YAFT_LICENSE_FILES = LICENSE
YAFT_DEPENDENCIES = host-pkgconf

# Add cross-compilation flags
YAFT_MAKE_OPTS = CC="$(TARGET_CC)" \
                 CFLAGS="$(TARGET_CFLAGS)" \
                 LDFLAGS="$(TARGET_LDFLAGS)"

# Add a rule to build mkfont_bdf for the host
define HOST_YAFT_BUILD_CMDS
    $(MAKE) -C $(@D) mkfont_bdf CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
endef

define YAFT_BUILD_CMDS
	# Call the HOST_YAFT_BUILD_CMDS to build mkfont_bdf for the host
    $(call HOST_YAFT_BUILD_CMDS)
    $(MAKE) -C $(@D) yaft $(YAFT_MAKE_OPTS)
endef

define YAFT_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/yaft $(TARGET_DIR)/usr/bin/yaft
endef

$(eval $(generic-package))