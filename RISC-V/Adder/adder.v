//Reza Mansouri 972023033
module Adder(
    input1, input2,
    resultOutput);
    //number of bits of operands
    parameter n = 64;

    input [n-1:0] input1, input2;
    //the output has one extra bits for carry
    output [n:0] resultOutput;

    wire [n-1:0] P, G;
    wire [n:0] C;

    assign C[0] = 1'b0;
    assign resultOutput[n] = C[n];

    genvar i;
    generate
        for (i = 0; i < n; i = i+1)
            begin
                assign P[i] = input1[i] | input2[i];
                assign G[i] = input1[i] & input2[i];
                assign C[i+1] = G[i] | (P[i] & C[i]);
                assign resultOutput[i] = input1[i] ^ input2[i] ^ C[i];
            end
    endgenerate
endmodule
