`timescale 1ns / 1ps

module tb_i2c_bit;

    // Testbench signals
    reg clk;
    reg rst;
    reg nReset;
    reg ena;
    reg [15:0] clk_cnt;
    reg [3:0] cmd;
    reg din;
    reg sda_i;
    reg scl_i;
    
    wire cmd_ack;
    wire busy;
    wire al;
    wire dout;
    wire sda_oen;
    wire sda_o;
    wire scl_oen;
    wire scl_o;

    // Instantiate the i2c_bit module
    i2c_bit uut (
        .clk(clk),
        .rst(rst),
        .nReset(nReset),
        .ena(ena),
        .clk_cnt(clk_cnt),
        .cmd(cmd),
        .cmd_ack(cmd_ack),
        .busy(busy),
        .al(al),

        .din(din),
        .dout(dout),

        .sda_i(sda_i),
        .sda_oen(sda_oen),
        .sda_o(sda_o),

        .scl_i(scl_i),
        .scl_oen(scl_oen),
        .scl_o(scl_o)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100 MHz clock
    end

    // Initial block for simulation
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        nReset = 1;
        ena = 0;
        clk_cnt = 16'h4;
        cmd = 4'b0000;
        din = 0;
        sda_i = 1'b1;
        scl_i = 1'b1;

        // Apply reset
        #10 rst = 1;
        nReset = 0;
        #10 rst = 0;
        nReset = 1;

        // Test case 1: Start condition
        ena = 1;
        #50
        // din = 0;
        cmd = `I2C_CMD_READ;
        sda_i = 0;
        #150
        #100
        cmd = `I2C_CMD_STOP;  // Clear command
        #400
        // #20;
        
        // // Test case 2: Write operation (command and data)
        // #10 cmd = `I2C_CMD_WRITE;
        // din = 1;  // Set data to write
        // #10 din = 0;  // Write next bit
        // #20 cmd = 4'b0000;  // Clear command
        // #20;

        // // Test case 3: Read operation
        // #10 cmd = `I2C_CMD_READ;
        // #20 cmd = 4'b0000;  // Clear command
        // #20;

        // // Test case 4: Stop condition
        // #10 cmd = `I2C_CMD_STOP;
        // #10 cmd = 4'b0000;  // Clear command
        // #20;
        
        // // Test case 5: Arbitration Lost (simulate SDA line contention)
        // #10 sda_i = 0;  // Simulate another master pulling SDA low
        // #10 sda_i = 1;  // Revert SDA to high
        // #20;

        // End simulation
        $finish;
    end

    // Monitoring the outputs (optional)
    initial begin
        $monitor("At time %t, cmd_ack=%b, busy=%b, al=%b, dout=%b, sda_o=%b, scl_o=%b",
                 $time, cmd_ack, busy, al, dout, sda_o, scl_o);
    end

     // Initialize VCD file for waveform dumping
    initial begin
        $dumpfile("i2c_waveform.vcd");   // Specify the VCD file name
        $dumpvars(0, tb_i2c_bit);         // Dump all variables in the testbench
    end

endmodule
