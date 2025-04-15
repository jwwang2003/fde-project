module tristate_buffer (
    input wire      clk,
    input wire      rst,        // Sync. reset
    input wire      nReset,     // Async. reset

    input           ena,        // Core enable
    input [15:0]    clk_cnt,    // Clock prescale value
    
    // Main inputs
    input wire      p_in,       // Signal port in (external)

    // "Open-drain"
    output          p_out,      // Signal port out (the "drain") always pulled LOW

    // Signal reading
    output reg      dSignal,    // Delayed signal (read p.t.) for buffer
    output wire     signal      // Stable Signal (read p.t.)

    // Debugging purposes...
    // output reg [13:0] filter_cnt,
    // output wire sample_trigger
);
    /*
    If "in" is not asserted, FET is off, the line is left "floating" but it is 
    acutally pulled HIGH.
    If "in" is asserted, the FET turns on and the signal is now pulled LOW,
    the signal is now being driven.
    
    Features:

    TODO:
        - Nothing left...?
    
    Testing:
        - Ensure that the reset signals work correctly (rst, nReset) [TESTED]
        - Ensure that ena (core enable) works correctly [TESTED]
        - Ensure that clk_cnt (SCL prescaling) works properly [TESTED]
            - Might have to connect this module to the main clk, and compare their outputs (TESTED)
        - Ensure that delayed signals are correct [TESTED]
    */

    reg sSignal;
    reg [1:0]   cSignal;    // Captured signal
    reg [2:0]   fSignal;    // Filtered signal
    // reg         sSignal;    // Filtered & "synced"
    // reg         dSignal;    // Delayed signal (buffered)
    reg [13:0]  filter_cnt; // clock divider for filter
    // reg dout;

    assign signal = sSignal;

    // Debugging...
    // assign sample_trigger = ~|filter_cnt;
    
    // Stage 1: Capture signal
    always @(posedge clk or negedge nReset) begin
        if (!nReset)
        begin
            cSignal <= 2'b00;
        end
        else if (rst)
        begin
            cSignal <= 2'b00;
        end
        else
        begin
            cSignal <= {cSignal[0], p_in};    
            // shift & discard MSB, push newly read siganl to the LSB
            // 00 (read 1) -> 01, 01 (read 1) -> 11, 11 (read 0) -> 10, etc...
        end
    end

    // Stage 2: Filter signal
    always @(posedge clk or negedge nReset) begin
        if      (!nReset     ) filter_cnt <= 14'h0;
        else if (rst || !ena ) filter_cnt <= 14'h0;
        else if (~|filter_cnt) filter_cnt <= clk_cnt >> 2; //16x I2C bus frequency
        else                   filter_cnt <= filter_cnt - 1;
    end
    always @(posedge clk or negedge nReset) begin
        if (!nReset)
        begin
            fSignal <= 3'b111;
        end
        else if (rst)
        begin
            fSignal <= 3'b111;
        end
        else if (~|filter_cnt)
        begin
            // Only update the filtered signal
            fSignal <= {fSignal[1:0], cSignal};     
        end
    end

    // Stage 3: Generate signals & delayed/buffered signals
    always @(posedge clk or negedge nReset) begin
        if (~nReset)
        begin
            sSignal <= 1'b1;
            dSignal <= 1'b1;
        end
        else if (rst)
        begin
            sSignal <= 1'b1;
            dSignal <= 1'b1;
        end
        else 
        begin
            // Majority Voting Filter
            // By OR-ing these three results, the design implements a majority vote. 
            // In effect, if at least two out of the three bits in the 
            // signal are high, then sSCL is set high
            sSignal <= &fSignal[2:1] | &fSignal[1:0] | (fSignal[2] & fSignal[0]);
            // Delayed copy
            dSignal <= sSignal;
        end
    end
    
    assign p_out = 1'b0;  // OUTPUT ALWAYS PULLED LOW
    // This does not mean that the "output" is always on,
    // the output is triggered by the FET (or oen)
endmodule