# Cadence Genus(TM) Synthesis Solution, Version 21.15-s080_1, built Sep 23 2022 12:57:55

# Date: Mon Feb 24 15:44:52 2025
# Host: cn97.it.auth.gr (x86_64 w/Linux 5.14.0-503.23.2.el9_5.x86_64) (12cores*12cpus*1physical cpu*Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz 28160KB)
# OS:   Rocky Linux release 9.5 (Blue Onyx)

source run.tcl
read_hdl picorv32.v
set_db lp_insert_clock_gating false
elaborate picorv32
check_design
read_sdc constraints.sdc
check_timing_intent
set_db / .use_scan_seqs_for_non_dft false
syn_generic
syn_map
syn_opt
report_area
report_gates
report_timing
report_power
write_hdl> design.v
write_sdc> constarints.sd
write_script>constraints.g
write_design -innovus  picorv32
exit
