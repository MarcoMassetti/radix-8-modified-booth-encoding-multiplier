//Booth Encoder

module b_encoder (input [3:0] Y, output logic [4:0] Y_o);


    always @(Y) begin	//Update of the encoding at every change of the input
    
    case (Y)
        4'd0 : Y_o = 5'b00000;
        4'd1 : Y_o = 5'b00001;
        4'd2 : Y_o = 5'b00001;
        4'd3 : Y_o = 5'b00010;
        4'd4 : Y_o = 5'b00010;
        4'd5 : Y_o = 5'b00100;
        4'd6 : Y_o = 5'b00100;
        4'd7 : Y_o = 5'b01000;
        4'd8 : Y_o = 5'b11000;
        4'd9 : Y_o = 5'b10100;
        4'd10 : Y_o = 5'b10100;
        4'd11 : Y_o = 5'b10010;
        4'd12 : Y_o = 5'b10010;
        4'd13 : Y_o = 5'b10001;
        4'd14 : Y_o = 5'b10001;
        4'd15 : Y_o = 5'b00000;

        default : Y_o = 5'b0000;
    endcase

   end

endmodule
