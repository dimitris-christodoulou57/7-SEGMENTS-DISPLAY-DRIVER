`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dimitris Christodoulou
// 
// Create Date:    18:49:14 10/17/2018 
// Design Name: 
// Module Name:    TIME_COUNTER 
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
module TIME_COUNTER(clkdv, reset, counter);
input clkdv, reset;
output reg [3:0] counter;

//reg [3:0] up_counter;
//wire [3:0] up_counter_max;

//assign up_counter_max = 4'b1111;

reg [21:0] up_counter;
wire [21:0] up_counter_max;

assign up_counter_max = 22'b1011111010111100001000;

always @(posedge clkdv or posedge reset)
begin
	if (reset)
	begin
		up_counter = 0;//number of clock cycle
		counter = 0;//position for message 
	end
	else
	begin
		up_counter = up_counter + 1;//measure clock cycle
		if( up_counter >= up_counter_max)//if number of clock cycle is greater than max, shift one char and eliminate counter
		begin
			counter = counter + 1;
			up_counter = 0;
		end
	end
end

endmodule
