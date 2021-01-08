//Reza Mansouri 972023033
module control(opcodeInput, 
branchOutput, memReadOutput, memToRegOutput, aluOpOutput, memWriteOutput, aluSrcOutput, regWriteOutput
);
    //RISC V instructions have 7 bits opcode which the control Unit takes as input
    input[6:0] opcodeInput;
    //The Control Unit must generate the following 1-bit signals
    output branchOutput, memReadOutput, memToRegOutput, aluOpOutput, memWriteOutput ,regWriteOutput;
    //The Control Unit must generate the following 2-bit Arithmetic Logical Unit Operation Signal
    output [1:0] aluOp;
    
    //I declare an array to store the signals above
    reg [7:0] controls;
    assign {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp} = controls;

    //Based on the book's table, the controls array is assigned values to on the changes of opcode
    always @(opcode)
    if (opcode == 7'b0110011)
      //The R Type Value for the required output signals are stored in the control array
      controls <= 8'b00100010;
    else
	  begin
	  if (opcode == 7'b0000011)
      //The Load double word Value for the required output signals are stored in the control array
      controls <= 8'b11110000;
	  else
	    begin
        if (opcode == 7'b0100011)
        //The Store double word Value for the required output signals are stored in the control array
        controls <= 8'b1x001000;
        else
		  begin
		  if (opcode == 7'b1100011)
          //The Branch on equal Value for the required output signals are stored in the control array
          controls <= 8'b0x000101;
          else
          //The opcode is invalid here
          controls <= 8'bxxxxxxxx;
	      end
	    end
	  end
endmodule
