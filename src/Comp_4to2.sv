//4 to 2 compressor

module Comp_4to2 (X1,X2,X3,Ti,C,S,To);

input Ti, X1, X2, X3;
output C, S, To; 

wire a;

   //Half adder
   HA ha1 (.A (X3),
	       .B (X2),
	       .Co (To),
	       .S (a));

   //Full adder
   FA fa1 (.A (a),
           .B (X1),
	       .Ci (Ti),
           .Co (C),
           .S (S));
 
endmodule
