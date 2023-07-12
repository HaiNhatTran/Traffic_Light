# PROJECT - Traffic_Light
Purpose

The objective of the project is to study and design a traffic light control system using FPGA chip. This system will use sensors to determine the amount of traffic on the road and adjust the red and green light times according to actual needs.

Scope of the topic

        - Learn about FPGA chips and VHDL programming language
        - Design traffic light control circuit using FPGA chip.
        - Use sensors to measure vehicle traffic on the road.
        - Determine red and green light times based on actual demand and vehicle traffic data

# System Design, Architecture, and Performance

                Light signal status switch table

               Main Road	        Cross-section
                  Green	             Red
                  Yellow  	             Red
                  Red	             Red
                  Red	             Green
                  Red	             Yellow
                  Red	             Red
                  
Design of traffic light signal controller

                                #Traffic_light block diagram
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/c9a3e429-e585-47d9-9818-b125998a8839)

                                                Description of traffic light controller signal pins
                        Foot	                Type	        Width(bit)	Function(bit)
                        clk	                Input	        1	        Clock pulse signal
                        rst_n	                Input	        1	        Reset signal
                        switch	                Input	        1	        Status hold signal
                        light_mainroad	        Output	        3	        Main street light control output
                        light_crossroad        	Output	        3	        Horizontal street light control output


                                #Traffic light fsm unit pinout
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/cabdb96a-708c-4655-8bce-21f28364b87a)

                                #Traffic_light_fsm unit state diagram
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/66e60e4f-1d14-4953-9dbb-344c46bdf880)

                                #Delay_counter unit pinout
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/45985d59-9793-44fb-a3f3-c50f1abc39d5)

                                #Unit principle diagram delay_counter
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/e2894fbf-90d2-42ab-b892-008ec9b275ec)

                                #Design diagram of traffic light signal controller
![image](https://github.com/HaiNhatTran/Traffic_Light/assets/138964614/a4cd5ff3-7e8a-438a-8023-47b6e4d2f84a)


                                #Traffic_light_fsm unit activity status table
Current status T	Next status	        Condition	Output (Current Status)
MR_CR1	                MR_CG	                r_end = 1	         001&001
MR_CG	                MR_CY	                g_end = 1	        001&100
MR_CY	                MR_CR2	                y_end = 1	        001&010
MR_CR2	                MG_CR	                r_end = 1	        001&001
MG_CR	                MY_CR	                g_end = 1	        100&001
MY_CR	                MR_CR1	                y_end = 1	        010&001







