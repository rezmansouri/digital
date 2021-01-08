//Reza Mansouri 972023033
module ImmediateGenerator(
    instructionInput,
    instructionOutput
);
    input [31:0] instructionInput;
    output [63:0] instructionOutput;
    reg [63:0] immOut;
    //7 bit Opcode of Risc-V Instructions
    wire [6:0] opcode;

    assign instructionOutput = immOut;
    assign opcode = instructionInput[6:0];

    always @(instructionInput)
        casex(opcode)
            7'b0000011: immOut <= { {53{instructionInput[31]}}, instructionInput[30:20]};
            7'b0100011: immOut <= { {53{instructionInput[31]}}, instructionInput[30:25], instructionInput[11:7]};
            7'b1100011: immOut <= { {53{instructionInput[31]}}, instructionInput[7], instructionInput[30:25], instructionInput[11:8]};
            default: immOut <= 32'bx;
        endcase
endmodule
