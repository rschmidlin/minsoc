. ${SCRIPT_DIR}/beautify.sh

#Clone missing repositories
cecho "\nImporting required repositories"
execcmd "Clone UART16550 from Github FreeCores" "git clone https://github.com/freecores/uart16550.git ${DIR_TO_INSTALL}/minsoc/rtl/verilog/uart16550"
execcmd "Clone Advanced Debug System from Github FreeCores" "git clone https://github.com/freecores/adv_debug_sys.git ${DIR_TO_INSTALL}/minsoc/rtl/verilog/adv_debug_sys"
execcmd "Clone Ethernet MAC from Github FreeCores" "git clone https://github.com/freecores/ethmac.git ${DIR_TO_INSTALL}/minsoc/rtl/verilog/ethmac"
execcmd "Checkout OR1200 from Opencores" "svn co http://opencores.org/ocsvn/openrisc/openrisc/trunk/or1200 ${DIR_TO_INSTALL}/minsoc/rtl/verilog/or1200"

#Configuring MinSoC
cecho "\nConfiguring MinSoC"
execcmd "cd ${DIR_TO_INSTALL}/minsoc/backend/std"
execcmd "Configuring MinSoC as standard board (simulatable but not synthesizable)" "./configure"
execcmd "cd ${DIR_TO_INSTALL}"

#Compiling and moving adv_jtag_bridge debug modules for simulation
execcmd "cd ${DIR_TO_INSTALL}/minsoc/rtl/verilog/adv_debug_sys/Software/adv_jtag_bridge/sim_lib/icarus"
execcmd "Compiling VPI interface to connect GDB with simulation" "make"
execcmd "cp jp-io-vpi.vpi ${DIR_TO_INSTALL}/minsoc/bench/verilog/vpi"
