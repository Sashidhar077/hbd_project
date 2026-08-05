`timescale 1ns/1ps

module tb_display_latch;

    reg         i_clk;
    reg         i_rst;
    reg         i_tick;
    reg  [9:0]  i_hit_count;

    wire [9:0]  o_display_count;
    wire        o_hit_count_valid;

    display_latch DUT
    (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_tick(i_tick),
        .i_hit_count(i_hit_count),
        .o_display_count(o_display_count),
        .o_hit_count_valid(o_hit_count_valid)
    );

    initial
    begin
        i_clk = 1'b0;
        forever #5 i_clk = ~i_clk;
    end

    initial
    begin
        $dumpfile("display_latch.vcd");
        $dumpvars(0, tb_display_latch);
    end

    initial
    begin

        i_rst       = 1'b1;
        i_tick      = 1'b0;
        i_hit_count = 10'd0;

        #20;
        i_rst = 1'b0;

        i_hit_count = 10'd15;

        #20;

        i_tick = 1'b1;
        #10;
        i_tick = 1'b0;

        #20;

        i_hit_count = 10'd27;

        #20;

        i_tick = 1'b1;
        #10;
        i_tick = 1'b0;

        #20;

        i_hit_count = 10'd43;

        #20;

        i_tick = 1'b1;
        #10;
        i_tick = 1'b0;

        #30;

        $finish;

    end

    initial
    begin   

        $display("-------------------------------------------------------------");
        $display(" Time  Tick  HitCount  DisplayCount  Valid");
        $display("-------------------------------------------------------------");

        $monitor("%4t    %b      %4d         %4d        %b",
                 $time,
                 i_tick,
                 i_hit_count,
                 o_display_count,
                 o_hit_count_valid);

    end

endmodule