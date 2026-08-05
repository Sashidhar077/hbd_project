module hit_counter(

    input         i_clk,
    input         i_rst,
    input         i_hit,
    input         i_one_sec_tick,
    output reg [9:0] o_hit_count

);

   always @(posedge i_clk)
begin

    if(i_rst)
        o_hit_count <= 0;

    else if(i_one_sec_tick)
        o_hit_count <= 0;

    else if(i_hit)
        o_hit_count <= o_hit_count + 1;

end

endmodule
















































/*
Every time the pattern detector finds the birthday pattern:

o_hit = 1

the counter must increment.

Example:

Pattern Found

↓

hit = 1

↓

Count = 1

Another match

Pattern Found

↓

hit = 1

↓

Count = 2
Block Diagram
               Pattern Detector
                     │
                  o_hit
                     │
                     ▼
            +------------------+
            |   Hit Counter    |
            +------------------+
                     │
                     ▼
              hit_count[9:0]
Inputs
i_clk
i_rst
i_hit

Outputs
o_hit_count[9:0]
*/