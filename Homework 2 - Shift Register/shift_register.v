module shift_register #(parameter size=8) (input data, input clock, input enable, input direction, input reset,output reg [size-1:0] out);
  always @ (posedge clock)
    if (!reset)
      out <= 0;
  else begin
    if (enable)
      case (direction)
        0 : out <= {out[size-2:0], data};
        1 : out <= {data, out[size-1:1]};
      endcase
    else
      out <= out;
  end
endmodule
