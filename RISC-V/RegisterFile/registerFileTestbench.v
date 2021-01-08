//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "registerFile.v"

module RegisterFileTestBench;
    reg [4:0] readRegister1, readRegister2, writeRegister;
    reg [63:0] writeData;
    wire [63:0] readData1, readData2;
    wire clock;
    reg regWrite;
    integer i;

    ClockGenerator clock (clk);
    RegisterFile registerFile(regWrite, readRegister1, readRegister2, writeRegister, writeData, readData1, readData2, clock);

    initial begin

        i = 0;
        while(i <= 15) begin
            @(posedge clock); readRegister1 <= i;  readRegister2 <= i+1;
            i = i+1;
        end

        #15 regWrite <= 1; writeData = 32'h12345678;
        i = 0;
        while(i <= 15) begin
            @(posedge clock); writeRegister <= i;  writeData <= i+1;
            i = i+1;
        end
        #15 readRegister1<=32'hXXXXXXXX; readRegister2<=32'hXXXXXXXX; regWrite<=0;

        i = 0;
        while(i <= 15) begin
            @(posedge clock); readRegister1 <= i;  readRegister2 <= i+1;
            i = i+1;
        end
    end
endmodule
