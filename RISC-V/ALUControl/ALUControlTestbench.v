//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "../Control/control.v"
`include "ALUControl.v"

module ALUControlTestbench;
    wire clock;
    reg [31:0] instruction;
    wire [6:0] opcode;
    wire branch, memRead, memToReg, memWrite, aluSrc , regWrite;
    wire [1:0] aluOp;
    wire [6:0] funct7;
    wire [2:0] funct3;
    wire [3:0] aluControl;

    wire [7:0] controls;
    assign controls = {aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp};

    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[31:25];

    clockGenerator clock (clock);
    controls ctrl(opcode, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
    ALUControl aluControl(aluOp, funct7, funct3, aluControl);

    initial begin
        @(posedge clk); instruction <= 32'h00512003;
        @(posedge clk); instruction <= 32'h000122A3;
        @(posedge clk); instruction <= 32'h00104263;
        @(posedge clk); instruction <= 32'h00208033;
        @(posedge clk); instruction <= 32'h41FF8FB3;
        @(posedge clk); instruction <= 32'h0056F033;
        @(posedge clk); instruction <= 32'h0178E1B3;
        @(posedge clk); instruction <= 32'hFFFFFFFF;
    end
endmodule
