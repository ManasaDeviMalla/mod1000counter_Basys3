# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk_100Mhz]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk_100Mhz]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100Mhz]

#7 segment display
set_property PACKAGE_PIN W7 	 [get_ports {seg_out[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[0]}]
set_property PACKAGE_PIN W6 	 [get_ports {seg_out[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[1]}]
set_property PACKAGE_PIN U8 	 [get_ports {seg_out[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[2]}]
set_property PACKAGE_PIN V8 	 [get_ports {seg_out[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[3]}]
set_property PACKAGE_PIN U5 	 [get_ports {seg_out[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[4]}]
set_property PACKAGE_PIN V5 	 [get_ports {seg_out[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[5]}]
set_property PACKAGE_PIN U7 	 [get_ports {seg_out[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[6]}]

set_property PACKAGE_PIN U2 	 [get_ports {Anode_Activate[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[0]}]
set_property PACKAGE_PIN U4 	 [get_ports {Anode_Activate[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[1]}]
set_property PACKAGE_PIN V4 	 [get_ports {Anode_Activate[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[2]}]
set_property PACKAGE_PIN W4 	 [get_ports {Anode_Activate[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anode_Activate[3]}]

##Buttons
set_property PACKAGE_PIN U18 	 [get_ports reset]						
set_property IOSTANDARD LVCMOS33 [get_ports reset]
