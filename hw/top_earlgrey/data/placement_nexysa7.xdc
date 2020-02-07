# This file is a copy of placement.xdc and updated with valid BRAM locations for the A7100T.
#
# Any change in ROM instances path should be updated in following two files
# 1. hw/top_earlgrey/data/placement.xdc and
# 2. hw/top_earlgrey/util/vivado_hook_opt_design_post.tcl
set_property LOC RAMB36_X0Y30 [get_cells -hierarchical -filter { NAME =~  "*rom_rom*dout_o_reg_0" && PRIMITIVE_TYPE =~ BMEM.*.* }]
set_property LOC RAMB36_X0Y31 [get_cells -hierarchical -filter { NAME =~  "*rom_rom*dout_o_reg_1" && PRIMITIVE_TYPE =~ BMEM.*.* }]
