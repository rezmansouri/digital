module fullAdd (carryIn, x, y, sum, carryOut);
  
  input carryIn, x, y;
  output s, carryOut;
  
  assign s = x ^ y ^ carryIn;
  assign carryOut = (x & y) | (x & carryIn) | (y & carryIn);
  
endmodule;