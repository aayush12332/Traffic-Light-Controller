# Traffic Light Controller Using Verilog
* The purpose of this project is to design a methodology using Verilog to control the traffic with specified time delays for a T-Shaped road.*

# Table of Contents


1. [Methodology](#Methodology)
    - [Directions Considered](#directions-considered)
    - [Problem Statement](#problem-statement)
    - [State Diagram](#state-diagram)
    - [State Table](#state-table)
2. [RTL Code](#rtl-code)
    - [RTL Schematic View](#rtl-schematic-view)
3. [TESTBENCH](#testbench)
4. [Output Waveforms](#output-waveforms)
5. [Result](#result)





## Methodology

### Directions Considered

![directions](https://user-images.githubusercontent.com/83152452/131366734-67c76e3c-b53d-49ca-a5ba-fb058d19d578.png)

The directions, M1, MT, M2, S, that is been considered for analysis of our problem is shown in the figure. And, the problem statement is explained in the figure. 
Six states, S1, S2, S3, S4, S5, S6 are taken into consideration and state diagram, state table is made using the following logic explained in the figure. 

### Problem Statement

![Logic_Diagram](https://user-images.githubusercontent.com/83152452/131366783-8c025386-8011-4ef9-a766-d0a07e4244ac.png)

- Green light indicates that there is no traffic and there is easy flow of vehicles in that route/direction. 
- Red light indicates that there is a traffic jam and that route is blocked for the vehicles to move and, 
- Yellow light indicates that the route has medium flow of vehicles. 

Time delays for changing from one state to another is considered as, TMG(from S1 to S2), TY(from S2 to S3), TTG(from S3 to S4), TY(from S4 to S5), TSG(from S5 to S6) 
and TY(from S6 to S1) and the cycle continues.


### State Diagram

![State_Diagram](https://user-images.githubusercontent.com/83152452/131366795-bc45473d-4398-47bb-bad9-a520a779c8bc.png)

In Figure, The time delays are considered as follows :

- TMG = 7 seconds
- TY = 2 seconds
- TTG = 5 seconds
- TSG = 3 seconds

Until TMG seconds, the signal will remain in S1 state, and after TMG seconds, it will move to S2 state. Until TY seconds it will remain in S2 state and after TY seconds, 
it will move to S3 state, and so on. After TY seconds, in state S6, it will go back to S1 state and the cycle continues.


### State Table

![StateTable](https://user-images.githubusercontent.com/83152452/131366804-309b6e9a-4c9c-442b-8753-281a933254f6.png)

In Figure, 
- R = RED, 
- Y = YELLOW and, 
- G = GREEN.

ST = State Transition; A, B and C are considered as the present state.
The state table is made, considering the Logic diagram/problem statement given in Figure. 
From the Figure it is understood that, 

In state S1(001);	

```
     1. M1 = GREEN, implies, RYG value = 001,
     2. MT = RED, implies, RYG value = 100,
     3. M2 = GREEN, implies, RYG value = 001 and,
     4. S = RED, implies, RYG value = 100.
     
```     
                 
After TMG seconds,

In state S2(010);	

```
      1. M1 = GREEN, implies, RYG value = 001, 
      2. MT = RED, implies, RYG value = 100,     
      3. M2 = YELLOW, implies, RYG value = 010 and,
      4. S = RED, implies, RYG value = 100.
      
```

After TY seconds,

In state S3(011);	

```
      1. M1 = GREEN, implies, RYG value = 001,
      2. MT = GREEN, implies, RYG value = 001,
      3. M2 = RED, implies, RYG value = 100 and,
      4. S = RED, implies, RYG value = 100.
      
```      
      
After TTG seconds,

In state S4(100);	

```
      1. M1 = YELLOW, implies, RYG value = 010,
      2. MT = YELLOW, implies, RYG value = 010,
      3. M2 = RED, implies, RYG value = 100 and,
      4. S = RED, implies, RYG value = 100.
      
```

After TY seconds,

In state S5(101);	

```
      1. M1 = RED, implies, RYG value = 100,
      2. MT = RED, implies, RYG value = 100,
      3. M2 = RED, implies, RYG value = 100 and,
      4. S = GREEN, implies, RYG value = 001.
      
```

After TSG seconds,

In state S6(110);

```
       1. M1 = RED, implies, RYG value = 100,
       2. MT = RED, implies, RYG value = 100,
       3. M2 = RED, implies, RYG value = 100 and,
       4. S = YELLOW, implies, RYG value = 010.

```

And after S6 state, the cycle repeats and goes to S1 state.




## RTL Code

```

`timescale 1ns / 1ps
module traffic(
    input clk,rst,
    output reg [2:0]light_M1,light_M2, light_S, light_MT
	 );
	 
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    reg [3:0]count;
    reg[2:0] ps;
    parameter  sec7=7,sec5=5,sec2=2,sec3=3;
	 
    always@(posedge clk or posedge rst)
        begin
        if(rst)
        begin
        count<=0;
        end
        else 
            case(ps)
                S1: if(count<sec7)
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                        count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b010;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                        count<=0;
                        end
                S2: if(count<sec2)
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b010;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                        count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b100;
                       light_MT<=3'b001;
                       light_S<=3'b100;
                        count<=0;
                        end
              S3: if(count<sec5)
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b100;
                       light_MT<=3'b001;
                       light_S<=3'b100;
                        count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b010;
                       light_M2<=3'b100;
                       light_MT<=3'b010;
                       light_S<=3'b100;
                        count<=0;
                        end
                S4:if(count<sec2)
                        begin
                        light_M1<=3'b010;
                       light_M2<=3'b100;
                       light_MT<=3'b010;
                       light_S<=3'b100;
                        count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_MT<=3'b100;
                       light_S<=3'b001;
                        count<=0;
                        end
                S5:if(count<sec3)
                        begin
                        light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_MT<=3'b100;
                       light_S<=3'b001;
                        count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_MT<=3'b100;
                       light_S<=3'b010;
                        count<=0;
                        end
                S6:if(count<sec2)
                        begin
                          light_M1<=3'b100;
                          light_M2<=3'b100;
                          light_MT<=3'b100;
                          light_S<=3'b010;
                          count<=count+1;
                        end
                    else
                        begin
                        light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                        count<=0;
                        end
                default: 
                begin 
                       light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_MT<=3'b100;
                       light_S<=3'b100;
                     end
                endcase
            end   
endmodule

```

### RTL Schematic View

![RTL Schematic View](https://user-images.githubusercontent.com/83152452/131369733-eb1964e5-319f-4997-9b3e-6f6ee3e2fb6e.jpeg)


## TESTBENCH

```

`timescale 1ns / 1ps
module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
wire [3:0] count;
wire [2:0]ps;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_S(light_S)  ,.light_M2(light_M2),.light_MT(light_MT)  );
initial
begin
    clk=1'b0;
    forever #(1000000000/2) clk=~clk;
end

initial
begin
    rst=0;
    #1000000000;
    rst=1;
    #1000000000;
    rst=0;
    #(1000000000*200);
    $finish;
end
endmodule

```


## Output Waveforms


![Output_waveform-1](https://user-images.githubusercontent.com/83152452/131370429-58f902d3-c104-45b5-95d6-1ca116aad0b2.jpeg)

![Output_waveform-2](https://user-images.githubusercontent.com/83152452/131370436-da8ce8c4-5afe-4567-b893-7d99ae9cd23e.jpeg)

![Output_waveform-3](https://user-images.githubusercontent.com/83152452/131370443-ac740d0d-8fa6-49ef-b478-af36d457b6f3.jpeg)


## Result

In this model we have observed various stages which describes about every signals. For example, Consider that at first stage (north-south end) signals gives some indication. 
Then, the signal is red that means signal at east-west side gives a green indication and traffic moves to their respective direction. Then after some delay yellow signal is 
obtain at east-west side and after the red signal arrives at the same time at the north-south end red signal goes off and green signal gets on and traffic moves to their 
particular direction. In this way process continues in the loop every day. 

The modern ways of multi-way traffic management improves the traffic condition up to a large extent. Traffic intensity is sensed and accordingly time is allotted for traffic to
pass. Verilog HDL is used to circuit description, code is generated which is simulated using Xilinx14.5.

This traffic light control system works on the concept of fixed time allocation at each side of the junction which cannot be changed as per varying traffic density. 
Timings allotted at every junction are fixed. Sometimes higher traffic density at one side of the junction demands longer time duration for green signal compared to the 
standard allotted time.

Thus, traffic light control system helps to conduct orderly flow of vehicles. There are lot many issues of obstacles, high level accidents which occurs every day. 
So, traffic signal controller prevents such occurrences. Still many areas or small towns don’t have the traffic light control facilities. And thus, many accident problems occur 
at those areas. Therefore, it is a primary purpose to have such facility in order to control and maintain the area.


