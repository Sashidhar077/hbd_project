
module receiver (

    input         i_clk,
    input         i_rst,
    input         i_rx_serial,

    output [8:0]  o_rx_data

);


reg [8:0] shift_reg;

always@(posedge i_clk) begin
            if(i_rst) begin
                shift_reg <= 0;
            end 
            else begin
                    shift_reg <= {i_rx_serial,shift_reg[8:1]};
            end


end
assign o_rx_data = shift_reg;
endmodule