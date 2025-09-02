
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