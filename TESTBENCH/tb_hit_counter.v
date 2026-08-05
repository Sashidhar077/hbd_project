`timescale 1ns/1ps

module tb_hit_counter;

    reg         i_clk;
    reg         i_rst;
    reg         i_hit;

    wire [9:0]  o_hit_count;

    hit_counter DUT
    (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_hit(i_hit),
        .o_hit_count(o_hit_count)
    );

    initial
    begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end

    initial
    begin
        $dumpfile("hit_counter.vcd");
        $dumpvars(0, tb_hit_counter);
    end

    initial
    begin

        i_rst = 1;
        i_hit = 0;

        #20;
        i_rst = 0;

        #10 i_hit = 1;
        #10 i_hit = 0;

        #20 i_hit = 1;
        #10 i_hit = 0;

        #20 i_hit = 1;
        #10 i_hit = 0;

        #30;

        $finish;

    end

    initial
    begin
        $display("-----------------------------------------");
        $display(" Time   Hit   Count");
        $display("-----------------------------------------");

        $monitor("%4t    %b      %d",
                 $time,
                 i_hit,
                 o_hit_count);
    end

endmodule