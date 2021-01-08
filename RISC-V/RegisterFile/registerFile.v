//Reza Mansouri 972023033
module RegisterFile(
    writeDataInput, readRegister1Input, readRegister2Input, writeRegisterInput, writeDataInput,
    readData1, readData2, clock
);
    input [4:0] readRegister1Input, readRegister2Input, writeRegisterInput;
    input [63:0] writeDataInput;
    output reg [63:0] readData1, readData2;
    //Risc-V has 32 registers of 64 bit long
    reg [63:0] registerFile [0:31];
    input clk, writeDataInput;

    always @(readRegister1Input)
        begin
            if (readRegister1Input != 0)
                readData1 <= registerFile[readRegister1Input];
            else
                readData1 <= 0;
        end

    always @(readRegister2Input)
        begin
            if (readRegister2Input != 0)
                readData2 <= registerFile[readRegister2Input];
            else
                readData2 <= 0;
        end

    always @(posedge clk)
        if (writeDataInput) registerFile[writeRegisterInput] <= writeDataInput;
endmodule
