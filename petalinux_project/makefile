# TODO rework CLI outputs to user.

build: xsa_refresh
	petalinux-build
#	petalinux-build

xsa_refresh:
	petalinux-config --silentconfig --get-hw-description=../vivado_project/

hw_config_tui:
	petalinux-config --get-hw-description=../vivado_project/

package: build
	petalinux-package --boot --force --fsbl --u-boot --boot-script --boot-device=sd

add_image_to_git_stage:
	git add images/*
	git add project-spec/*
	git add .petalinux/metadata
	git status

device_tree_only:
	petalinux-build -c device-tree
