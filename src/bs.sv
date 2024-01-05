//Booth Selector

module b_selector (
    input [25:0] X1,
    input [25:0] X2,
    input [25:0] X3,
    input [25:0] X4,
    input [4:0] Y, 		//Input's booth encoding
    output logic [25:0] P);

   always @(X1,X2,X3,X4,Y) begin	//Update of the partial products at every change of the inputs
    
    case (Y)
        5'b00000 : P = 26'b0;
        5'b00001 : P = X1;
        5'b00010 : P = X2;
        5'b00100 : P = X3;
        5'b01000 : P = X4;
        5'b10001 : P = ~X1;
        5'b10010 : P = ~X2;
        5'b10100 : P = ~X3;
        5'b11000 : P = ~X4;
        default : P = 26'b0;
    endcase

   end

endmodule
