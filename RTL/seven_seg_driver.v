module seven_seg_driver(

    input  [3:0] i_bcd,
    output reg [6:0] o_seg

);

always @(*)
begin

    case(i_bcd)

        4'd0 : o_seg = 7'b1000000;
        4'd1 : o_seg = 7'b1111001;
        4'd2 : o_seg = 7'b0100100;
        4'd3 : o_seg = 7'b0110000;
        4'd4 : o_seg = 7'b0011001;
        4'd5 : o_seg = 7'b0010010;
        4'd6 : o_seg = 7'b0000010;
        4'd7 : o_seg = 7'b1111000;
        4'd8 : o_seg = 7'b0000000;
        4'd9 : o_seg = 7'b0010000;

        default : o_seg = 7'b1111111;

    endcase

end

endmodule



/*
To Display '0'

The digit 0 needs these segments ON:

      a
     ---
  f |   | b

  e |   | c
     ---
      d

Segments ON:

a
b
c
d
e
f

Segment OFF:

g
Common Anode

For a common-anode display:

0 = LED ON
1 = LED OFF

Therefore:

Segment	State
a	ON → 0
b	ON → 0
c	ON → 0
d	ON → 0
e	ON → 0
f	ON → 0
g	OFF → 1

Writing in gfedcba order:

g f e d c b a

1 0 0 0 0 0 0

which is:

7'b1000000

*/