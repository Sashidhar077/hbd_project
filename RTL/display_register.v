module display_latch(

    input         i_clk,
    input         i_rst,
    input         i_tick,
    input  [9:0]  i_hit_count,

    output reg [9:0] o_display_count,
    output reg        o_hit_count_valid

);

always @(posedge i_clk)
begin
    if(i_rst)
    begin
        o_display_count    <= 10'd0;
        o_hit_count_valid  <= 1'b0;
    end
    else
    begin
        o_hit_count_valid <= 1'b0;

        if(i_tick)
        begin
            o_display_count   <= i_hit_count;
            o_hit_count_valid <= 1'b1;
        end
    end
end

endmodule