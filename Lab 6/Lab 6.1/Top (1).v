`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:16 02/28/2024 
// Design Name: 
// Module Name:    Top 
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
module Top(clk, X, ROT_A, ROT_B, sum, carry
    );
	 input clk, ROT_A, ROT_B;
	 input [3:0] X;
	 output sum,carry;
	 wire [6:0] sum;
	 wire carry, rotation_event;
	 rotary_shaft uut0(clk, ROT_A, ROT_B, rotation_event);
	 SevenBitSubtractor uut1(clk, X, rotation_event, sum, carry);
	 
endmodule
