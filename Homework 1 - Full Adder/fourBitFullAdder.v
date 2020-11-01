module fourBitFullAdder (
a0, a1, a2, a3,
b0, b1, b2, b3,
s0, s1, s2, s3,
carry);
  
input a0, a1, a2, a3, b0, b1, b2, b3;
output s0, s1, s2, s3, carry;

fullAdd (0, a0, b0, s0, c0);
fullAdd (c0, a1, b1, s1, c1,);
fullAdd (c1, a2, b2, s2, c2);
fullAdd (c2, a3, b3, s3, carry);

endmodule;