THEOS_PACKAGE_DIR_NAME = debs
TARGET = :clang
ARCHS = armv7 armv7s arm64
DEBUG = 1

include theos/makefiles/common.mk

TWEAK_NAME = DarkPhotos
DarkPhotos_FILES = DarkPhotos.xm
DarkPhotos_FRAMEWORKS = UIKit
DarkPhotos_PRIVATE_FRAMEWORKS = PhotosUI

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete
internal-after-install::
	install.exec "killall -9 backboardd"
