`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:27:19 07/08/2023
// Design Name:   traffic_light
// Module Name:   D:/HK2_Nam3/TKVM/Traffic_light/test.v
// Project Name:  Traffic_light
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;
// Inputs
	reg clk;
	reg rst_n;
	reg switch;

	// Outputs
	wire [2:0] light_mainRoad;
	wire [2:0] light_crossRoad;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.switch(switch), 
		.light_mainRoad(light_mainRoad), 
		.light_crossRoad(light_crossRoad)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		switch = 0;
		#100;
		rst_n = 1;
		switch = 1;
		#100;
		rst_n = 0;
		switch = 1;
		#100;
		rst_n = 1;
		switch = 1;
		#100;
	end
       always
begin
clk=~clk;
#100;
end   
endmodule


