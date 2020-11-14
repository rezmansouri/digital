module SixtyFourBitShiftRegister (input in, input clock, input shiftLeft, input shiftRight, input reset, output reg out);
  reg [63:0] bits;
  always @ (posedge clock)
    if (!reset) begin
      bits <= 0;
      out <=0;
    end
  else begin
        if (shiftLeft) begin
         bits <= bits << 1;
         bits[0] <= in;
         out <= bits[63];
       end
      else begin
        if (shiftRight) begin
        bits <= bits >> 1;
        bits[63] <= in;
        out <= bits[0];
      end
    end
  end
endmodule

