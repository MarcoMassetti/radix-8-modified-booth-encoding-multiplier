//Radix 8 modified booth encoding unsigned multiplier

module R8B_MBE (X,Y, Z);

input [23:0] X;
input [23:0] Y;
output [47:0] Z;


	wire [4:0] BE_BS [8:0];		//Output of the booth encoders (input of the booth selectors)
 	wire [25:0] PPG_BS [3:0];	//Output of the partial product generators (input of the booth selectors)
	wire [25:0] BS_AU [8:0];	//Output of the booth selectors (input of the adder unit)
	wire n [7:0];				//Output signs of the booth encoders

	wire [27:0] BE_in;			//Input of the booth encoders 
	
	
	
	ppg PPG (.X(X), .X1(PPG_BS[0]), .X2(PPG_BS[1]), .X3(PPG_BS[2]), .X4(PPG_BS[3]));
	
	genvar i;

	assign BE_in = {3'b000, Y, 1'b0};	//Concatenation of zeros to the input multiplier to have the correct format for the booth encoders inputs
	
	generate	//Generate of the nine booth encoders
		for (i=0; i < 26; i=i+3) begin : BE
		
			b_encoder BE (.Y(BE_in[i+3:i]), .Y_o(BE_BS[i/3][4:0]));
			 
		end		
    endgenerate;
	
	generate	//Generate of the nine booth selectors
		for (i=0; i < 9; i=i+1) begin : BS
		
			b_selector	BS (.X1(PPG_BS[0]),
				            .X2(PPG_BS[1]),
			               	.X3(PPG_BS[2]),
				       	    .X4(PPG_BS[3]),
					    	.Y(BE_BS[i]), 
					    	.P(BS_AU[i]));		

		end;		
    endgenerate;

	assign n = {BE_BS[7][4], BE_BS[6][4], BE_BS[5][4], BE_BS[4][4], BE_BS[3][4], BE_BS[2][4], BE_BS[1][4], BE_BS[0][4]}; //Creation of the vector of sign bits from the booth encoders
	
	au au (.G(BS_AU), .N(n), .Z(Z));

	
endmodule

