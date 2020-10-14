`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dimitris Christodoulou
// 
// Create Date:    18:49:14 10/17/2018 
// Design Name: 
// Module Name:    BUTTON_COUNTER 
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
module BUTTON_COUNTER(reset, button, counter);
input reset, button;
output reg [3:0] counter;

always @(posedge button or posedge reset)
begin
	if (reset)
		counter = 0;
	else
		counter = counter + 1;
end

endmodule
