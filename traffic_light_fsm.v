`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:23:31 07/08/2023 
// Design Name: 
// Module Name:    traffic_light_fsm 
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
module traffic_light_fsm(
 input clk,
 input rst_n,
 input green_end,
 input red_end,
 input yellow_end,
 output reg [2:0] light_mainroad,
 output reg [2:0] light_crossroad,
 output wire state_green,
 output wire state_red,
 output wire state_yellow
 );
	//encode state
	localparam MGRE_CRED = 3'b000;// mainroad green and crossroad red
	localparam MYEL_CRED = 3'b001;// mainroad yellow and crossroad red
	localparam MRED_CRED1 = 3'b010;// mainroad red and crossroad red
	localparam MRED_CGRE = 3'b011;// mainroad red and crossroad green
	localparam MRED_CYEL = 3'b100;// mainroad red and crossroad yellow
	localparam MRED_CRED2 = 3'b101;// mainroad red and crossroad red
	//signal declaration
	reg [2:0] current_state, next_state;
	//next state
	always @ (*) begin
		case (current_state[2:0])
			MGRE_CRED: begin
				if(green_end) next_state = MYEL_CRED;
				else next_state = current_state;
			end
			MYEL_CRED: begin
				if(yellow_end) next_state = MRED_CRED1;
				else next_state = current_state;
			end
			MRED_CRED1: begin
				if(red_end) next_state = MRED_CGRE;
				else next_state = current_state;
			end
			MRED_CGRE: begin
				if(green_end) next_state = MRED_CYEL;
				else next_state = current_state;
			end
			MRED_CYEL: begin
				if(yellow_end) next_state = MRED_CRED2;
				else next_state = current_state;
			end
			MRED_CRED2: begin
				if(red_end) next_state = MGRE_CRED;
				else next_state = current_state;
			end
			default: next_state = current_state; //need to pay attention to this case
		endcase
	end
	//state register
	always @ (posedge clk) //reset syn
			begin
					if (~rst_n) current_state <= MRED_CRED1;
					else current_state <= next_state;
			end
	always @ (*) begin
	 case (current_state)
			MGRE_CRED: light_mainroad = 3'b100;
			MYEL_CRED: light_mainroad = 3'b010;
			default: light_mainroad = 3'b001;
	 endcase
	end
	always @ (*) begin
	 case (current_state)
			MRED_CGRE: light_crossroad = 3'b100;
			MRED_CYEL: light_crossroad = 3'b010;
			default: light_crossroad = 3'b001;
	 endcase
	end
//output signal for counter
assign state_green = (current_state == MGRE_CRED) | (current_state == MRED_CGRE);
assign state_yellow = (current_state == MYEL_CRED) | (current_state == MRED_CYEL);
assign state_red = (current_state == MRED_CRED1) | (current_state == MRED_CRED2);
endmodule

