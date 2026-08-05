`timescale 1ns/1ps

module tb_receiver;

    reg         i_clk;
    reg         i_rst;
    reg         i_rx_serial;

    wire [8:0]  o_rx_data;

    receiver DUT
    (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_rx_serial(i_rx_serial),
        .o_rx_data(o_rx_data)
    );

    initial
    begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end

    initial
    begin
        $dumpfile("receiver.vcd");
        $dumpvars(0, tb_receiver);
    end

    initial
    begin

        i_rst = 1'b1;
        i_rx_serial = 1'b0;

        #20;

        i_rst = 1'b0;

        i_rx_serial = 0; #10;
        i_rx_serial = 1; #10;
        i_rx_serial = 0; #10;
        i_rx_serial = 1; #10;
        i_rx_serial = 0; #10;
        i_rx_serial = 1; #10;
        i_rx_serial = 1; #10;
        i_rx_serial = 1; #10;
        i_rx_serial = 0; #10;

        

        $finish;

    end

    initial
    begin
        $display("-----------------------------------------------");
        $display(" Time   RX   Shift Register");
        $display("-----------------------------------------------");

        $monitor("%4t     %b      %b",
                 $time,
                 i_rx_serial,
                 o_rx_data);
    end

endmodule