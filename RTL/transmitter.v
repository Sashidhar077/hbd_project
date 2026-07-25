






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











*/