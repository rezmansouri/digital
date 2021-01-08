//Reza Mansouri 972023033
`include "adder.v"
module AdderTestbench;
    parameter n = 64;
    reg [n-1:0] input1;
    reg [n-1:0] input2;
    wire [n:0] result;

    Adder#(n) adder(X, Y, result);

    initial
        begin
            //64+32
            input1 = 'd64;
            input2 = 'd32;
            #10;
            //5200+1000
            input1 = 'd5200;
            input2 = 'd1000;
        end

endmodule
