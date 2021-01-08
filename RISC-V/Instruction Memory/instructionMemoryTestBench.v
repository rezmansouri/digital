//Reza Mansouri 972023033
//i include the instruction memory module
`include "instructionMemory.v"
module instructionMemoryTestBench;
  //i declare an 48 bit array
  reg address[47:0];
  //i assign a 48 bit HEX valye to the address
  //in 48'h12345678abcd -> 48 is the size of the address in bits
  //                       'h means the notaition for this address is in HEX
  //                       12345678abcd is 12 HEX digits (12*4 = 48)
  assign address = 48'h12345678abcd;
  //i declare an 32 bit array that im going to fetch an instruction to
  reg instruction[31:0];
  //i declare an instructionMemory instance
  instructionMemory instructionRam(address, instruction);
endmodule