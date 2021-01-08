//Reza Mansouri 972023033
//This is a 2 to 1 MUX
module Multiplexer(
    option1Input, option2Input, choiceInput,
    resultOutput
);
    //The Dynamic length of input/output signals, 32 for default value
    parameter n = 32;
    input [n-1:0] option1Input, option2Input;
    input selection;
    output [n-1:0] resultOutput;
    if (selection == 0)
        assign resultOutput = option1Input;
        else
        assign resultOutput = option2Input;
endmodule : Multiplexer