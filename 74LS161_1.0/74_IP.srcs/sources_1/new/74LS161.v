`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2016 01:23:56 PM
// Design Name: 
// Module Name: 74LS161
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_74LS161(
input CR,
input CP,
input LD,
input EP,
input ET,
input D0,
input D1,
input D2,
input D3,
output Q3,
output Q2,
output Q1,
output Q0,
output QC

    );
    
    reg [3:0]Q_tmp;
    assign Q3=(CR==0)?0:Q_tmp[3];
    assign Q2=(CR==0)?0:Q_tmp[2];
    assign Q1=(CR==0)?0:Q_tmp[1];
    assign Q0=(CR==0)?0:Q_tmp[0];
    
    always@(posedge CP or negedge CR)
        if(CR==0)
            Q_tmp<=0;
        else if(CR==1)
        begin
            if(LD==0)
                Q_tmp<={D3,D2,D1,D0};
            else if((LD==1 && EP==0) | (LD==1 && ET==0))
                Q_tmp<=Q_tmp;
            else if(LD==1 && EP==1 && ET==1)
                Q_tmp<=Q_tmp+1;
        end
 
                
    
    
endmodule
