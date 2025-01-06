module Incrementer (input logic[2:0] A, Cin, output logic[2:0] Sum, output logic V, N, C, Z);
    wire[2:0] s, c;

    fullAdder inc(A, Cin,s,c,V, N, C, Z);

    assign Sum = s;
endmodule
