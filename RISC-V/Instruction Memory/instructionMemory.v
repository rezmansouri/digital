//Reza Mansouri 972023033
module instructionMemory(addressInput, instructionOutput);
  input [47:0] addressInput;
  //As The Instructor has stated, i should have 48 bit addresses as input
  output [31:0] instructionOutput;
  //Risc-V instructions are each 32 bit long
  reg [47:0] memory [31:0];
  //i define a verilog memory array which has 48 bit addresses and 32 bit data
  assign instructionOutput = RAM[addressInput];
  //i assign the previously defined output the the Data on ram ath the address input
endmodule
