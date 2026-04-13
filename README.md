# Quick start

1) Run git submodule update --init --recursive
2) Install gcc-or1k-elf and Icarus Verilog over apt.
3) Compile VPI under rtl/verilog/adv_debug_sys/Software/adv_jtag_bridge/sim_lib/icarus entering make
4) Go to backend/std and run bash configure.sh
5) Go to sim/run and run generate_bench
6) Execute run_bench ../../sw/uart/uart.hex