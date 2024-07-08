`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:47 02/28/2024 
// Design Name: 
// Module Name:    SevenBitSubtractor 
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
module SevenBitSubtractor(clk, X, rotation_event, sum, carry
    );
	input clk, rotation_event;
	input [3:0]X;
	
	output sum,carry;
	wire [6:0]sum;
	wire	carry, carry0, carry1, carry2, carry3, carry4, carry5, carry6;
	
	reg type, prev_rotation_event;
	reg [2:0] counter;
   reg [6:0] A;
	reg [6:0] B;
    
    initial begin 
			prev_rotation_event = 1'b1;
			counter <= 3'b0;
			type <= 1'b0;
			A <= 0;
			B <= 0;
	end
	always @(posedge clk) begin
		prev_rotation_event <= rotation_event;
		if((prev_rotation_event == 0)&&(rotation_event==1)) begin
			if(counter==0) begin
				A[3:0] <= X[3:0];
				counter <= counter + 1;
			end
			else if(counter==1) begin
				A[6:4] <= X[2:0];
				counter <= counter + 1;
			end
			else if(counter==2) begin
				B[3:0] <= X[3:0];
				counter <= counter + 1;
			end
			else if(counter==3) begin
				B[6:4] <= X[2:0];
				counter <= counter + 1;
			end
			else if(counter==4) begin
				type <= X[0];
				counter <= counter + 1;
			end
			else begin
				counter <= 3'b0;
		   end
		end
	end
	full_adder FA0(A[0], B[0]^type, type, sum[0], carry0);
	full_adder FA1(A[1], B[1]^type, carry0, sum[1], carry1);
	full_adder FA2(A[2], B[2]^type, carry1, sum[2], carry2);
	full_adder FA3(A[3], B[3]^type, carry2, sum[3], carry3);
	full_adder FA4(A[4], B[4]^type, carry3, sum[4], carry4);
	full_adder FA5(A[5], B[5]^type, carry4, sum[5], carry5);
	full_adder FA6(A[6], B[6]^type, carry5, sum[6], carry6);
   assign carry =carry6^carry5;
endmodule
