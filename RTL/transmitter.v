
module transmitter (

    input         i_clk,
    input         i_rst,
    input         i_tx_ena_n,
    input  [9:0] i_data,

    output reg    o_tx_serial,
    output reg    o_tx_done

);


    reg [9:0] shift_reg;
    reg [3:0] bit_count;
    reg       tx_valid;

   

    always @(posedge i_clk)
    begin

        //-------------------------
        // Reset
        //-------------------------
        if(i_rst)
        begin
            shift_reg   <= 10'd0;
            bit_count   <= 4'd0;
            tx_valid    <= 1'b0;

            o_tx_serial <= 1'b0;
            o_tx_done   <= 1'b0;
        end

        //-------------------------
        // Normal Operation
        //-------------------------
        else
        begin

            // Default
            o_tx_done <= 1'b0;

            //-------------------------
            // IDLE State
            //-------------------------
            if(!tx_valid)
            begin

                // Active LOW enable
                if(!i_tx_ena_n)
                begin
                    shift_reg <= i_data;
                    bit_count <= 4'd0;
                    tx_valid  <= 1'b1;
                end

            end

            //-------------------------
            // TRANSMIT State
            //-------------------------
            else
            begin

                // Output LSB
                o_tx_serial <= shift_reg[0];

                // Shift right
                shift_reg <= shift_reg >> 1;

                // Increment bit counter
                bit_count <= bit_count + 1'b1;

                // Transmission complete?
                if (bit_count == 4'd9) begin
                    tx_valid  <= 1'b0;
                    o_tx_done <= 1'b1;
                end
                else begin
                    bit_count <= bit_count + 1'b1;
                    shift_reg <= shift_reg >> 1;
                    o_tx_serial <= shift_reg[0];
                end

            end

        end

    end

endmodule






















































/*


The transmitter must send this one bit at a time.

For example:

Counter = 0000000101

Because the specification says LSB First, the bits leave like this:

Clock 1 → 1

Clock 2 → 0

Clock 3 → 1

Clock 4 → 0

Clock 5 → 0

Clock 6 → 0

Clock 7 → 0

Clock 8 → 0

Clock 9 → 0

Clock 10 → 0

After the tenth bit:

tx_done = 1

Then the counter increments.

Transmitter Inputs :
i_clk
i_rst
i_tx_ena_n
i_data[9:0]
Outputs :
o_tx_serial
o_tx_done



Output :
o_tx_serial
o_tx_done







*/