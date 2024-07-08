`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:40 03/06/2024 
// Design Name: 
// Module Name:    min 
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
module min(A,B,C,D,clk, min_index
    );
	 input [2:0] A,B,C,D;
	 input clk;
	 output min_index;
	 reg [7:0] min_index;
	 
	 initial begin
		min_index<=8'b0;
	end
	always @(posedge clk) begin
		if((A<=B) && (A<=C) && (A<=D)) begin
			min_index <= 8'b00110000;
		end
		else if((B<=A) && (B<=C) && (B<=D)) begin
			min_index <= 8'b00110001;
		end
		else if((C<=A) && (C<=B) && (C<=D)) begin
			min_index <= 8'b00110010;
		end
		else if((D<=A) && (D<=C) && (D<=C)) begin
			min_index <= 8'b00110011;
		end
	end
		


endmodule
