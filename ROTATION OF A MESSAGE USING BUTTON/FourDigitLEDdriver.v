`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dimitris Christodoulou
// 
// Create Date:    13:38:33 10/10/2018 
// Design Name: 
// Module Name:    FourDigitLEDdriver 
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
module FourDigitLEDdriver(reset, clk, button, an3, an2, an1, an0, a, b, c, d, e, f, g, dp, clkdv);
input clk, reset, button;
output an3, an2, an1 ,an0;
output a, b, c, d, e, f, g, dp;
output clkdv;

wire [3:0] char_an3, char_an2, char_an1, char_an0;
wire an3, an2, an1, an0;
wire [3:0] in;
wire clkdv, clk0, clkfb;
wire a, b, c, d, e, f, g, dp;
wire reset_state;
wire button_state;
wire [3:0] button_counter;

assign dp = 1;

ANTI_BOUNCE RESET_ANTI_BOUNCEINSTANCE(clk, reset, reset_state);//reset anti-bounce
ANTI_BOUNCE BUTTON_ANTI_BOUNCEINSTANCE(clk, button, button_state);//button anti-bounce

DCM #(
      .SIM_MODE("SAFE"),  // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
      .CLKDV_DIVIDE(16.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                          //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      .CLKFX_DIVIDE(1),   // Can be any integer from 1 to 32
      .CLKFX_MULTIPLY(4), // Can be any integer from 2 to 32
      .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
      .CLKIN_PERIOD(0.0),  // Specify period of input clock
      .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift of NONE, FIXED or VARIABLE
      .CLK_FEEDBACK("1X"),  // Specify clock feedback of NONE, 1X or 2X
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
      .DFS_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for frequency synthesis
      .DLL_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for DLL
      .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
      .FACTORY_JF(16'hC080),   // FACTORY JF values
      .PHASE_SHIFT(0),     // Amount of fixed phase shift from -255 to 255
      .STARTUP_WAIT("FALSE")   // Delay configuration DONE until DCM LOCK, TRUE/FALSE
   ) DCM_inst (
		.CLK0(clk0),     // 0 degree DCM CLK output
      .CLKDV(clkdv),   // Divided DCM CLK out (CLKDV_DIVIDE)
		.CLKFB(clkfb),   // DCM clock feedback
      .CLKIN(clk),   // Clock input (from IBUFG, BUFG or DCM)
      .RST(reset_state)   // DCM asynchronous reset input
   );
	
BUFGMUX BUFGMUX_inst (
      .O(clkfb),    // Clock MUX output
      .I0(clk0),  // Clock0 input
      .S(1'b0)     // Clock select input
   );

BUTTON_COUNTER BUTTON_COUNTERINSTANCE(reset_state, button_state, button_counter);//measure how many times push button and return position in message

READ_MEM READ_MEMINSTANCE(clk, reset_state, button_counter, char_an3, char_an2, char_an1, char_an0);//check counter in order to return 4 anode char

Counter COUNTERINSTANCE(clkdv, reset_state, char_an3, char_an2, char_an1, char_an0, an3, an2, an1, an0, in);//return input for LEDdecoder

LEDdecoder LEDdecoderINSTANCE (in, {a,b,c,d,e,f,g});

endmodule
