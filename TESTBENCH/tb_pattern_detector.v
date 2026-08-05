`timescale 1ns/1ps

module tb_pattern_detector;

    reg  [8:0] i_shift_data;
    wire       o_hit;

    pattern_detector
    #(
        .BIRTHDAY_PATTERN(9'b011101010)
    )
    DUT
    (
        .i_shift_data(i_shift_data),
        .o_hit(o_hit)
    );

    initial
    begin
        $dumpfile("pattern_detector.vcd");
        $dumpvars(0, tb_pattern_detector);
    end

    initial
    begin

        $display("------------------------------------------");
        $display(" Shift Data      Hit");
        $display("------------------------------------------");

        i_shift_data = 9'b000000000;
        #10;

        i_shift_data = 9'b111111111;
        #10;

        i_shift_data = 9'b011101011;
        #10;

        i_shift_data = 9'b011101010;
        #10;

        i_shift_data = 9'b101010101;
        #10;

        i_shift_data = 9'b010101010;
        #10;

        $finish;

    end

    initial
    begin
        $monitor("%b      %b",
                 i_shift_data,
                 o_hit);
    end

endmodule