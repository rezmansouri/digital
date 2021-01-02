//Reza Mansouri 972023033
`include "control.v"
module controlTestbench;
  //I declare a clock signal
  reg clock;
  initial
    clock <= 0;
  always #4
    clock <= (!clock);
  //I declare an instruction of 32 bits to exclude the opcode from it later
  reg [31:0] instruction;
  //I declare the desired signal from the controls module
  wire branch, memRead, memToReg, memWrite, aluSrc , regWrite;
  //The ALU operation signal is 2 bits long
  wire [1:0] aluOp;
  //I declare a controls array to hold the desired signals
  wire [7:0] controls;
  assign controls = {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp};
  //I exclude the bits 0 to 7 of the instruction to an opcode array
  wire [6:0] opcode;
  assign opcode = instruction[6:0];
  //I declare a controls instance to generate the desired signals
  control controlUnit(opcode, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
  //At the positive edge of the clock declared before, I assign values to the instruction
  initial
    begin
      @(posedge clk); instruction <= 32'h12345633;
      @(posedge clk); instruction <= 32'h12345603;
      @(posedge clk); instruction <= 32'h123456A3;
      @(posedge clk); instruction <= 32'h12345663;
      @(posedge clk); instruction <= 32'h123456FF;
    end
endmodule  