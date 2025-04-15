module clk_gen (
    input wire clk,             // System clock
    input wire nReset,          // Active low reset
    input wire rst,             // Reset signal
    input wire ena,             // Enable signal
    input wire scl_sync,        // SCL synchronization signal
    input wire slave_wait,      // Slave wait signal
    input wire [15:0] clk_cnt,  // Clock counter value
    output reg clk_en           // Clock enable signal
);
    reg [15:0] cnt;  // Counter to track clock enable state

    always @(posedge clk or negedge nReset) begin
        if (~nReset) begin
            cnt    <= 16'h0;
            clk_en <= 1'b1;
        end
        else if (rst || ~|cnt || !ena || scl_sync) begin
            cnt    <= clk_cnt;
            clk_en <= 1'b1;
        end
        else if (slave_wait) begin
            cnt    <= cnt;
            clk_en <= 1'b0;
        end
        else begin
            cnt    <= cnt - 1'b1;
            clk_en <= 1'b0;
        end
    end
endmodule
