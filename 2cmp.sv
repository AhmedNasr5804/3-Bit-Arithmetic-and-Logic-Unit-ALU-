module TwoComplement3bit (
    input  [2:0] A,
    output [2:0] F
);
    assign F = ~A + 3'b001;
endmodule