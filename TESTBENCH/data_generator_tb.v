`timescale 1ns/1ps

module tb_generator_counter;

reg clk;
reg rst;
reg tx_done;

wire [9:0] counter;

generator_counter DUT (
    .i_clk(clk),
    .i_rst(rst),
    .i_tx_done(tx_done),
    .o_counter(counter)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    tx_done = 0;

    #20;
    rst = 0;

    repeat(5) begin
        #20;
        tx_done = 1;
        #10;
        tx_done = 0;
    end

    #50;
    $finish;
end

endmodule