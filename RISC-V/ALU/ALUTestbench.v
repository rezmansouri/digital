//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "ALU.v"

module ALUTestbench;
    wire clock;
    reg [63:0] input1, input2;
    reg [3:0] aluControl;
    wire [63:0] aluResult;
    wire zero;

    ClockGenerator clockGenerator (clock);
    ALU alu(input1, input2, aluControl, aluResult, zero);

    initial begin

        //AND for ALU Ctrl
        aluControl <= 4'b0000;
        @(posedge clock); input1 = 64'h0000AAAA; input2 = 64'h00000110;
        @(posedge clock); input1 = 64'hFFFFFFFF; input2 = 64'h01010101;
        #10

        //OR for ALU Ctrl
        aluControl <= 4'b0001;
        @(posedge clock); input1 = 64'h0000AAAA; input2 = 64'hAAAA0000;
        @(posedge clock); input1 = 64'h11001100; input2 = 64'h01010101;
        #10

        //ADD for ALU Ctrl
        aluControl <= 4'b0010;
        @(posedge clock); input1 = 64'd123; input2 = 64'd321;
        @(posedge clock); input1 = 64'd750; input2 = 64'd250;
        #10

        //SUB for ALU Ctrl
        aluControl <= 4'b0110;
        @(posedge clock); input1 = 64'd128; input2 = 64'd64;
        @(posedge clock); input1 = 64'd12345; input2 = 64'd2345;

    end
endmodule
