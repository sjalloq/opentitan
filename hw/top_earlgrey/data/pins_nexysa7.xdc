# This file has been prepared by Digilent and edited for use in this project.
# Upstream source:
# https://github.com/Digilent/digilent-xdc/blob/master/Nexys-Video-Master.xdc

## Clock Signal
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports { IO_CLK }]; #IO_L13P_T2_MRCC_34 Sch=sysclk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports IO_CLK]

## Clock Domain Crossings
create_generated_clock -name clk_50_unbuf -source [get_pin clkgen/pll/CLKIN1] [get_pin clkgen/pll/CLKOUT0]
create_generated_clock -name clk_48_unbuf -source [get_pin clkgen/pll/CLKIN1] [get_pin clkgen/pll/CLKOUT1]
set_clock_groups -group clk_50_unbuf -group clk_48_unbuf -asynchronous

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IO_SDCK_IBUF]; # SDCK clock to be ignored

## LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { IO_GP8 }]; #IO_L15P_T2_DQS_13 Sch=led[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { IO_GP9 }]; #IO_L15N_T2_DQS_13 Sch=led[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { IO_GP10 }]; #IO_L17P_T2_13 Sch=led[2]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { IO_GP11 }]; #IO_L17N_T2_13 Sch=led[3]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { IO_GP12 }]; #IO_L14N_T2_SRCC_13 Sch=led[4]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { IO_GP13 }]; #IO_L16N_T2_13 Sch=led[5]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { IO_GP14 }]; #IO_L16P_T2_13 Sch=led[6]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { IO_GP15 }]; #IO_L5P_T0_13 Sch=led[7]


## Buttons
set_property -dict { PACKAGE_PIN C12  IOSTANDARD LVCMOS33 } [get_ports { IO_RST_N }]; #IO_L12N_T1_MRCC_35 Sch=cpu_resetn


## Switches
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { IO_GP0 }]; #IO_L22P_T3_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16  IOSTANDARD LVCMOS33 } [get_ports { IO_GP1 }]; #IO_25_16 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13  IOSTANDARD LVCMOS33 } [get_ports { IO_GP2 }]; #IO_L24P_T3_16 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15  IOSTANDARD LVCMOS33 } [get_ports { IO_GP3 }]; #IO_L24N_T3_16 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17  IOSTANDARD LVCMOS33 } [get_ports { IO_GP4 }]; #IO_L6P_T0_15 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18  IOSTANDARD LVCMOS33 } [get_ports { IO_GP5 }]; #IO_0_15 Sch=sw[5]
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { IO_GP6 }]; #IO_L19P_T3_A22_15 Sch=sw[6]
set_property -dict { PACKAGE_PIN R13  IOSTANDARD LVCMOS33 } [get_ports { IO_GP7 }]; #IO_25_15 Sch=sw[7]


## Pmod header JB
set_property -dict { PACKAGE_PIN D14  IOSTANDARD LVCMOS33 DRIVE 8 SLEW FAST } [get_ports { IO_USB_DP0 }]; #IO_L21P_T3_DQS_34 Sch=jb_p[1]
set_property -dict { PACKAGE_PIN F16  IOSTANDARD LVCMOS33 DRIVE 8 SLEW FAST } [get_ports { IO_USB_DN0 }]; #IO_L21N_T3_DQS_34 Sch=jb_n[1]
set_property -dict { PACKAGE_PIN G16  IOSTANDARD LVCMOS33 } [get_ports { IO_USB_PULLUP0 }]; #IO_L19P_T3_34 Sch=jb_p[2]
set_property -dict { PACKAGE_PIN H14  IOSTANDARD LVCMOS33 } [get_ports { IO_USB_SENSE0 }]; #IO_L19N_T3_VREF_34 Sch=jb_n[2]


## UART
set_property -dict { PACKAGE_PIN D4  IOSTANDARD LVCMOS33 } [get_ports { IO_UTX }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=uart_rx_out
set_property -dict { PACKAGE_PIN C4   IOSTANDARD LVCMOS33 } [get_ports { IO_URX }]; #IO_L14P_T2_SRCC_14 Sch=uart_tx_in


## DPTI/DSPI  REVISIT: on the A7 this interface doesn't exist so stick it on a PMOD JA for now.
#set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { prog_clko }]; #IO_L13P_T2_MRCC_14 Sch=prog_clko
set_property -dict { PACKAGE_PIN C17    IOSTANDARD LVCMOS33 } [get_ports { IO_DPS0 }]; #IO_L11P_T1_SRCC_14 Sch=prog_d0/sck
set_property -dict { PACKAGE_PIN D18    IOSTANDARD LVCMOS33 } [get_ports { IO_DPS1 }]; #IO_L19P_T3_A10_D26_14 Sch=prog_d1/mosi
set_property -dict { PACKAGE_PIN E18    IOSTANDARD LVCMOS33 } [get_ports { IO_DPS2 }]; #IO_L22P_T3_A05_D21_14 Sch=prog_d2/miso
set_property -dict { PACKAGE_PIN G17    IOSTANDARD LVCMOS33 } [get_ports { IO_DPS3 }]; #IO_L18P_T2_A12_D28_14 Sch=prog_d3/ss
set_property -dict { PACKAGE_PIN D17    IOSTANDARD LVCMOS33 } [get_ports { IO_DPS4 }]; #IO_L24N_T3_A00_D16_14 Sch=prog_d[4]
set_property -dict { PACKAGE_PIN E17    IOSTANDARD LVCMOS33 PULLTYPE PULLUP } [get_ports { IO_DPS5 }]; #IO_L24P_T3_A01_D17_14 Sch=prog_d[5]
set_property -dict { PACKAGE_PIN F18    IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports { IO_DPS6 }]; #IO_L20P_T3_A08_D24_14 Sch=prog_d[6]
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports { IO_DPS7 }]; #IO_L23N_T3_A02_D18_14 Sch=prog_d[7]
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { prog_oen }]; #IO_L16P_T2_CSI_B_14 Sch=prog_oen
#set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { prog_rdn }]; #IO_L5P_T0_D06_14 Sch=prog_rdn
#set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { prog_rxen }]; #IO_L21P_T3_DQS_14 Sch=prog_rxen
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { prog_siwun }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=prog_siwun
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { prog_spien }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=prog_spien
#set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { prog_txen }]; #IO_L13N_T2_MRCC_14 Sch=prog_txen
#set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { prog_wrn }]; #IO_L5N_T0_D07_14 Sch=prog_wrn


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
