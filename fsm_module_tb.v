`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:20:05 04/04/2024
// Design Name:   traffic_light_fsm
// Module Name:   E:/DO_AN/Traffic_Light/fsm_module_tb.v
// Project Name:  Traffic_light
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_module_tb;

	parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg rst_n;
    reg green_end, red_end, yellow_end;
    wire [2:0] light_mainroad, light_crossroad;
    wire state_green, state_red, state_yellow;

    // Instantiate the DUT
    traffic_light_fsm dut (
        .clk(clk),
        .rst_n(rst_n),
        .green_end(green_end),
        .red_end(red_end),
        .yellow_end(yellow_end),
        .light_mainroad(light_mainroad),
        .light_crossroad(light_crossroad),
        .state_green(state_green),
        .state_red(state_red),
        .state_yellow(state_yellow)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst_n = 0;
        green_end = 0;
        red_end = 0;
        yellow_end = 0;
        #50; // Wait for a bit before releasing reset
        rst_n = 1;
        // Test scenario
        #100; // Wait for a few clock cycles
        // Scenario 1: Main road green, crossroad red
        green_end = 1;
        red_end = 1;
        yellow_end = 0;
        #100; // Wait for a few clock cycles
        // Scenario 2: Main road yellow, crossroad red
        green_end = 0;
        yellow_end = 1;
        #100; // Wait for a few clock cycles
        // Scenario 3: Main road red, crossroad red
        yellow_end = 0;
        red_end = 0;
        #100; // Wait for a few clock cycles
        // Scenario 4: Main road red, crossroad green
        red_end = 1;
        green_end = 1;
        #100; // Wait for a few clock cycles
        // Scenario 5: Main road red, crossroad yellow
        green_end = 0;
        yellow_end = 1;
        #100; // Wait for a few clock cycles
        // Scenario 6: Main road red, crossroad red
        yellow_end = 0;
        red_end = 0;
        #100; // Wait for a few clock cycles
        // End of simulation
        $stop;
    end

endmodule

