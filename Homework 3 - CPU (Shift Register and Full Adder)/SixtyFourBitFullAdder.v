module Adder ( input a,
  input b,
  input carry_in,
  output reg sum,
  output reg carry_out );
  always @ (a or b or carry_in) begin
  {carry_out, sum} = a + b + carry_in;
end
endmodule