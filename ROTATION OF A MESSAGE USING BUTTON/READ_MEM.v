`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dimitris Christodoulou
// 
// Create Date:    01:38:11 10/15/2018 
// Design Name: 
// Module Name:    READ_MEM 
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
module READ_MEM(clk, reset, counter, char_an3, char_an2, char_an1, char_an0);
input clk;
input [3:0] counter;
input reset;
output reg [3:0] char_an3;
output reg [3:0] char_an2;
output reg [3:0] char_an1;
output reg [3:0] char_an0;
reg [3:0] mem [15:0];

always @(posedge clk or posedge reset)
begin
	if (reset)//if reset = 1 save data 
	begin
		mem[0] = 4'b0000;
		mem[1] = 4'b0001;
		mem[2] = 4'b0010;
		mem[3] = 4'b0011;
		mem[4] = 4'b0100;
		mem[5] = 4'b0101;
		mem[6] = 4'b0110;
		mem[7] = 4'b0111;
		mem[8] = 4'b1000;
		mem[9] = 4'b1001;
		mem[10] = 4'b1010;
		mem[11] = 4'b1011;
		mem[12] = 4'b1100;
		mem[13] = 4'b1101;
		mem[14] = 4'b1110;
		mem[15] = 4'b1111;
	end
	else//check counter(position) in order to define anode data
	begin
		case(counter)
		4'b0000:
		begin
			char_an3 = mem[0];
			char_an2 = mem[1];
			char_an1 = mem[2];
			char_an0 = mem[3];
		end
		4'b0001:
		begin
			char_an3 = mem[1];
			char_an2 = mem[2];
			char_an1 = mem[3];
			char_an0 = mem[4];
		end
		4'b0010:
		begin
			char_an3 = mem[2];
			char_an2 = mem[3];
			char_an1 = mem[4];
			char_an0 = mem[5];
		end
		4'b0011:
		begin
			char_an3 = mem[3];
			char_an2 = mem[4];
			char_an1 = mem[5];
			char_an0 = mem[6];
		end
		4'b0100:
		begin
			char_an3 = mem[4];
			char_an2 = mem[5];
			char_an1 = mem[6];
			char_an0 = mem[7];
		end
		4'b0101:
		begin
			char_an3 = mem[5];
			char_an2 = mem[6];
			char_an1 = mem[7];
			char_an0 = mem[8];
		end
		4'b0110:
		begin
			char_an3 = mem[6];
			char_an2 = mem[7];
			char_an1 = mem[8];
			char_an0 = mem[9];
		end
		4'b0111:
		begin
			char_an3 = mem[7];
			char_an2 = mem[8];
			char_an1 = mem[9];
			char_an0 = mem[10];
		end
		4'b1000:
		begin
			char_an3 = mem[8];
			char_an2 = mem[9];
			char_an1 = mem[10];
			char_an0 = mem[11];
		end
		4'b1001:
		begin
			char_an3 = mem[9];
			char_an2 = mem[10];
			char_an1 = mem[11];
			char_an0 = mem[12];
		end
		4'b1010:
		begin
			char_an3 = mem[10];
			char_an2 = mem[11];
			char_an1 = mem[12];
			char_an0 = mem[13];
		end
		4'b1011:
		begin
			char_an3 = mem[11];
			char_an2 = mem[12];
			char_an1 = mem[13];
			char_an0 = mem[14];
		end
		4'b1100:
		begin
			char_an3 = mem[12];
			char_an2 = mem[13];
			char_an1 = mem[14];
			char_an0 = mem[15];
		end
		4'b1101:
		begin
			char_an3 = mem[13];
			char_an2 = mem[14];
			char_an1 = mem[15];
			char_an0 = mem[0];
		end
		4'b1110:
		begin
			char_an3 = mem[14];
			char_an2 = mem[15];
			char_an1 = mem[0];
			char_an0 = mem[1];
		end
		default:
		begin
			char_an3 = mem[15];
			char_an2 = mem[0];
			char_an1 = mem[1];
			char_an0 = mem[2];
		end
		endcase
	end
end
endmodule
