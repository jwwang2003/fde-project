`timescale 1us / 1ns  // Set timescale to 1 microsecond per time unit, 1 nanosecond precision

module top (
    input wire clk,        // SMIMS virtual clock
    input wire clk_30M,    // Internal 30MHz clock
    input wire rst,        // Reset signal
    input wire nReset,     // Active low reset for FIFO modules

    // FIFO signals for writing
    input wire i_wr,       // Write enable
    input wire [7:0] i_wdata,  // Write data (example with 8-bit data)

    // FIFO signals for reading
    input wire i_rd,       // Read enable
    output wire [7:0] o_rdata, // Read data (example with 8-bit data)
    output wire o_rempty,  // Read FIFO empty flag
    output wire o_wfull,    // Write FIFO full flag
    output wire fifo_1_w_full
);
    reg active;
    // Internal signals for FIFOs
    wire [7:0] wdata_to_fifo;  // Data to be written to the FIFO
    wire wr_fifo_full;         // Write FIFO full flag
    // wire rd_fifo_empty;        // Read FIFO empty flag

    // Instantiate the input FIFO (write side)
    afifo #(
        .DSIZE(8),  // Data width = 8 bits
        .ASIZE(5)   // Address size = 5 bits (32 entries)
    ) fifo_write (
        .i_wclk(clk),           // Write clock
        .i_wrst_n(nReset),      // Write reset (active low)
        .i_wr(i_wr),            // Write enable
        .i_wdata(i_wdata),      // Write data
        .o_wfull(fifo_1_w_full), // Write FIFO full
        .i_rclk(clk_30M),       // Read clock (for the read side)
        .i_rrst_n(nReset),      // Read reset (active low)
        .i_rd(active),            // Read enable
        .o_rdata(wdata_to_fifo), // Data to be read out
        .o_rempty(rd_fifo_empty)  // Read FIFO empty flag
    );

    always @(posedge clk_30M or negedge nReset) begin
        if (~nReset) begin
            active <= 1'b0;
        end
        else if (rst) begin
            active <= 1'b0;
        end
        else if (~rd_fifo_empty) begin
            active <= 1'b1;
        end
        else begin
            active <= 1'b0;
        end
    end

    // Instantiate the output FIFO (read side)
    afifo #(
        .DSIZE(8),  // Data width = 8 bits
        .ASIZE(5)   // Address size = 5 bits (32 entries)
    ) fifo_read (
        .i_wclk(clk_30M),         // Write clock (for this FIFO)
        .i_wrst_n(nReset),        // Write reset (active low)
        .i_wr(active),          // Write enable (write when read FIFO is not empty)
        .i_wdata(wdata_to_fifo), // Write data from the first FIFO
        .o_wfull(o_wfull),        // Write FIFO full flag
        .i_rclk(clk),             // Read clock
        .i_rrst_n(nReset),        // Read reset (active low)
        .i_rd(i_rd),              // Read enable
        .o_rdata(o_rdata),        // Output read data
        .o_rempty(o_rempty)       // Output FIFO empty flag
    );

endmodule;
