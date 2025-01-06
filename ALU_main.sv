module ALU_Mux8to1(input  logic [2:0] A, B, Sel, output logic [2:0] F, output logic V, N, C, Z);          

    wire [2:0] add_res, sub_res, inc_res, and_res, or_res, xor_res, cmp_res, twoCmp_res;
    wire add_V, add_N, add_C, add_Z, sub_V, sub_N, sub_C, sub_Z, inc_V, inc_N, inc_C, inc_Z;
    wire sub_borrow, add_carry;

    fullAdder adder(A, B, add_res, add_carry, add_V, add_N, add_C, add_Z);

    fullSub subtractor(A, B, sub_res, sub_borrow, sub_V, sub_N, sub_C, sub_Z);

    Incrementer incrementer(A, 3'b001, inc_res, inc_V, inc_N, inc_C, inc_Z);

    AND and_op(A, B, and_res);

    OR or_op(A, B, or_res);

    XOR xor_op(A, B, xor_res);

    cmp cmp_op(A, cmp_res);

    TwoComplement3bit twoCmp_op(A, twoCmp_res);

    always @(*) begin
        case (Sel)
            3'b000: begin F = add_res; V = add_V; N = add_N; C = add_C; Z = add_Z; end // ADD
            3'b001: begin F = sub_res; V = sub_V; N = sub_N; C = sub_C; Z = sub_Z; end // SUB
            3'b010: begin F = inc_res; V = inc_V; N = inc_N; C = inc_C; Z = inc_Z; end // INC
            3'b011: begin F = and_res; V = 0; N = F[2]; C = 0; Z = (F == 3'b000); end  // AND
            3'b100: begin F = or_res; V = 0; N = F[2]; C = 0; Z = (F == 3'b000); end   // OR
            3'b101: begin F = xor_res; V = 0; N = F[2]; C = 0; Z = (F == 3'b000); end  // XOR
            3'b110: begin F = cmp_res; V = 0; N = F[2]; C = 0; Z = (F == 3'b000); end  // 1's cmp
            3'b111: begin F = twoCmp_res; V = 0; N = F[2]; C = 0; Z = (F == 3'b000); end  //2's cmp
            default: begin F = 3'b000; V = 0; N = 0; C = 0; Z = 1'b1; end
        endcase
    end

endmodule


