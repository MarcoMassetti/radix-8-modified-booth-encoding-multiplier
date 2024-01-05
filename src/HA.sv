//Half adder

module HA (A, B, S, Co);

input A, B;
output S, Co;

	assign Co = (A & B);
	assign S = (A ^ B);

endmodule
