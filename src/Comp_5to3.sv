//5 to 3 compressor

module Comp_5to3 (X1, X2, X3, X4, Ti, To, C, S);
input X1, X2, X3, X4, Ti;
output To, C, S;

wire sum1;

	//First full adder
  	FA fa1 (.A (X4),
           	.B (X3),
           	.Ci (X2),
	  		 .Co (To),
 	   		.S (sum1));

	//Second full adder
   	FA fa2 (.A (sum1),
          	.B (X1),
          	.Ci (Ti),
         	.Co (C),
	     	.S (S));

endmodule
