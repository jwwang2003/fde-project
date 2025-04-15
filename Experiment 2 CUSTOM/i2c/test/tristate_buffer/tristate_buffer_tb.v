`timescale 1us / 1ns  // Set timescale to 1 microsecond per time unit, 1 nanosecond precision

module tristate_buffer_tb;

    // Declare testbench signals
    reg         clk;
    reg         rst;       // Synchronous reset
    reg         nReset;    // Asynchronous reset (active low)
    reg         ena;       // Core enable
    reg  [15:0]  clk_cnt;   // Clock prescale value
    reg         signal;    // Trigger signal for FET control
    reg         in;        // External input signal

    // Outputs from the DUT
    wire        out;       // Always pulled LOW
    wire        oen;       // Output enable (driving the FET)
    wire        doen;      // Delayed oen
    wire        dSignal;   // Delayed signal for buffer
    wire        sSignal;   // Stable signal after filtering

    // Debugging...
    wire  [13:0] filter_cnt;
    wire sample_trigger;

    // Instantiate the tristate_buffer module (Device Under Test)
    tristate_buffer dut (
        .clk(clk),
        .rst(rst),
        .nReset(nReset),
        .ena(ena),
        .clk_cnt(clk_cnt),
        .signal(signal),
        .in(in),
        .out(out),
        .oen(oen),
        .doen(doen),
        .dSignal(dSignal),
        .sSignal(sSignal),

        // Debugging...
        .filter_cnt(filter_cnt),
        .sample_trigger(sample_trigger)
    );

    // Clock generation: 20µs period (10µs high, 10µs low)
    // Reflect the 
    initial begin
        in = 0;
        clk = 0;
        forever #10 clk = ~clk;  // 10 time units = 10 µs
    end

    // Generate simulation dump for waveform viewing (optional)
    initial begin
        $dumpfile("tb_tristate_buffer.vcd");
        $dumpvars(0, tristate_buffer_tb);
    end

    // Main stimulus block
    initial begin
        // Initialize signals
        rst     = 1;         // Assert synchronous reset
        nReset  = 0;         // Assert asynchronous reset (active low)
        ena     = 0;         // Disable core initially
        clk_cnt = 16'd4;     // Set initial clock prescale value
        signal  = 0;         // Initial trigger off
        in      = 0;         // External input low
        
        // Wait for a few clock cycles and release asynchronous reset
        #12;                
        nReset = 1;         // Deassert asynchronous reset

        // Apply synchronous reset for one clock cycle
        #10;
        rst = 0;            // Deassert synchronous reset
        
        // Enable the core operation
        ena = 1;
        
        // Stimulate external "in" signal
        #20;
        in = 1;
        #20;
        in = 0;
        #20;
        in = 1;
        #40;
        in = 0;
        
        // Toggle the "signal" input to control the FET
        #10;
        signal = 1;
        #10;
        signal = 0;
        
        // Change clk_cnt value to test prescaling behavior
        #50;
        clk_cnt = 5'd15;
        
        // Disable and then re-enable the core
        #30;
        ena = 0;
        #30;
        ena = 1;
        
        // Additional stimulus (repeat toggling of inputs)
        #40;
        in = 1;
        #20;
        in = 0;
        #20;
        signal = 1;
        #40;
        signal = 0;
        
        // End simulation
        #50;
        $finish;
    end

endmodule
