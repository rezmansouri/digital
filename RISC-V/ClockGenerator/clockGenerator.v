module clockGenerator (output reg clk);
    initial clk <= 0;
    always #5 clk <= (!clk);
endmodule