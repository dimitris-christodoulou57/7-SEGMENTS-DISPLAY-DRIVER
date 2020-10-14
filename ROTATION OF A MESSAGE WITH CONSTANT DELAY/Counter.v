`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dimitris Christodoulou
// 
// Create Date:    14:16:02 10/10/2018 
// Design Name: 
// Module Name:    Counter 
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
module Counter(clkdv, reset, char_an3, char_an2, char_an1, char_an0, an3, an2, an1, an0, out);
input clkdv;
input reset;
input [3:0] char_an3;
input [3:0] char_an2;
input [3:0] char_an1;
input [3:0] char_an0;
output reg an3;
output reg an2;
output reg an1;
output reg an0;
output reg [3:0] out;

reg [3:0] counter;

always @(posedge clkdv or posedge reset)
begin 
	if (reset)
	begin
		counter = 4'b0000;
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		out = 4'b0000;
	end
	else if (counter == 4'b1110)//LED-3 
	begin
		an3 = 0;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		counter = counter - 1;
	end
	else if (counter == 4'b1100)//LOAD DATA LED-2
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		out = char_an2;
		counter = counter - 1;
	end
	else if (counter == 4'b1010)//LED-2
	begin
		an3 = 1;
		an2 = 0;
		an1 = 1;
		an0 = 1;
		counter = counter - 1;
	end
	else if (counter == 4'b1000)//LOAD DATA LED-1
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		out = char_an1;
		counter = counter - 1;
	end
	else if (counter == 4'b0110)//LED-1
	begin
		an3 = 1;
		an2 = 1;
		an1 = 0;
		an0 = 1;
		counter = counter - 1;
	end
	else if (counter == 4'b0100)//LOAD DATA LED-0
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		out = char_an0;
		counter = counter - 1;
	end
	else if (counter == 4'b0010)//LED-0
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 0;
		counter = counter - 1;
	end
	else if (counter == 4'b0000)//LOAD DATA LED-3
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		out = char_an3;
		counter = 4'b1111;
	end
	else 
	begin
		an3 = 1;
		an2 = 1;
		an1 = 1;
		an0 = 1;
		counter = counter - 1; 
	end
	
end


endmodule
