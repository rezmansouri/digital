//Reza Mansouri 972023033
module DataMemory(
    clockInput, memWriteInput, memReadInput, addressInput, writeDataInput,
    readDataOutput
);
    input clockInput, memWriteInput, memReadInput;
    //Just like Instruction Memory, I assume the addresses are 48 bit long, according to the instructor
    input [47:0] addressInput;
    //64 bit register data to write
    input [63:0] writeDataInput;
    //64 bit register data to be read
    output [63:0] readDataOutput;
    //I declare a verilog RAM array of 64 registers of 64 bit long
    reg [63:0] RAM[0:63];

    assign readDataOutput = RAM[addressInput[5:0]];

    always @(posedge clockInput)
        if(memWriteInput) RAM[addressInput[5:0]] <= writeDataInput;

endmodule : DataMemory
