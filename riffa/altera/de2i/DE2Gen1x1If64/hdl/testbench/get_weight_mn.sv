module get_weight_mn (
	
	input int signed i,j,m,n,
	input signed [31:0] x_ratio, y_ratio,
	input signed [31:0] x_old, y_old,
	
	output logic signed [31:0] dx, dy,
	output logic signed [31:0]	Rx, Ry
);

parameter SHIFT_AMOUNT = 8;
parameter FP128 = 7;

/*RESIZE LOGIC DECLARATION*/
//logic [31:0] x_old, y_old;//, y_ratio, x_ratio;

//assign y_ratio = rows << (SHIFT_AMOUNT - FP128);
//assign x_ratio = cols << (SHIFT_AMOUNT - FP128);

//assign x_old = (x_ratio*j) >> SHIFT_AMOUNT;
//assign y_old = (y_ratio*i) >> SHIFT_AMOUNT;

assign dx = ((j*x_ratio) - (x_old << SHIFT_AMOUNT)) - (n << SHIFT_AMOUNT);
assign dy = ((i*y_ratio) - (y_old << SHIFT_AMOUNT)) - (m << SHIFT_AMOUNT);

get_r_value r_value_x(dx, Rx);
get_r_value r_value_y(dy, Ry);
endmodule 