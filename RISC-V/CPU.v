//Reza Mansouri 972023033
`include "ALU/ALU.v"
`include "ALUControl/ALUControl.v"
`include "ClockGenerator/clockGenerator.v"
`include "DataMemory/dataMemory.v"
`include "ImmediateGenerator/immediateGenerator.v"
`include "InstructionMemory/instructionMemory.v"
`include "Multiplexer/multiplexer.v"
`include "RegisterFile/registerFile.v"

module CPU(clockInput, addressInput);
    input clockInput;
    input [47:0] addressInput;
    wire memWrite, memRead, branch, memToReg, aluSrc , regWrite, zero;
    wire [1:0] ALUOperation;
    wire [3:0] ALUControl;
    wire [31:0] instruction;
    wire [63:0] writeData, readData, readData1, readData2, immOut, secondInputAlu, aluResult;

    Multiplexer #(64) multiplexer1 (readData2, immOut, aluSrc, secondInputAlu);
    Multiplexer #(64) multiplexer2 (readData, aluResult, memToReg, writeData);

    InstructionMemory instructionMemory (address, instruction);
    DataMemory dataMemory (clockInput, memWrite, memRead, {42'b0, aluResult[5:0]}, readData2,  readData);

    Control control (instruction[6:0], branch, memRead, memToReg, ALUOperation, memWrite, aluSrc, regWrite);
    ALUControl aluControl (ALUOperation, instruction[31:25], instruction[14:12], ALUControl);

    RegisterFile registerFile (regWrite, instruction[19:15], instruction[24:20], instruction[11:7], writeData, readData1, readData2, clockInput);

    ImmediateGenerator immediateGenerator (instruction, immOut);

    ALU alu (readData1, secondInputAlu, ALUControl, aluResult, zero);
endmodule
