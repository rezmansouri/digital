//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "immediateGenerator.v"

module ImmediateGeneratorTestbench;
    wire clock;
    reg [31:0] instruction;
    wire [63:0] immOut;

    clock_generator clockGenerator (clock);
    ImmediateGenerator immediateGenerator (instruction, immOut);

    initial begin

        @(posedge clock); instruction = 32'h0F053483; // ld x9, 240(x10)

        @(posedge clock); instruction = 32'h0E953823; // sd x9, 240(x10)

        @(posedge clock); instruction = 32'h7CB50863; // beq x10, x11, 2000

    end

endmodule
