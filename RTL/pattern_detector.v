

module pattern_detector #(
    parameter BIRTHDAY_PATTERN = 9'b011101010
)(
    input [8:0] i_shift_data,
    output o_hit
);

assign o_hit = (i_shift_data == BIRTHDAY_PATTERN);

endmodule








/*
The receiver continuously outputs the last 9 received bits.

The pattern detector compares those 9 bits with your birthday pattern.

If they are equal:

hit = 1

Otherwise

hit = 0

Inputs :
i_shift_data[8:0]

Outputs :
o_hit

                Receiver
            o_shift_data[8:0]
                    │
                    ▼
        +------------------------+
        |   Pattern Detector     |
        +------------------------+
                    │
                    ▼
                hit_pulse

========================================

     Shift Register
        011101010
             │
             │
             ▼
      +--------------+
      | Comparator   |
      +--------------+
             │
             ▼
          Birthday

      011101010
*/