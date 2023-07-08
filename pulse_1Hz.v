`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:56 07/08/2023 
// Design Name: 
// Module Name:    pulse_1Hz 
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
module pulse_1Hz
   #(parameter M = 50000000, N = 26)
	(
	input clk, reset,
	output q
	);
	//signal declaration
	reg [N-1 : 0] r_reg;
	wire [N-1 : 0] r_next;
	//body, register
	always @ (posedge clk, posedge reset)
			begin
				if (reset)
						r_reg <= 0;
				else
						r_reg <= r_next;
			end
	//next state logic
	assign r_next = (r_reg == M) ? 0 : r_reg + 1;
	//ouput
	assign q = (r_reg < M/2) ? 0 : 1;
endmodule

