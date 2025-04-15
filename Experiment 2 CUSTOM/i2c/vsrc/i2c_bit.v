`include "i2c_master_defines.v"

/*
A few notes to keep in mind:
- The current open-drain configuration is impplemented using a N-channel MOS
    - By default, the MOS if off, the line is left on "high impedence" -> logic HIGH
    - Turning on the MOS (oen = 1), the MOS pulls the signal to GND -> logic LOW
*/

module i2c_bit (
    input           clk,
    input           rst,
    input           nReset,

    // Operating parameters
    input           ena,        // Core enable
    input [15:0]    clk_cnt,

    // REGISTERS
    input [3:0]     cmd,
    output reg      cmd_ack,    // Command complete ack
    output reg      busy,
    output reg      al,         // Arbitration lost
    // DATA
    input           din,        // Bit value to write (if in WR mode)
    output reg      dout,       // Bit value read (if in RD mode)
    
    // SDA
    input           sda_i,
    output          sda_oen,
    output          sda_o,

    // SCL
    input           scl_i,
    output          scl_oen,
    output          scl_o
);
    wire sda_doen, sda_dSignal, sda_sSignal;
    wire scl_doen, scl_dSignal, scl_sSignal;
    reg sda_enable, scl_enable;

    reg clk_en; 
    reg slave_wait;
    reg [15:0] cnt;         // For clock prescaling
    reg sda_chk;            // SDA check, for multi-master arbitration	
    reg [17:0] fsm_state;

    // Define the tristate buffer modules
    // SDA
    tristate_buffer sda_tbuf (
        .clk(clk),
        .rst(rst),
        .nReset(nReset),

        .ena(ena),
        .clk_cnt(clk_cnt),
        .signal(sda_enable),

        .in(sda_i),
        .out(sda_o),
        .oen(sda_oen),

        // Delayed
        .doen(sda_doen),
        .dSignal(sda_dSignal),
        .sSignal(sda_sSignal)
    );
    // SCL
    tristate_buffer scl_tbuf (
        .clk(clk),
        .rst(rst),
        .nReset(nReset),

        .ena(ena),
        .clk_cnt(clk_cnt),
        .signal(scl_enable),

        .in(scl_i),
        .out(scl_o),
        .oen(scl_oen),

        // Delayed
        .dSignal(scl_dSignal),
        .sSignal(scl_sSignal)
    );

    // [FEATURE] Clock stretching
    // Whenever the slave is not ready, it can delay the cycle by pulling SCL low
    always @(posedge clk or negedge nReset) begin
        if (!nReset)    slave_wait <= 1'b0;
        else            slave_wait <= (scl_oen & ~scl_doen & ~scl_sSignal) | (slave_wait & ~scl_sSignal);
    end
    
    // [FEATURE] Clock synchronization
    // If the current master drives SCL high, but another master pull it low
    // Master start counting down its low cycle now (to sync)
    wire scl_sync = scl_dSignal & ~scl_sSignal & scl_oen;
    
    // Generate a clock signal
    // [FEATURE] Clock prescaling
    always @(posedge clk or negedge nReset) begin
        if (~nReset)
        begin
            cnt    <=  16'h0;
            clk_en <=  1'b1;
        end
        else if (rst || ~|cnt || !ena || scl_sync)
        begin
            cnt    <=  clk_cnt;
            clk_en <=  1'b1;
        end
        else if (slave_wait)
        begin
            cnt    <=  cnt;
            clk_en <=  1'b0;    
        end
        else
        begin
            cnt    <=  cnt - 16'h1;
            clk_en <=  1'b0;
        end
    end


    // Detecting start and stop conditions!
    reg sta_condition;
    reg sto_condition;
    always @(posedge clk or negedge nReset) begin
        if (~nReset)
        begin
          sta_condition <=  1'b0;
          sto_condition <=  1'b0;
        end
        else if (rst)
        begin
          sta_condition <=  1'b0;
          sto_condition <=  1'b0;
        end
        else
        begin
          sta_condition <=  ~sda_sSignal & sda_dSignal & scl_sSignal;
          sto_condition <=   sda_sSignal & ~sda_dSignal & scl_sSignal;
        end
    end

    // Busy signal (high is the moduel is currently transmitting information)
    always @(posedge clk or negedge nReset) begin 
        if      (!nReset)   busy <= 1'b0;
        else if (rst    )   busy <= 1'b0;
        else                busy <= (sta_condition | busy) & ~sto_condition;
    end

    // Generating an output (reading mode)
    // Put SDA stable signal value on dout on the rising edge of SCL
    always @(posedge clk or negedge nReset) begin
	if (!nReset)
	    dout <= 1'b0;
    if (rst)
        dout <= 1'b0;
	else if (scl_sSignal & ~scl_dSignal) begin
        dout <= sda_sSignal;
    end
	    
    end
    
    // Generate an arbitration lost signal
    // What causes an arbitration lost signal?
    // 1. Master drives SDA high, but the bus stays low
    // 2. "stop" code detected while not requested
    // Some sort of data or signal corruption has occured
    reg cmd_stop;
    always @(posedge clk or negedge nReset)
      if (~nReset)
          cmd_stop <=  1'b0;
      else if (rst)
          cmd_stop <=  1'b0;
      else if (clk_en)
          cmd_stop <=  cmd == `I2C_CMD_STOP;

    always @(posedge clk or negedge nReset)
      if (~nReset)
          al <=  1'b0;
      else if (rst)
          al <=  1'b0;
      elseNM,./ASDFGHJKL;'
      
          al <=  (sda_chk & ~sda_sSignal & sda_oen) | (|fsm_state & sto_condition & ~cmd_stop);
    

    // FSM -- Finite State Machine!!!

    parameter [17:0] idle    = 18'b0_0000_0000_0000_0000;
    parameter [17:0] start_a = 18'b0_0000_0000_0000_0001;
    parameter [17:0] start_b = 18'b0_0000_0000_0000_0010;
    parameter [17:0] start_c = 18'b0_0000_0000_0000_0100;
    parameter [17:0] start_d = 18'b0_0000_0000_0000_1000;
    parameter [17:0] start_e = 18'b0_0000_0000_0001_0000;
    parameter [17:0] stop_a  = 18'b0_0000_0000_0010_0000;
    parameter [17:0] stop_b  = 18'b0_0000_0000_0100_0000;
    parameter [17:0] stop_c  = 18'b0_0000_0000_1000_0000;
    parameter [17:0] stop_d  = 18'b0_0000_0001_0000_0000;
    parameter [17:0] rd_a    = 18'b0_0000_0010_0000_0000;
    parameter [17:0] rd_b    = 18'b0_0000_0100_0000_0000;
    parameter [17:0] rd_c    = 18'b0_0000_1000_0000_0000;
    parameter [17:0] rd_d    = 18'b0_0001_0000_0000_0000;
    parameter [17:0] wr_a    = 18'b0_0010_0000_0000_0000;
    parameter [17:0] wr_b    = 18'b0_0100_0000_0000_0000;
    parameter [17:0] wr_c    = 18'b0_1000_0000_0000_0000;
    parameter [17:0] wr_d    = 18'b1_0000_0000_0000_0000;

    always @(posedge clk or negedge nReset)
      if (!nReset)
      begin
          fsm_state <=  idle;
          cmd_ack <=  1'b0;
          scl_enable <=  1'b1;
          sda_enable <=  1'b1;
          sda_chk <=  1'b0;
      end
      else if (rst | al)
      begin
          fsm_state <=  idle;
          cmd_ack <=  1'b0;
          scl_enable <=  1'b1;
          sda_enable <=  1'b1;
          sda_chk <=  1'b0;
      end
      else
      begin
          cmd_ack   <=  1'b0; // default no command acknowledge + assert cmd_ack only 1clk cycle

          if (clk_en)
              case (fsm_state) // synopsys full_case parallel_case
                    // idle state
                    idle:
                    begin
                        case (cmd) // synopsys full_case parallel_case
                             `I2C_CMD_START: fsm_state <=  start_a;
                             `I2C_CMD_STOP:  fsm_state <=  stop_a;
                             `I2C_CMD_WRITE: fsm_state <=  wr_a;
                             `I2C_CMD_READ:  fsm_state <=  rd_a;
                             default:        fsm_state <=  idle;
                        endcase

                        scl_enable <=  scl_oen; // keep SCL in same state
                        sda_enable <=  sda_oen; // keep SDA in same state
                        sda_chk <=  1'b0;    // don't check SDA output
                    end

                    // start
                    start_a:
                    begin
                        fsm_state <=  start_b;
                        scl_enable <=  scl_oen; // keep SCL in same state
                        sda_enable <=  1'b1;    // set SDA high
                        sda_chk <=  1'b0;    // don't check SDA output
                    end

                    start_b:
                    begin
                        fsm_state <=  start_c;
                        scl_enable <=  1'b1; // set SCL high
                        sda_enable <=  1'b1; // keep SDA high
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    start_c:
                    begin
                        fsm_state <=  start_d;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  1'b0; // set SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    start_d:
                    begin
                        fsm_state <=  start_e;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  1'b0; // keep SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    start_e:
                    begin
                        fsm_state <=  idle;
                        cmd_ack <=  1'b1;
                        scl_enable <=  1'b0; // set SCL low
                        sda_enable <=  1'b0; // keep SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    // stop
                    stop_a:
                    begin
                        fsm_state <=  stop_b;
                        scl_enable <=  1'b0; // keep SCL low
                        sda_enable <=  1'b0; // set SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    stop_b:
                    begin
                        fsm_state <=  stop_c;
                        scl_enable <=  1'b1; // set SCL high
                        sda_enable <=  1'b0; // keep SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    stop_c:
                    begin
                        fsm_state <=  stop_d;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  1'b0; // keep SDA low
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    stop_d:
                    begin
                        fsm_state <=  idle;
                        cmd_ack <=  1'b1;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  1'b1; // set SDA high
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    // read
                    rd_a:
                    begin
                        fsm_state <=  rd_b;
                        scl_enable <=  1'b0; // keep SCL low
                        sda_enable <=  1'b0; // tri-state SDA
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    rd_b:
                    begin
                        fsm_state <=  rd_c;
                        scl_enable <=  1'b1; // set SCL high
                        sda_enable <=  1'b0; // keep SDA tri-stated
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    rd_c:
                    begin
                        fsm_state <=  rd_d;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  1'b0; // keep SDA tri-stated
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    rd_d:
                    begin
                        fsm_state <=  idle;
                        cmd_ack <=  1'b1;
                        scl_enable <=  1'b0; // set SCL low
                        sda_enable <=  1'b0; // keep SDA tri-stated
                        sda_chk <=  1'b0; // don't check SDA output
                    end

                    // write
                    wr_a:
                    begin
                        fsm_state <=  wr_b;
                        scl_enable <=  1'b0; // keep SCL low
                        sda_enable <=  din;  // set SDA
                        sda_chk <=  1'b0; // don't check SDA output (SCL low)
                    end

                    wr_b:
                    begin
                        fsm_state <=  wr_c;
                        scl_enable <=  1'b1; // set SCL high
                        sda_enable <=  din;  // keep SDA
                        sda_chk <=  1'b0; // don't check SDA output yet
                                            // allow some time for SDA and SCL to settle
                    end

                    wr_c:
                    begin
                        fsm_state <=  wr_d;
                        scl_enable <=  1'b1; // keep SCL high
                        sda_enable <=  din;
                        sda_chk <=  1'b1; // check SDA output
                    end

                    wr_d:
                    begin
                        fsm_state <=  idle;
                        cmd_ack <=  1'b1;
                        scl_enable <=  1'b0; // set SCL low
                        sda_enable <=  din;
                        sda_chk <=  1'b0; // don't check SDA output (SCL low)
                    end
              endcase
      end

endmodule