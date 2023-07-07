ARM_ATSAM_DIR = protocol/arm_atsam

SRC += $(ARM_ATSAM_DIR)/adc.c
SRC += $(ARM_ATSAM_DIR)/clks.c
SRC += $(ARM_ATSAM_DIR)/d51_util.c
SRC += $(ARM_ATSAM_DIR)/i2c_master.c
ifeq ($(RGB_MATRIX_DRIVER),custom)
  SRC += $(ARM_ATSAM_DIR)/md_rgb_matrix_programs.c
  SRC += $(ARM_ATSAM_DIR)/md_rgb_matrix.c
endif
SRC += $(ARM_ATSAM_DIR)/main_arm_atsam.c

ifndef NO_SR_EXP
	SRC += $(ARM_ATSAM_DIR)/spi_master.c
	SRC += $(ARM_ATSAM_DIR)/shift_register.c
else
	COMPILEFLAGS += -DNO_SR_EXP
endif

SRC += $(ARM_ATSAM_DIR)/startup.c

SRC += $(ARM_ATSAM_DIR)/usb/main_usb.c
SRC += $(ARM_ATSAM_DIR)/usb/udc.c
SRC += $(ARM_ATSAM_DIR)/usb/udi_cdc.c
SRC += $(ARM_ATSAM_DIR)/usb/udi_hid.c
SRC += $(ARM_ATSAM_DIR)/usb/udi_hid_kbd.c
SRC += $(ARM_ATSAM_DIR)/usb/udi_hid_kbd_desc.c
SRC += $(ARM_ATSAM_DIR)/usb/ui.c
SRC += $(ARM_ATSAM_DIR)/usb/usb.c
SRC += $(ARM_ATSAM_DIR)/usb/usb_device_udd.c
ifndef NO_USB2422
SRC += $(ARM_ATSAM_DIR)/usb/usb_hub.c
endif
SRC += $(ARM_ATSAM_DIR)/usb/usb_util.c

ifndef NO_USB2422
	SRC += $(DRIVER_PATH)/usb2422.c
else
	COMPILEFLAGS += -DNO_USB2422
endif

# Search Path
VPATH += $(TMK_DIR)/$(ARM_ATSAM_DIR)
