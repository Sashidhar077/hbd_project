module clock_divider(

    input        i_clk,
    input        i_rst,

    output reg   o_one_sec_tick

);

    reg [13:0] count;

    always @(posedge i_clk)
    begin

        if(i_rst)
        begin
            count          <= 14'd0;
            o_one_sec_tick <= 1'b0;
        end
        else
        begin

            o_one_sec_tick <= 1'b0;

            if(count == 14'd9999)
            begin
                count          <= 14'd0;
                o_one_sec_tick <= 1'b1;
            end
            else
            begin
                count <= count + 1'b1;
            end

        end

    end

endmodule





















/*
The hit counter counts continuously.
The display updates once per second.

Inputs
i_clk
i_rst

Outputs
o_one_sec_tick

This output is not a new clock. It is a one-clock pulse every second.

        10 kHz Clock
              │
              ▼
      +----------------+
      | 14-bit Counter |
      +----------------+
              │
        Count = 9999 ?
              │
      ┌───────┴────────┐
      │                │
     No               Yes
      │                │
Continue        Reset Counter
                     │
                     ▼
             Pulse = 1 Clock
*/














