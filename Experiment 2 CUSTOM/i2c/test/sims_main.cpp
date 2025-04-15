// sim_main.cpp
#include "Vtop.h"
#include "verilated.h"
#include "verilated_vcd_c.h"  // For GTKWave waveform output

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vtop* top = new Vtop;

    // Open a VCD file (waveform output)
    VerilatedVcdC tfp;
    top->trace(&tfp, 99);  // First argument is the level of tracing
    tfp.open("waves.vcd");

    // Simulation loop
    for (int i = 0; i < 1000; i++) {
        top->clk = !top->clk;  // Toggle clock
        top->eval();           // Evaluate the Verilog design
        tfp.dump(i);           // Dump current state to VCD file
    }

    tfp.close();
    delete top;
    return 0;
}
