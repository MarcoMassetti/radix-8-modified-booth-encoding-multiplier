//Full adder

module FA (A,B,Ci,Co,S);

input A,B,Ci;
output Co, S;

 
	assign S = (A ^ B) ^ Ci;
	assign Co = (A & B) | (B & Ci) | (Ci & A);

endmodule
