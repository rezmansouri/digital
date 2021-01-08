//Reza Mansouri 972023033
`include "ClockGenerator/clockGenerator.v"
`include "CPU.v"

module CPUTestbench;
    wire clock;
    wire [47:0] address;
    reg [5:0] testData;
    integer i;

    assign address = testData;

    clockGenerator clockGenerator(clock);
    CPU cpu(clk, address);

    initial
        begin
        i = 0;
        while (i <= 6) begin
            @(posedge clock); testData <= i;
            i = i+1;
        end
    end
endmodule
