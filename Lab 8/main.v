`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:31 03/13/2024 
// Design Name: 
// Module Name:    main 
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
module main(clk, rot_a, rot_b, Y, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7, pb1, pb2);

input wire clk;
input wire rot_a;
input wire rot_b;
input wire [3:0] Y;
input wire pb1;
input wire pb2;


output wire lcd_rs;
output wire lcd_rw;
output wire lcd_e;
output wire lcd4;
output wire lcd5;
output wire lcd6;
output wire lcd7;


reg [127:0] line1;
reg [127:0] line2;

wire rotation_event;
reg check;
wire done;
reg check_input;
reg [15:0] memory [0:31];





reg prev_rotation_event;
reg [2:0] opcode;

reg [15:0] read_data;
reg [4:0] read_addr1;
reg [4:0] read_addr2;
reg [4:0] write_addr;
reg [15:0] write_data;


reg [7:0] cnt;

reg [15:0] temp;


wire [15:0] xor;
wire comp_res;
reg [3:0] shift;
wire [15:0] right_shift;





initial begin
	

	memory [0] <= 0;
	memory [1] <= 0;
	memory [2] <= 0;
	memory [3] <= 0;
	memory [4] <= 0;
	memory [5] <= 0;
	memory [6] <= 0;
	memory [7] <= 0;
	memory [8] <= 0;
	memory [9] <= 0;
	memory [10] <= 0;
	memory [11] <= 0;
	memory [12] <= 0;
	memory [13] <= 0;
	memory [14] <= 0;
	memory [15] <= 0;
	memory [16] <= 0;
	memory [17] <= 0;
	memory [18] <= 0;
	memory [19] <= 0;
	memory [20] <= 0;
	memory [21] <= 0;
	memory [22] <= 0;
	memory [23] <= 0;
	memory [24] <= 0;
	memory [25] <= 0;
	memory [26] <= 0;
	memory [27] <= 0;
	memory [28] <= 0;
	memory [29] <= 0;
	memory [30] <= 0;
	memory [31] <= 0;

	cnt <= 0;
	prev_rotation_event <= 0;
	check_input <= 0;
end

always @(posedge clk) begin
	if (pb1 == 1) begin
		opcode <= Y[2:0];
		cnt <= 0;
	end
	else if (pb2 == 1) begin
		check_input <= 0;
		cnt <= 0;
	end
	else if (done == 1) begin
		cnt <= 0;
		check_input <= 0;
		check <= 0;
	end
	else if (check_input == 1) begin
		case (opcode)
			3'b000: begin
				memory [write_addr] <= write_data;
				
				line1[127:120] <= write_addr[4]+48;
				line1[119:112] <= write_addr[3]+48;
				line1[111:104] <= write_addr[2]+48;
				line1[103:96] <= write_addr[1]+48;
				line1[95:88] <= write_addr[0]+48;
				line1[87:0] <= "           ";			
				line2[127:120] <= write_data[15]+48;
				line2[119:112] <= write_data[14]+48;
				line2[111:104] <= write_data[13]+48;
				line2[103:96] <= write_data[12]+48;
				line2[95:88] <= write_data[11]+48;
				line2[87:80] <= write_data[10]+48;
				line2[79:72] <= write_data[9]+48;
				line2[71:64] <= write_data[8]+48;
				line2[63:56] <= write_data[7]+48;
				line2[55:48] <= write_data[6]+48;
				line2[47:40] <= write_data[5]+48;
				line2[39:32] <= write_data[4]+48;
				line2[31:24] <= write_data[3]+48;
				line2[23:16] <= write_data[2]+48;
				line2[15:8] <= write_data[1]+48;
				line2[7:0] <= write_data[0]+48;
			
				check_input <= 0;
				check <= 1;
			end
			3'b001: begin
				if (cnt == 0) begin
					read_data <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					line1[127:120] <= read_addr1[4]+48;
					line1[119:112] <= read_addr1[3]+48;
					line1[111:104] <= read_addr1[2]+48;
					line1[103:96] <= read_addr1[1]+48;
					line1[95:88] <= read_addr1[0]+48;
					line1[87:0] <= "           ";
					
					line2[127:120] <= read_data[15]+48;
					line2[119:112] <= read_data[14]+48;
					line2[111:104] <= read_data[13]+48;
					line2[103:96] <= read_data[12]+48;
					line2[95:88] <= read_data[11]+48;
					line2[87:80] <= read_data[10]+48;
					line2[79:72] <= read_data[9]+48;
					line2[71:64] <= read_data[8]+48;
					line2[63:56] <= read_data[7]+48;
					line2[55:48] <= read_data[6]+48;
					line2[47:40] <= read_data[5]+48;
					line2[39:32] <= read_data[4]+48;
					line2[31:24] <= read_data[3]+48;
					line2[23:16] <= read_data[2]+48;
					line2[15:8] <= read_data[1]+48;
					line2[7:0] <= read_data[0]+48;
				
					check_input <= 0;
					check <= 1;
					cnt <= 0;
				end
			end
			3'b010: begin
				if (cnt == 0) begin
					read_data <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					line1[127:120] <= read_data[15]+48;
					line1[119:112] <= read_data[14]+48;
					line1[111:104] <= read_data[13]+48;
					line1[103:96] <= read_data[12]+48;
					line1[95:88] <= read_data[11]+48;
					line1[87:80] <= read_data[10]+48;
					line1[79:72] <= read_data[9]+48;
					line1[71:64] <= read_data[8]+48;
					line1[63:56] <= read_data[7]+48;
					line1[55:48] <= read_data[6]+48;
					line1[47:40] <= read_data[5]+48;
					line1[39:32] <= read_data[4]+48;
					line1[31:24] <= read_data[3]+48;
					line1[23:16] <= read_data[2]+48;
					line1[15:8] <= read_data[1]+48;
					line1[7:0] <= read_data[0]+48;
					
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_data <= memory [read_addr2];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					line2[127:120] <= read_data[15]+48;
					line2[119:112] <= read_data[14]+48;
					line2[111:104] <= read_data[13]+48;
					line2[103:96] <= read_data[12]+48;
					line2[95:88] <= read_data[11]+48;
					line2[87:80] <= read_data[10]+48;
					line2[79:72] <= read_data[9]+48;
					line2[71:64] <= read_data[8]+48;
					line2[63:56] <= read_data[7]+48;
					line2[55:48] <= read_data[6]+48;
					line2[47:40] <= read_data[5]+48;
					line2[39:32] <= read_data[4]+48;
					line2[31:24] <= read_data[3]+48;
					line2[23:16] <= read_data[2]+48;
					line2[15:8] <= read_data[1]+48;
					line2[7:0] <= read_data[0]+48;
					
					cnt <= 0;
					check_input <= 0;
					check <= 1;
				end
			end
			3'b011: begin
				if (cnt == 0) begin
					memory [write_addr] <= write_data;
					read_data <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					line1[127:120] <= read_addr1[4]+48;
					line1[119:112] <= read_addr1[3]+48;
					line1[111:104] <= read_addr1[2]+48;
					line1[103:96] <= read_addr1[1]+48;
					line1[95:88] <= read_addr1[0]+48;
					line1[87:0] <= "           ";
					
					line2[127:120] <= read_data[15]+48;
					line2[119:112] <= read_data[14]+48;
					line2[111:104] <= read_data[13]+48;
					line2[103:96] <= read_data[12]+48;
					line2[95:88] <= read_data[11]+48;
					line2[87:80] <= read_data[10]+48;
					line2[79:72] <= read_data[9]+48;
					line2[71:64] <= read_data[8]+48;
					line2[63:56] <= read_data[7]+48;
					line2[55:48] <= read_data[6]+48;
					line2[47:40] <= read_data[5]+48;
					line2[39:32] <= read_data[4]+48;
					line2[31:24] <= read_data[3]+48;
					line2[23:16] <= read_data[2]+48;
					line2[15:8] <= read_data[1]+48;
					line2[7:0] <= read_data[0]+48;
				
					check_input <= 0;
					check <= 1;
					cnt <= 0;
				end
			end
			3'b100: begin
				if (cnt == 0) begin
					read_data <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					line1[127:120] <= read_data[15]+48;
					line1[119:112] <= read_data[14]+48;
					line1[111:104] <= read_data[13]+48;
					line1[103:96] <= read_data[12]+48;
					line1[95:88] <= read_data[11]+48;
					line1[87:80] <= read_data[10]+48;
					line1[79:72] <= read_data[9]+48;
					line1[71:64] <= read_data[8]+48;
					line1[63:56] <= read_data[7]+48;
					line1[55:48] <= read_data[6]+48;
					line1[47:40] <= read_data[5]+48;
					line1[39:32] <= read_data[4]+48;
					line1[31:24] <= read_data[3]+48;
					line1[23:16] <= read_data[2]+48;
					line1[15:8] <= read_data[1]+48;
					line1[7:0] <= read_data[0]+48;
					
					cnt <= 2;
				end
				else if (cnt == 2) begin
					memory [write_addr] <= write_data;
					read_data <= memory [read_addr2];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					line2[127:120] <= read_data[15]+48;
					line2[119:112] <= read_data[14]+48;
					line2[111:104] <= read_data[13]+48;
					line2[103:96] <= read_data[12]+48;
					line2[95:88] <= read_data[11]+48;
					line2[87:80] <= read_data[10]+48;
					line2[79:72] <= read_data[9]+48;
					line2[71:64] <= read_data[8]+48;
					line2[63:56] <= read_data[7]+48;
					line2[55:48] <= read_data[6]+48;
					line2[47:40] <= read_data[5]+48;
					line2[39:32] <= read_data[4]+48;
					line2[31:24] <= read_data[3]+48;
					line2[23:16] <= read_data[2]+48;
					line2[15:8] <= read_data[1]+48;
					line2[7:0] <= read_data[0]+48;
					
					cnt <= 0;
					check_input <= 0;
					check <= 1;
				end
			end
			3'b101: begin
				if (cnt == 0) begin
					temp <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_data <= memory [read_addr2];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					memory [write_addr] <= comp_result;
					line1[127:120] <= write_addr[4]+48;
					line1[119:112] <= write_addr[3]+48;
					line1[111:104] <= write_addr[2]+48;
					line1[103:96] <= write_addr[1]+48;
					line1[95:88] <= write_addr[0]+48;
					line1[87:0] <= "           ";
					
					line2[127:120] <= comp_result+48;
					line2[119:0] <= "               ";
					
					check_input <= 0;
					check <= 1;
					cnt <= 0;
				end
			end
			3'b110: begin
				if (cnt == 0) begin
					temp <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_data <= memory [read_addr2];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					memory [write_addr] <= xor;
					line1[127:120] <= write_addr[4]+48;
					line1[119:112] <= write_addr[3]+48;
					line1[111:104] <= write_addr[2]+48;
					line1[103:96] <= write_addr[1]+48;
					line1[95:88] <= write_addr[0]+48;
					line1[87:0] <= "           ";
					
					line2[127:120] <= xor[15]+48;
					line2[119:112] <= xor[14]+48;
					line2[111:104] <= xor[13]+48;
					line2[103:96] <= xor[12]+48;
					line2[95:88] <= xor[11]+48;
					line2[87:80] <= xor[10]+48;
					line2[79:72] <= xor[9]+48;
					line2[71:64] <= xor[8]+48;
					line2[63:56] <= xor[7]+48;
					line2[55:48] <= xor[6]+48;
					line2[47:40] <= xor[5]+48;
					line2[39:32] <= xor[4]+48;
					line2[31:24] <= xor[3]+48;
					line2[23:16] <= xor[2]+48;
					line2[15:8] <= xor[1]+48;
					line2[7:0] <= xor[0]+48;
					
					check_input <= 0;
					check <= 1;
					cnt <= 0;
				end
			end
			3'b111: begin
				if (cnt == 0) begin
					read_data <= memory [read_addr1];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					memory [write_addr] <= right_shift;
					line1[127:120] <= write_addr[4]+48;
					line1[119:112] <= write_addr[3]+48;
					line1[111:104] <= write_addr[2]+48;
					line1[103:96] <= write_addr[1]+48;
					line1[95:88] <= write_addr[0]+48;
					line1[87:0] <= "           ";
					
					line2[127:120] <= right_shift[15]+48;
					line2[119:112] <= right_shift[14]+48;
					line2[111:104] <= right_shift[13]+48;
					line2[103:96] <= right_shift[12]+48;
					line2[95:88] <= right_shift[11]+48;
					line2[87:80] <= right_shift[10]+48;
					line2[79:72] <= right_shift[9]+48;
					line2[71:64] <= right_shift[8]+48;
					line2[63:56] <= right_shift[7]+48;
					line2[55:48] <= right_shift[6]+48;
					line2[47:40] <= right_shift[5]+48;
					line2[39:32] <= right_shift[4]+48;
					line2[31:24] <= right_shift[3]+48;
					line2[23:16] <= right_shift[2]+48;
					line2[15:8] <= right_shift[1]+48;
					line2[7:0] <= right_shift[0]+48;
				
					cnt <= 0;
					check_input <= 0;
					check <= 1;
				end
			end
		endcase
	end
	else if (prev_rotation_event == 0 & rotation_event == 1) begin
		case (opcode)
			3'b000: begin
				if (cnt == 0) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					write_addr[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					write_data[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					write_data[7:4] <= Y[3:0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_data[11:8] <= Y[3:0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_data[15:12] <= Y[3:0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b001: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b010: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_addr2[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_addr2[4] <= Y[0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b011: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					write_addr[4] <= Y[0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_data[3:0] <= Y[3:0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_data[7:4] <= Y[3:0];
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_data[11:8] <= Y[3:0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data[15:12] <= Y[3:0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b100: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_addr2[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_addr2[4] <= Y[0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_addr[4] <= Y[0];
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_data[3:0] <= Y[3:0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data[7:4] <= Y[3:0];
					cnt <= 8;
				end
				else if (cnt == 8) begin
					write_data[11:8] <= Y[3:0];
					cnt <= 9;
				end
				else if (cnt == 9) begin
					write_data[15:12] <= Y[3:0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b101: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_addr2[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_addr2[4] <= Y[0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_addr[4] <= Y[0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b110: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_addr2[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_addr2[4] <= Y[0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_addr[4] <= Y[0];
					cnt <= 0;
					check_input <= 1;
				end
			end
			3'b111: begin
				if (cnt == 0) begin
					read_addr1[3:0] <= Y[3:0];
					cnt <= 1;
				end
				else if (cnt == 1) begin
					read_addr1[4] <= Y[0];
					cnt <= 2;
				end
				else if (cnt == 2) begin
					write_addr[3:0] <= Y[3:0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					write_addr[3:0] <= Y[0];
					cnt <= 4;
				end
				else if (cnt == 4) begin
					shift[3:0] <= Y[3:0];
					cnt <= 0;
					check_input <= 1;
				end
			end
		endcase
	end
	prev_rotation_event <= rotation_event;
end

assign xor = temp ^ read_data;
assign comp_res = $signed(temp) < $signed(read_data) ? 1 : 0;
assign right_shift = $signed(read_data) >>> shift;

lcd_driver uut1(check, line1, line2, clk, lcd_rs, lcd_rw, lcd_e, lcd4, lcd5, lcd6, lcd7, done);
detect_event uut2(clk, rot_a, rot_b, rotation_event);

endmodule
