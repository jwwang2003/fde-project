`timescale 1ns / 1ps

module tb_i2c_master_bit_ctrl();

    // Inputs
    reg clk;
    reg rst;
    reg nReset;
    reg ena;
    reg [15:0] clk_cnt;
    reg [3:0] cmd;
    reg din;
    reg scl_i;
    reg sda_i;

    // Outputs
    wire scl_o;
    wire sda_o;
    wire cmd_ack;
    wire busy;
    wire al;

    // Instantiate the DUT (Device Under Test)
    i2c_master_bit_ctrl uut (
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
        .dout(),
        .scl_i(scl_i),
        .scl_o(scl_o),
        .scl_oen(),
        .sda_i(sda_i),
        .sda_o(sda_o),
        .sda_oen()
    );

    // Clock Generation
    always begin
        #5 clk = ~clk;  // Clock period is 10 ns
    end

    // Test Procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        nReset = 0;
        ena = 0;
        clk_cnt = 16'h1000; // Set a clock divider value
        cmd = 4'b0000;
        din = 0;
        sda_i = 1;  // SDA idle high
        scl_i = 1;  // SCL idle high

        // Apply reset
        rst = 1;
        nReset = 1;
        #20;

        // Start I2C bus test
        ena = 1;  // Enable I2C core

        // Test Start Condition (send START command)
        cmd = 4'b0001; // I2C_CMD_START
        #100;  // Wait for 100 ns

        // Test Stop Condition (send STOP command)
        cmd = 4'b0010; // I2C_CMD_STOP
        #100;  // Wait for 100 ns

        // End the simulation
        $stop;
    end

    // Monitor the I2C signals (SDA and SCL) and check conditions
    initial begin
        $monitor("Time = %0t, SCL = %b, SDA = %b, CMD = %b, CMD_ACK = %b, BUSY = %b, AL = %b",
                 $time, scl_o, sda_o, cmd, cmd_ack, busy, al);
    end

endmodule
