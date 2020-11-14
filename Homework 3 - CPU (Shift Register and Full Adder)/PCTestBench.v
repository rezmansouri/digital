module SixtryFourBitFullAdderAndShiftRegister_tb;
  wire data;
  reg clock;
  reg shiftLeft;
  reg shiftRight;
  reg reset;
  wire shiftOutputAddInput;
  reg four = 4;
  reg zero = 0;
  
  
  reg adderCarry;
  
  SixtyFourBitShiftRegister shiftRegister ( .in(data),
  .clock (clock),
  .shiftLeft (shiftLeft),
  .shiftRight (shiftRight),
  .reset (reset),
  .out (shiftOutputAddInput));
  
  Adder adder ( .a(shiftOutputAddInput),
  .b (four),
  .carry_in (zero),
  .sum (data),
  .carry_out(carry_out));
  
  always #10 clock = ~clock;
  
  initial begin
    clock <= 0;
    shiftLeft <= 1;
    shiftRight <= 0;
    reset <= 0;
  end
  
endmodule