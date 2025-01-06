
module ALU_Mux8to1_tb;

    reg [2:0] A, B, Sel;
    
    wire [2:0] F;
    wire V, N, C, Z;

    ALU_Mux8to1 uut (A, B, Sel, F, V, N, C, Z);

    initial begin
        A = 3'b011; B = 3'b001; Sel = 3'b000; #10; //ADD
        
        A = 3'b011; B = 3'b001; Sel = 3'b001; #10; //SUB

        A = 3'b011; Sel = 3'b010; #10; //INC

        A = 3'b011; B = 3'b001; Sel = 3'b011; #10; //AND

        A = 3'b010; B = 3'b001; Sel = 3'b100; #10; //OR

        A = 3'b011; B = 3'b001; Sel = 3'b101; #20; //XOR

        A = 3'b011; Sel = 3'b110; #20; // 1'S CMP

        A = 3'b011; Sel = 3'b111; #20; //CMP
    end

endmodule