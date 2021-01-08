//Reza Mansouri 972023033
module ALU(input1, input2, ALUControlInput, ALUResultOutput, zero);
    input [63:0] input1, input2;
    input [3:0] ALUControlInput;
    output reg [63:0] ALUResultOutput;
    //The Zero Output Signal indicates the occurance of BEQ (branch on equal)
    output zero;
    //In a concurrent execution, whenever the ALUResultOutput is 0, we make the zero ouput signal 1 to inform the BEQ occurance
    if (ALUResultOutput == 0)
        assign zero = 1;
        else
        assign zero = 0;

    always @(ALUControlInput | input1 | input2)
        casex (ALUControlInput)
            //0 from alu ctrl indicating AND operation
            'b000: ALUResultOutput <= (input1 & input2);
            //1 from alu ctrl indicating OR operation
            'b001: ALUResultOutput <= (input1 | input2);
            //2 from alu ctrl indicating ADD operation
            'b010: ALUResultOutput <= (input1+input2);
            //6 from alu ctrl indicating SUB operation
            'b110: ALUResultOutput <= (input1-input2);
            default: ALUResultOutput <= 0;
        endcase
endmodule
