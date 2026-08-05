module top
#(
    parameter DIVIDE_COUNT = 10000
)
(
    input         i_clk,
    input         i_rst,
    input         i_tx_ena_n,

    output [13:0] o_hit_count,
    output        o_hit_count_valid
);

//--------------------------------------------------
// Internal Wires
//--------------------------------------------------

wire [9:0] tx_data;

wire tx_serial;
wire tx_done;

wire [8:0] rx_data;

wire hit;

wire [9:0] hit_count;

wire one_sec_tick;

wire [9:0] display_count;

wire [3:0] tens_bcd;
wire [3:0] ones_bcd;

wire [6:0] seg_tens;
wire [6:0] seg_ones;

//--------------------------------------------------
// Generator
//--------------------------------------------------

generator_counter u_generator(

.i_clk(i_clk),
.i_rst(i_rst),
.i_tx_done(tx_done),

.o_counter(tx_data)

);

//--------------------------------------------------
// Transmitter
//--------------------------------------------------

transmitter u_transmitter(

.i_clk(i_clk),
.i_rst(i_rst),
.i_tx_ena_n(i_tx_ena_n),
.i_data(tx_data),

.o_tx_serial(tx_serial),
.o_tx_done(tx_done)

);

//--------------------------------------------------
// Receiver
//--------------------------------------------------

receiver u_receiver(

.i_clk(i_clk),
.i_rst(i_rst),
.i_rx_serial(tx_serial),

.o_rx_data(rx_data)

);

//--------------------------------------------------
// Pattern Detector
//--------------------------------------------------

pattern_detector
#(
.BIRTHDAY_PATTERN(9'b000000001)
)
u_detector(

.i_shift_data(rx_data),

.o_hit(hit)

);

//--------------------------------------------------
// Clock Divider
//--------------------------------------------------
clock_divider
#(
    .DIVIDE_COUNT(DIVIDE_COUNT)
)
u_divider
(
    .i_clk(i_clk),
    .i_rst(i_rst),
    .o_one_sec_tick(one_sec_tick)
);

//--------------------------------------------------
// Hit Counter
//--------------------------------------------------

hit_counter u_counter(

.i_clk(i_clk),
.i_rst(i_rst),

.i_hit(hit),
.i_one_sec_tick(one_sec_tick),

.o_hit_count(hit_count)

);

//--------------------------------------------------
// Display Register
//--------------------------------------------------

display_latch u_display(

.i_clk(i_clk),
.i_rst(i_rst),

.i_tick(one_sec_tick),

.i_hit_count(hit_count),

.o_display_count(display_count),
.o_hit_count_valid(o_hit_count_valid)

);

//--------------------------------------------------
// BCD Encoder
//--------------------------------------------------

bcd_encoder u_bcd(

.i_binary(display_count),

.o_tens(tens_bcd),
.o_ones(ones_bcd)

);

//--------------------------------------------------
// Seven Segment Driver (Tens)
//--------------------------------------------------

seven_seg_driver u_seg_tens(

.i_bcd(tens_bcd),

.o_seg(seg_tens)

);

//--------------------------------------------------
// Seven Segment Driver (Ones)
//--------------------------------------------------

seven_seg_driver u_seg_ones(

.i_bcd(ones_bcd),

.o_seg(seg_ones)

);

//--------------------------------------------------
// Outputs
//--------------------------------------------------

assign o_hit_count = {seg_tens,seg_ones};

endmodule