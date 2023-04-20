################################################################################
#
# stereoterm-shell package
#
################################################################################

STEREO_TERMINAL_SHELL_VERSION = 0.1
STEREO_TERMINAL_SHELL_SITE = package/stereoterm-shell/src
STEREO_TERMINAL_SHELL_SITE_METHOD = local
STEREO_TERMINAL_SHELL_DEPENDENCIES = ncurses

define STEREO_TERMINAL_SHELL_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define STEREO_TERMINAL_SHELL_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/stereoterm-shell  $(TARGET_DIR)/usr/bin/stereoterm-shell
endef

$(eval $(generic-package))