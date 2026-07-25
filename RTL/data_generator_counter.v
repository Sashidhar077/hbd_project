
module generator_counter(
        input i_clk,i_rst,i_tx_done,
        output reg [9:0]o_counter
);


always@(posedge i_clk) begin 
        if(i_rst) begin 
            o_counter = 10'd0;
        end
        else if(i_tx_done) begin 
            o_counter<=o_counter+10'd1;

        end
        else begin 
            o_counter<=o_counter;
        end 

end 

endmodule




/*  
10-bit Counter (Generator)
Purpose

Generate the numbers

0
1
2
3
...
1023

continuously.

This is the data source of the transmitter. It only increments after a complete 10-bit transmission has finished, preventing overlap between data generation and transmission.


inputs : clk
          rst
        tx_done



output : [9:0]o_counter
*/





