#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 13.1.4 Build 182 03/12/2014 SJ Full Version
#
#************************************************************

# Copyright (C) 1991-2014 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.





# Clock constraints



create_clock -name "SYS_CLK_IN" -period 10.000ns [get_ports {SYS_CLK_1}]
create_clock -name "gxb_clk" 	  -period 8.000ns  [get_ports {SYS_CLK_3}]

create_generated_clock -name CLK_200MHz -source {alt_pll_inst|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 1 -multiply_by 2 {alt_pll_inst|altpll_component|auto_generated|pll1|clk[0]}
create_generated_clock -name CLK_125MHz -source {alt_pll_inst|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 4 -multiply_by 5 {alt_pll_inst|altpll_component|auto_generated|pll1|clk[1]}
create_generated_clock -name CLK_100MHz -source {alt_pll_inst|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 1 -multiply_by 1 {alt_pll_inst|altpll_component|auto_generated|pll1|clk[2]}
create_generated_clock -name CLK_50MHz  -source {alt_pll_inst|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 2 -multiply_by 1 {alt_pll_inst|altpll_component|auto_generated|pll1|clk[3]}
#create_generated_clock -name CLK_40MHz  -source {alt_pll_inst|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 2 {alt_pll_inst|altpll_component|auto_generated|pll1|clk[4]}




# BS constraints
create_clock  -period 10.000 {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst1|SHIFT_latch}
create_clock  -period 10.000 {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst2|SHIFT_latch}
create_clock  -period 10.000 {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst3|SHIFT_latch}
create_clock  -period 10.000 {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst4|SHIFT_latch}
create_clock -name {LBNE_Registers:LBNE_Registers_inst|reg7_o[12]} -period 10.000 {LBNE_Registers:LBNE_Registers_inst|reg7_o[12]}






# Data constraints

set_input_delay  -clock CLK_200MHz  1.5  {ADC_FD*}
set_input_delay  -clock CLK_200MHz  5    {ADC_FE*}
#set_output_delay -min  -clock_fall   -clock CLK_200MHz  -5    [get_ports {ADC_CLK*}]
#set_output_delay -min  -clock CLK_100MHz  10    [get_ports {ADC_CLK_STRB*}]
set_input_delay -clock  CLK_50MHz   10   {I2C_*}

# tsu/th constraints

# tco constraints




set_false_path -from {LBNE_Registers:LBNE_Registers_inst|reg5_o[0]} -to [get_ports {DAC_CNTL[0]}]
set_false_path -from {LBNE_TST_PULSE:LBNE_TST_PULSE_inst|TP_EN} -to [get_ports {DAC_CNTL[0]}]
set_false_path -from [get_ports {SFL_EPCS:SFL_EPCS_inst|ADV_SFL:ADV_SFL_inst|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0}] -to {SFL_EPCS:SFL_EPCS_inst|*}
set_false_path -from {alt_pll_inst|altpll_component|auto_generated|pll1|clk[3]} -to {alt_pll_inst|altpll_component|auto_generated|pll1|clk[0]}
set_false_path -from [get_clocks {CLK_50MHz}] -to [get_clocks {CLK_200MHz}]
set_false_path -from {LBNE_Registers:LBNE_Registers_inst|reg0_o[0]} -to {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst1|WRD_CNT*}
set_false_path -from {LBNE_Registers:LBNE_Registers_inst|reg0_o[0]} -to {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst1|SHIFT_CNT*}
set_false_path -from {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|LBNE_ASIC_DATA_V3:LBNE_ASIC_DATA_V3_inst4|CHN_select_s*} -to {ADC_FIFO:ADC_FIFO_inst|dcfifo:dcfifo_component|dcfifo_3tf1:auto_generated|altsyncram_4411:fifo_ram|ram_block11a0~porta_datain_reg*}

set_false_path -from [get_ports {altera_reserved_tdi}] -to {SFL_EPCS:SFL_EPCS_inst|ADV_SFL:ADV_SFL_inst|altserial_flash_loader:altserial_flash_loader_component|alt_sfl_enhanced:\ENHANCED_PGM:sfl_inst_enhanced|lpm_shiftreg:ncso_reg|dffs[7]}
set_false_path -from [get_ports {altera_reserved_tck}] -to {SFL_EPCS:SFL_EPCS_inst|ADV_SFL:ADV_SFL_inst|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK}
set_false_path -from [get_ports {BRD_ID[0]}] -to {I2C_slave_32bit:I2C_slave_inst|I2C_data[16]}
set_false_path -from {LBNE_ASIC_CNTRL:LBNE_ASIC_CNTRL_inst|ADC_CLK} -to [get_ports {ADC_CLK_STRB_L}]
set_false_path -from {alt_pll_inst|altpll_component|auto_generated|pll1|clk[3]} -to [get_ports {MISC_IO[2]}]
set_false_path -from {LBNE_Registers:LBNE_Registers_inst|reg6_o[0]} -to [get_ports {ADC_CLK[0]}]
set_false_path -from {LBNE_ASIC_RDOUT_V2:LBNE_ASIC_RDOUT_inst|CLK_select_s[0]} -to [get_ports {ADC_CLK[0]}]

# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty


# tpd constraints
report_ucp -summary