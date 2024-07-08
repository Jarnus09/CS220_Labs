`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:50 02/28/2024 
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
module Top(clk,X,ROT_A,ROT_B,final_x,final_y
    );
	 input clk, ROT_A, ROT_B;
	 input [3:0] X;
	 output [3:0] final_x,final_y;
	 wire [3:0] final_x,final_y;
	 wire rotation_event;
	 
	 rotary_shaft uut0(clk,ROT_A,ROT_B,rotation_event);
	 square_grid uut1(clk,X,rotation_event,final_x,final_y);



endmodule
