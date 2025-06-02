# Cadence Genus(TM) Synthesis Solution, Version 21.15-s080_1, built Sep 23 2022 12:57:55

# Date: Wed Feb 26 14:25:00 2025
# Host: cn90.it.auth.gr (x86_64 w/Linux 5.14.0-503.23.2.el9_5.x86_64) (12cores*12cpus*1physical cpu*AMD EPYC 7352 24-Core Processor 512KB)
# OS:   Rocky Linux release 9.5 (Blue Onyx)

source run5.tcl
set_db design_power_effort high
set_db opt_leakage_to_dynamic_ratio 1.0
set_db use_multibit_cells true
read_hdl picorv32.v
set_db lp_insert_clock_gating true
elaborate picorv32
check_design
read_sdc constraints10.sdc
check_timing_intent
set_db / .use_scan_seqs_for_non_dft false
syn_generic
syn_map
syn_opt
report_timing
report_area
report_gates
report_clock_gating
report_power
write_hdl> design.v
write_sdc> constarints.sd
write_script>constraints.g
write_design -innovus  picorv32
exit
