`timescale  1ns/1ps

module tb_R8B_MBE ();

	reg [23:0] X;
	reg [23:0] Y;
	wire [47:0] Z;

	reg [47:0] Z_ref;
	reg [47:0] diff;
	reg i;

	R8B_MBE DUT(.X(X), .Y(Y), .Z(Z));

	always @(X,Y) begin
		assign Z_ref = X*Y;
		assign diff = Z_ref ^ Z;
	end

	
	initial begin

		for(int i = 0; i<10000;i++) begin
			#10
			X = $urandom();
			Y = $urandom();
		end
				
		$display("Reached the end of the simulation");
		

	end

endmodule
