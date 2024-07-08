`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:28 04/03/2024 
// Design Name: 
// Module Name:    checkf 
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
module memory(clk, val, pb);

input clk;
input pb;
wire clk;
wire pb;
output [7:0] val;
reg [7:0] val;

reg [15:0] memory [0:7];
reg check;
reg [15:0] enc;
wire [7:0] dec;
reg [6:0] t;
reg [3:0] cnt1;
reg [7:0] sum;

initial begin
	memory[0] <= 16'b0000000000000000;
	memory[1] <= 16'b1000100000000001;
	memory[2] <= 16'b0000000100000000;
	memory[3] <= 16'b1000000000000000;
	memory[4] <= 16'b0000000000000001;
	memory[5] <= 16'b0000100000000000;
	memory[6] <= 16'b1000000100010000;
	memory[7] <= 16'b0000000010000000;
	cnt1 <= 4'b0000;
	sum <= 8'b00000000;
	enc <= 16'b0000000000000000;
	t <= 0;
	check <= 0;
	val <= 0;
end

always @(posedge clk) begin
	if (cnt1 != 4'b1000 & t == 7'b1000000) begin
		enc <= memory[cnt1+1];
		t <= 0;
		sum <= sum + dec;
		cnt1 <= cnt1+1;
	end
	else begin
		t <= t+1;
	end
end

always @(posedge pb) begin
	if (check == 0) begin
		val <= sum;
		check <= 1;
	end
	else if (check==1) begin
		val[0] <= sum[0] ^sum[1] ^ sum[2] ^sum[3] ^ sum[4] ^ sum[5]^ sum[6] ^ sum[7];
		val[1] <= 0;
		val[2] <= 0;
		val[3] <= 0;
		val[4] <= 0;
		val[5] <= 0;
		val[6] <= 0;
		val[7] <= 0;
		check <= 0;
	end
end

encoder uut(clk, enc, dec);
endmodule
