##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESDCHAR_VERSION = a6eb6e9457e2b83acf5c2b054f20e2f90a9f94bc
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-adityaganeshcu2k.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES
AESDCHAR_GIT_SUBDIRS = aesd-char-driver

define AESDCHAR_INSTALL_TARGET_CMDS
	# Install aesdsocket binary
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_load\
		$(TARGET_DIR)/usr/bin
		
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_unload\
		$(TARGET_DIR)/usr/bin

	# Install startup script
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop.sh \
		$(TARGET_DIR)/etc/init.d/S97aesdchar
endef

$(eval $(generic-package))
$(eval $(kernel-module))
