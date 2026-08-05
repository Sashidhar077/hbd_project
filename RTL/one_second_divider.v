module clock_divider
#(
    parameter DIVIDE_COUNT = 10000
)
(
    input  i_clk,
    input  i_rst,
    output reg o_one_sec_tick
);

reg [13:0] count;

always @(posedge i_clk) begin
    if(i_rst) begin
        count <= 0;
        o_one_sec_tick <= 0;
    end
    else begin
        o_one_sec_tick <= 0;

        if(count == DIVIDE_COUNT-1) begin
            count <= 0;
            o_one_sec_tick <= 1;
        end
        else begin
            count <= count + 1'b1;
        end
    end
end

endmodule