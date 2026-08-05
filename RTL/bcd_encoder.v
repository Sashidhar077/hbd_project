module bcd_encoder (

    input  [9:0] i_binary,

    output reg [3:0] o_tens,
    output reg [3:0] o_ones

);

always @(*)
begin

    o_tens = (i_binary / 10) % 10;

    o_ones = i_binary % 10;

end

endmodule