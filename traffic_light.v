`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:50 07/08/2023 
// Design Name: 
// Module Name:    traffic_light 
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
module traffic_light(
	 input clk,
	 input rst_n,//low active
	 input switch,//low active 
	 output [2:0] light_mainRoad,
	 output [2:0] light_crossRoad
 );
wire green_end, red_end, yellow_end, state_green, state_red, state_yellow;
wire inter_clk;
and a1 (inter_clk, clk, switch);
delay_counter delay_module (
 .clk(inter_clk), 
 .rst_n(rst_n), 
 .state_green(state_green), 
 .state_red(state_red), 
 .state_yellow(state_yellow), 
 .green_end(green_end), 
 .red_end(red_end), 
 .yellow_end(yellow_end)
 );
traffic_light_fsm fsm_module (
 .clk(inter_clk), 
 .rst_n(rst_n), 
 .green_end(green_end), 
 .red_end(red_end), 
 .yellow_end(yellow_end), 
 .light_mainroad(light_mainRoad), 
 .light_crossroad(light_crossRoad), 
 .state_green(state_green), 
 .state_red(state_red), 
 .state_yellow(state_yellow)
 );
endmodule

