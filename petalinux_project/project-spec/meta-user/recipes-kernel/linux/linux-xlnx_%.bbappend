FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg"
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-04-17-22-47-00.cfg \
            file://user_2024-04-23-19-26-00.cfg \
            "

