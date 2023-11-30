# Cadence Genus(TM) Synthesis Solution, Version 17.22-s017_1, built Apr  1 2018

# Date: Fri Nov 24 15:38:02 2023
# Host: EKL-DT-36 (x86_64 w/Linux 2.6.32-573.el6.x86_64) (2cores*2cpus*1physical cpu*Intel(R) Core(TM)2 Duo CPU E7500 @ 2.93GHz 3072KB)
# OS:   Red Hat Enterprise Linux Server release 6.7 (Santiago)

read_libs lib/slow.lib
read_hdl ALU_32Bit.v
elaborate
write_hdl > elaborate_file.v
gui_show
syn_gen
syn_map
syn_opt
write_hdl > syn_opt_file.v
gui_show
report_timing -unconstrained
report_gate
report_power
exit
