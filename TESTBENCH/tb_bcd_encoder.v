`timescale 1ns/1ps

module tb_bcd_encoder;

    reg [9:0] i_binary;

    wire [3:0] o_tens;
    wire [3:0] o_ones;

    bcd_encoder DUT
    (
        .i_binary(i_binary),
        .o_tens(o_tens),
        .o_ones(o_ones)
    );

    initial
    begin
        $dumpfile("bcd_encoder.vcd");
        $dumpvars(0, tb_bcd_encoder);
    end

    initial
begin

    // Decimal 0
    i_binary = 10'b0000000000;
    #10;

    // Decimal 5
    i_binary = 10'b0000000101;
    #10;

    // Decimal 9
    i_binary = 10'b0000001001;
    #10;

    // Decimal 10
    i_binary = 10'b0000001010;
    #10;

    // Decimal 15
    i_binary = 10'b0000001111;
    #10;

    // Decimal 25
    i_binary = 10'b0000011001;
    #10;

    // Decimal 37
    i_binary = 10'b0000100101;
    #10;

    // Decimal 42
    i_binary = 10'b0000101010;
    #10;

    // Decimal 99
    i_binary = 10'b0001100011;
    #10;

    $finish;

end

    initial
begin

    $display("---------------------------------------------");
    $display(" Binary Input   Decimal     Tens      Ones");
    $display("---------------------------------------------");

    $monitor("%010b    %04d      %04b      %04b",
             i_binary,
             i_binary,
             o_tens,
             o_ones);

end

endmodule