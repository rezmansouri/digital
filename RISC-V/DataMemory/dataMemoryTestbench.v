//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "dataMemory.v"
module DataMemoryTestbench;
    wire clock;
    reg [47:0] address;
    reg memWrite, memRead;
    reg [63:0] writeData;
    wire [63:0] readData;
    integer i;
    ClockGenerator clockGenerator(clock);
    DataMemory dataMemory(clock, memWrite, memRead, address, writeData, readData);
    initial
        begin
            memWrite <= 0;
            memRead <= 0;
            i = 0;
            while (i <= 15) begin
                @(posedge clockGenerator); address <= i*5;
                i = i+1;
            end
            #10 memWrite <= 1;
            i = 0;
            while (i <= 15) begin
                @(posedge clockGenerator); address <= i*5; writeData <= i+1;
                i = i+1;
            end
            #10 memWrite <= 0; memRead <= 1;
            i = 0;
            while (i <= 15) begin
                @(posedge clockGenerator); address <= i*5;
                i = i+1;
            end
        end
endmodule