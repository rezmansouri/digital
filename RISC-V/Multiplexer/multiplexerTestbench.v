//Reza Mansouri 972023033
`include "../ClockGenerator/clockGenerator.v"
`include "multiplexer.v"

module MultiplexerTestbench;
    wire clock;
    reg [31:0] option1, option2;
    wire [31:0] result;
    reg choice;

    ClockGenerator clockGenerator(clock);
    Multiplexer multiplexer(option1, option2, choice, result);

    initial begin

        @(posedge clock); option1 = 0; option2 = 32'h87654321; choice <= 0;
        @(posedge clock); choice <= 1;

        @(posedge clock); option1 = 0; option2 = 32'h12345678; choice <= 0;
        @(posedge clock); choice <= 1;

        @(posedge clock); option1 = 32'h11112222; option2 = 0; choice <= 0;
        @(posedge clock); choice <= 1;

    end
endmodule 
