//Reza Mansouri 972023033
module ALUControl(ALUOperationInput, function3Input, function7Input, ALUControlOutput);
    //The ALUOp signal is a 2 bit input for this module
    input [1:0] ALUOperationInput;
    //We Have the 3 bit function input extracted from the instruction by the decoder
    input [2:0] function3Input;
    //And the 7 bit function input extracted from the instruction by the decoder
    input [6:0] function7Input;
    //The Output of this module is a 4 bit signal indicating the following operations:
    //ADD, AND, OR, SUBTRACT
    output reg [3:0] ALUControlOutput;
    //On the change of the input signals, the following loop is executed
    always @(ALUOperationInput | function3Input | function7Input)
    begin
      if (ALUOperationInput == 2'b00)
        //2'b00 is the binary representation of the 2 bit number of zero
        //for the ALUOp of 00, the output is a ADD signal with value of 0010 for ld & sd instructions
        ALUControlOutput <= 4'b0010;
      else
        begin
          if (ALUOperationInput == 2'b01)
              //for the ALUOp of 01, the output is a SUB signal with value of 0110 for beq instructions
              ALUControlOutput <= 4'b0110;
          else
            begin
              if (ALUOperationInput == 2'b10)
                //This if block is for the R-Type Instructions with the 10 ALUOperation Code
                begin
                  if (function7Input == 7'b0000000)
                    //This if block is for the R-Type Instructions with the 10 ALUOperation Code and 0000000 funct7
                    begin
                    casex(function3Input)
                    //for the ALUOp of 10 and the funct3 of 000, the output is a ADD signal with value of 0010 for R-Type add instructions
                    3'b000: ALUControlOutput <= 4'b0010;
                    //for the ALUOp of 10 and the funct3 of 111, the output is a AND signal with value of 0000 for R-Type AND instructions
                    3'b111: ALUControlOutput <= 4'b0000;
                    //for the ALUOp of 10 and the funct3 of 110, the output is a OR signal with value of 0001 for R-Type OR instructions
                    3'b110: ALUControlOutput <= 4'b0001;
                    //if the execution reaches here, it means that the inputs were illegal
                    default: ALUControlOutput <= 4'bxxxx;
                    endcase
                    end
                  else
                    begin
                      if (function7Input == 7'b0100000)
                        begin
                          if (function3Input == 3'b000)
                          //for the ALUOp of 10 and the funct3 of 000, the output is a SUB signal with value of 0110 for R-Type SUB instructions
                          aluControl <= 4'b0110;
                          else
                          //if the execution reaches here, it means that the inputs were illegal
                          ALUControlOutput <= 4'bxxxx;
                        end
                    end
                end       
            end
        end
    end
endmodule
