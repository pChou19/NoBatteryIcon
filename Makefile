THEOS_DEVICE_IP = 192.168.1.24

include theos/makefiles/common.mk

export ARCHS = armv7

TWEAK_NAME = NoBatteryIcon
NoBatteryIcon_FILES = Tweak.xm
NoBatteryIcon_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
