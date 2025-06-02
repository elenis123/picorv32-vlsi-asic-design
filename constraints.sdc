
# Clock with 50% duty cycle and 200 MHz frequency
create_clock -name clk -period 5 -waveform {0 2.5}  [get_ports clk]

# Latency of the clock at 250 ps
set_clock_latency 0.25 [get_clocks clk]

# Uncertainty of the clock: 15 ps for setup and 10 ps for hold
set_clock_uncertainty  -setup 0.015 [get_clocks clk]
set_clock_uncertainty  -hold 0.01 [get_clocks clk]

# Transition time of the clock: 1% of the period (50 ps)
set_clock_transition -fall 0.05 [get_clocks clk]
set_clock_transition -rise 0.05 [get_clocks clk]

# Output delay 
set_output_delay -network_latency_included -max -clock clk  0.75  [get_clocks clk] [all_outputs]
set_output_delay -network_latency_included -min  -clock clk 0.25  [get_clocks clk] [all_outputs]

# Capacitance load for setup analysis: 0.4 pF
set_load 0.4 -max [all_outputs]

# Capacitance load for hold analysis: 0.05 pF
set_load 0.05  -min [all_outputs]

# Input delay for setup analysis: 0.75 ns
set_input_delay -network_latency_included -max -clock clk 0.75 [get_clocks clk] [all_inputs]

# Input delay for hold analysis: 0.25 ns
set_input_delay -network_latency_included -min -clock clk 0.25 [get_clocks clk] [all_inputs]

# Select BUFX4 cell for setup analysis
set_driving_cell -lib_cell BUFX4  -max  [all_inputs]
# Select BUFX8 cell for hold analysis
set_driving_cell -lib_cell BUFX8  -min  [all_inputs]