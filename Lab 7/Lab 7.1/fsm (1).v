`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:34 03/06/2024 
// Design Name: 
// Module Name:    fsm 
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
module fsm(clk, Y, state
    );
	input clk;
	input [1:0] Y;
	output state;
	reg[3:0] state;
	reg [2:0] microcode[0:12];
	reg [3:0] drom1[0:3];
	reg [3:0] drom2[0:3];
	reg[26:0] cnt = 27'b0;
	initial begin
		microcode[0] = 3'b0;
		microcode[1] = 3'b0;
		microcode[2] = 3'b0;
		microcode[3] = 3'b001;
		microcode[4] = 3'b010;
		microcode[5] = 3'b010;
		microcode[6] = 3'b0;
		microcode[7] = 3'b0;
		microcode[8] = 3'b0;
		microcode[9] = 3'b0;
		microcode[10] = 3'b011;
		microcode[11] = 3'b100;
		microcode[12] = 3'b100;
		
		drom1[0] = 4'b0100;
		drom1[1] = 4'b0101;
		drom1[2] = 4'b0110;
		drom1[3] = 4'b0110;
		
		drom2[0] = 4'b1011;
		drom2[1] = 4'b1100;
		drom2[2] = 4'b1100;
		drom2[3] = 4'b1100;
	end
	
	always @(posedge clk) begin
		if(cnt==100000000) begin
				if(microcode[state]==0) begin
					state <= state+1;
				end
				else if(microcode[state]==1) begin
					state <= drom1[Y];
				end
				else if(microcode[state]==2) begin
					state <= 4'b0111;
				end
				else if(microcode[state]==3) begin
					state <= drom2[Y];
				end
				else if(microcode[state]==4) begin
					state <= 4'b0000;
				end
				cnt <= 27'b0;
		end
		else begin 
			cnt <=cnt+1;
		end
	end

endmodule
