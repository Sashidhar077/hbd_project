`timescale 1ns/1ps

module tb_top;

    //--------------------------------------------------
    // Testbench Signals
    //--------------------------------------------------

    reg         i_clk;
    reg         i_rst;
    reg         i_tx_ena_n;

    wire [13:0] o_hit_count;
    wire        o_hit_count_valid;

    //--------------------------------------------------
    // DUT
    //--------------------------------------------------

    top
    #(
        .DIVIDE_COUNT(10000)      // Fast simulation
    )
    DUT
    (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_tx_ena_n(i_tx_ena_n),

        .o_hit_count(o_hit_count),
        .o_hit_count_valid(o_hit_count_valid)
    );

    //--------------------------------------------------
    // Clock Generation
    //--------------------------------------------------

    initial
    begin
        i_clk = 1'b0;
        forever #5 i_clk = ~i_clk;
    end

    //--------------------------------------------------
    // Waveform Dump
    //--------------------------------------------------

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, tb_top);
    end

    //--------------------------------------------------
    // Stimulus
    //--------------------------------------------------

    initial
    begin

        // Reset
        i_rst      = 1'b1;
        i_tx_ena_n = 1'b1;

        #20;

        i_rst = 1'b0;

        //--------------------------------------------------
        // Enable transmitter
        //--------------------------------------------------

        i_tx_ena_n = 1'b0;

        //--------------------------------------------------
        // Run simulation
        //--------------------------------------------------

        #1000000;

        $finish;

    end

    //--------------------------------------------------
    // Monitor
    //--------------------------------------------------

    initial
    begin

        $display("--------------------------------------------------------------");
        $display("Time  Valid   SevenSeg");
        $display("--------------------------------------------------------------");

        $monitor("%5t    %b      %014b",
                 $time,
                 o_hit_count_valid,
                 o_hit_count);

    end
    initial begin
    $monitor(
        "Time=%0t  Gen=%0d  RX=%b  Hit=%b  Count=%0d",
        $time,
        DUT.tx_data,
        DUT.rx_data,
        DUT.hit,
        DUT.hit_count
    );
end

endmodule