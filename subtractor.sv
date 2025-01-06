module fullSub_onebit (input  logic a,b, Bin, output logic diff, borrow);
    assign diff = a ^ b ^ Bin; 
    assign borrow = (~a & b) || ((~a | b) & Bin);
endmodule

module fullSub ( input  logic [2:0] a, b, output logic [2:0] diff, output logic borrow, output logic V, N, C, Z);
    
    wire B1, B2, B3;

    assign B1 = 0;

    fullSub_onebit FS1 (a[0], b[0], B1, diff[0], B2);
    fullSub_onebit FS2 (a[1], b[1], B2, diff[1], B3); 
    fullSub_onebit FS3 (a[2], b[2], B3, diff[2], borrow); 

    
    assign V = B3;
    assign C = borrow;
    assign N = diff[2];
    assign Z = (diff == 3'b000);
endmodule

