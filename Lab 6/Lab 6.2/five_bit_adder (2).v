`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:37 02/28/2024 
// Design Name: 
// Module Name:    five_bit_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module five_bit_adder(X,dirn, dist, final_x, carry
    );
	 input [3:0] X;
	 input dirn;
	 input [1:0] dist;
	 output [3:0] final_x;
	 wire [3:0] final_x; 
	 output carry;
	 wire carry,carry0,carry1,carry2;
	 full_adder FA0(X[0],dist[0]^dirn,dirn,final_x[0],carry0);
	 full_adder FA1(X[1],dist[1]^dirn,carry0,final_x[1],carry1);
	 full_adder FA2(X[2],dirn,carry1,final_x[2],carry2);
	 full_adder FA3(X[3],dirn,carry2,final_x[3],carry);

endmodule
