`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:29 03/06/2024 
// Design Name: 
// Module Name:    lcd_min 
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
module lcd_min(clk, Y, lcd_rs, lcd_w, lcd_e, PB1, PB2, PB3, PB4, data   
    );
	 input [2:0] Y;
	 input clk, PB1, PB2, PB3, PB4;
	 output lcd_rs, lcd_w, lcd_e;
	 output [3:0] data;

	 wire lcd_rs, lcd_w, lcd_e;
	 wire [3:0] data;
	 
	 wire [7:0] db;
	 reg [127:0] line1,line2;
	 reg [2:0] A,B,C,D;
	 reg [1:0] cnt;
	 reg check=0;
	 initial begin
		cnt <= 2'b00;
		A<=3'b0;
		B<=3'b0;
		C<=3'b0;
		D<=3'b0;
		check<=0;
	end
	
	always @(posedge PB1) begin
		A<= Y;
		line1[127:120] <= 8'b00110000;
		line1[122:120] <= A;
		line1[119:112] <= 8'b00101100;
		line1[111:104] <= 8'b00100000;
	end
	always @(posedge PB2) begin
		B<= Y;
		line1[103:96] <= 8'b00110000;
		line1[98:96] <= B;
		line1[95:88] <= 8'b00101100;
		line1[87:80] <= 8'b00100000;
	end
	always @(posedge PB3) begin
		C<= Y;
		line1[79:72] <= 8'b00110000;
		line1[74:72] <= C;
		line1[71:64] <= 8'b00101100;
		line1[63:56] <= 8'b00100000;
	end
	always @(posedge PB4) begin
		D<= Y;
		line1[55:48] <= 8'b00110000;
		line1[50:48] <= D;
		line1[47:40] <= 8'b00101100;
		line1[39:32] <= 8'b00100000;
		line1[31:24] <= 8'b00100000;
		line1[23:16] <= 8'b00100000;
		line1[15:8] <= 8'b00100000;	
		line1[7:0] <= 8'b00100000;
		
		line2[127:120] <= db;
		line2[119:112] <= 8'b00100000;
		line2[111:104] <= 8'b00100000;
		line2[103:96] <= 8'b00100000;
		line2[95:88] <= 8'b00100000;
		line2[87:80] <= 8'b00100000;
		line2[79:72] <= 8'b00100000;
		line2[71:64] <= 8'b00100000;
		line2[63:56] <= 8'b00100000;
		line2[55:48] <= 8'b00100000;
		line2[47:40] <= 8'b00100000;
		line2[39:32] <= 8'b00100000;
		line2[31:24] <= 8'b00100000;
		line2[23:16] <= 8'b00100000;
		line2[15:8] <= 8'b00100000;
		line2[7:0] <= 8'b00100000;
		check<=1;


		
		
		
		


	end
	

	min uut(A,B,C,D,clk, db);
	lcd_driver uut1(line1, line2, clk, lcd_rs, lcd_w, lcd_e, data, check);
	
	



endmodule
