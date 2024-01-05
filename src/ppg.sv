//Partial Product Generator

module ppg (
    input  [23:0] X,
    output [25:0] X1,
    output [25:0] X2,
    output [25:0] X3,
    output [25:0] X4);
    
    assign X1 = {2'b0, X};			//Extension of the unsigned input value
    assign X2 = {1'b0, X, 1'b0};	//Shift left by one position (muliplication by 2)
    assign X4 = {X, 2'b0};			//Shift left by two position (muliplication by 4)
    assign X3 =  X2 + X1;

endmodule
