# "axi_quad_spi Hangs Petalinux."

## Goal.
To use the axi_quad_spi v3.2 IP with either [this linux driver](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842255/Linux+SPI+Driver#LinuxSPIDriver-DevicetreeSettings) or a manually written one if needed. I'm trying to interact with multiple ICs as SPI Slaves for configuring them and receiving their data. Petalinux is required for multiple other seperate and threaded applications.

## Vivado Project.
<img src="https://github.com/ZeHolyQofPower/axi_quad_spi_and_petalinux/blob/main/block_diagram.png" width="800" height="400"/>

First round, I added, configured, and connected all components and ports *except* "axi_quad_spi_0". I went through the complete process to boot, and everything worked exactly as expected. 

Second round I added the block, connected it, mapped it to memory, and went through the same Vivado generate and export process.

## Petalinux Project.

First round, I created the project from template, configured the root filesystem to EXT4, configured the kernel to include the Xilinx common SPI controller, built, and packaged for SD. With a paritioned microSD and expanded filesystem, everything booted and functioned exactly as expected. 

Second round, I sourced the new xsa, defined spidev in the device tree, rebuilt, repackaged, reflashed an expanded filesystem; while booting, the Petalinux kernel hangs.

[//]: # ( TODO Maybe mention the four memory warnings I get while packaging? )
[//]: # ( <img src="https://github.com/ZeHolyQofPower/axi_quad_spi_and_petalinux/blob/main/package_warnings.png" width="400" height="400"/> )

## Result:

I've isolated my problem to the axi_quad_spi ip block under Petalinux. I've tried many different things but the kernel always hangs at the same spot. Man there is something simple I don't understand or am missing and it's driving me crazy.

Attached is a pic of my block diagram, my modification to the device tree, and my bootlog.

Additionally, here is a public [github repo](https://github.com/ZeHolyQofPower/axi_quad_spi_and_petalinux) of my vivado and petalinux isolation projects.
