module fullAdder_oneBit (input  logic A,B, carryIn, output logic sum, carry);
    always @(*) begin
        sum = A ^ B ^ carryIn; 
        carry = (A & B) || (A & carryIn) || (B & carryIn);
    end
endmodule

module fullAdder (input  logic [2:0] A, B, output logic [2:0] sum, output logic carry, V, N, C, Z);
    wire carry1, carry2, carry3;

    assign carry1 = 0;

    fullAdder_oneBit FA0 (A[0], B[0], carry1, sum[0], carry2);
    fullAdder_oneBit FA1 (A[1], B[1], carry2, sum[1], carry3);
    fullAdder_oneBit FA2 (A[2], B[2], carry3, sum[2], carry);

     
    assign V = carry;
    assign C = carry;
    assign N = sum[2];
    assign Z = (sum == 3'b000);

endmodule
