module clk_gen_tb;

    reg clk;
    reg nReset;
    reg rst;
    reg ena;
    reg scl_sync;
    reg slave_wait;
    reg [15:0] clk_cnt;
    wire clk_en;

    // Instantiate the clk_gen module
    clk_gen uut (
        .clk(clk),
        .nReset(nReset),
        .rst(rst),
        .ena(ena),
        .scl_sync(scl_sync),
        .slave_wait(slave_wait),
        .clk_cnt(clk_cnt),
        .clk_en(clk_en)
    );

    // Clock generation (50MHz)
    always begin
        #10 clk = ~clk;  // 50MHz clock (period = 20ns)
    end

    // Stimulus block
    initial begin
        // Initialize signals
        clk = 0;
        nReset = 0;
        rst = 0;
        ena = 1;
        scl_sync = 0;
        slave_wait = 0;
        clk_cnt = 16'h0001;

        // Apply reset
        #5 nReset = 0;
        #10 nReset = 1;

        // Test 1: Normal operation
        #20 rst = 0; ena = 1; scl_sync = 0; slave_wait = 0;
        
        // Test 2: Reset case
        #100 rst = 1; // Apply reset
        #20 rst = 0;

        // Test 3: Enable low and scl_sync set
        #50 ena = 0; scl_sync = 1; slave_wait = 0;

        // Test 4: Slave wait
        #60 slave_wait = 1; ena = 1;

        // Finish the simulation
        #100 $finish;
    end

    // Waveform generation for GTKWAVE
    initial begin
        $dumpfile("clk_gen.vcd");  // VCD file for GTKWAVE
        $dumpvars(0, clk_gen_tb);  // Dump all variables to the VCD file
    end

endmodule
