`timescale 1ns/1ps

module tb_transmitter;

    reg         i_clk;
    reg         i_rst;
    reg         i_tx_ena_n;
    reg  [9:0]  i_data;

    wire        o_tx_serial;
    wire        o_tx_done;

    transmitter DUT
    (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_tx_ena_n(i_tx_ena_n),
        .i_data(i_data),
        .o_tx_serial(o_tx_serial),
        .o_tx_done(o_tx_done)
    );

    initial
    begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk;
    end

    initial
    begin
        $dumpfile("transmitter.vcd");
        $dumpvars(0, tb_transmitter);
    end

    initial
    begin

        i_rst      = 1'b1;
        i_tx_ena_n = 1'b1;
        i_data     = 10'b1010110010;

        #20;
        i_rst = 1'b0;

        #10;
        i_tx_ena_n = 1'b0;

        #10;
        i_tx_ena_n = 1'b1;

        #120;

         i_rst      = 1'b1;
        i_tx_ena_n = 1'b1;
        i_data     = 10'd200;

        #20;
        i_rst = 1'b0;

        #10;
        i_tx_ena_n = 1'b0;

        #10;
        i_tx_ena_n = 1'b1;

        #120;




        $finish;

    end

    initial
    begin
        $display("-----------------------------------------------");
        $display(" Time   TX_EN   Serial   Done");
        $display("-----------------------------------------------");

        $monitor("%4t      %b        %b       %b",
                  $time,
                  i_tx_ena_n,
                  o_tx_serial,
                  o_tx_done);
    end 

endmodule