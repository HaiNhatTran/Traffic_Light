`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:15 07/08/2023 
// Design Name: 
// Module Name:    delay_counter 
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
module delay_counter(
	 input clk,
	 input rst_n,
	 input state_green,
	 input state_red,
	 input state_yellow,
	 output wire green_end,
	 output wire red_end,
	 output wire yellow_end
	 );
	localparam GREEN_TIME = 3;
	localparam YELLOW_TIME = 1;
	localparam RED_TIME = 1;
	//signal declaration
	reg [7:0] clk_counter;
	wire clr_counter;
	always @ (posedge clk) begin
		 if (~rst_n) clk_counter[7:0] <= 8'd0;
		 else if (clr_counter) clk_counter[7:0] <= 8'd0;
		 else clk_counter[7:0] <= clk_counter[7:0] + 1'b1;
	end
	//Compare the end time 
	assign green_end = state_green & (clk_counter[7:0] == GREEN_TIME);
	assign yellow_end = state_yellow & (clk_counter[7:0] == YELLOW_TIME);
	assign red_end = state_red & (clk_counter[7:0] == RED_TIME);
	//
	assign clr_counter = green_end | yellow_end | red_end;
	endmodule

