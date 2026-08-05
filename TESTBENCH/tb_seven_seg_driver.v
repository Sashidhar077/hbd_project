`timescale 1ns/1ps

module tb_seven_seg_driver;

    reg [3:0] i_bcd;
    wire [6:0] o_seg;

    seven_seg_driver DUT
    (
        .i_bcd(i_bcd),
        .o_seg(o_seg)
    );

    initial
    begin
        $dumpfile("seven_seg_driver.vcd");
        $dumpvars(0, tb_seven_seg_driver);
    end

    initial
    begin

        i_bcd = 4'b0000; #10;
        i_bcd = 4'b0001; #10;
        i_bcd = 4'b0010; #10;
        i_bcd = 4'b0011; #10;
        i_bcd = 4'b0100; #10;
        i_bcd = 4'b0101; #10;
        i_bcd = 4'b0110; #10;
        i_bcd = 4'b0111; #10;
        i_bcd = 4'b1000; #10;
        i_bcd = 4'b1001; #10;

        $finish;

    end

    initial
    begin

        $display("-----------------------------------------");
        $display(" BCD      SEGMENTS");
        $display("-----------------------------------------");

        $monitor("%04b     %07b",
                 i_bcd,
                 o_seg);

    end

endmodule