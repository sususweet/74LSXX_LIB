`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: bin2BCD
// Description: A Binary-to-BCD Converter with DELAY configuration parameter
// Parameters: DELAY
/////////////////////////////////////////////////////////////////

module bin2BCD #(parameter DELAY = 10)(
    input g,e,d,c,b,a,
    output y8,y7,y6,y5,y4,y3,y2,y1
    );
    
    reg [6:1]y;
    
    always@(*)begin
        if(g)
            y = 6'h3f;
        else begin
            case({e,d,c,b,a})
                5'b00000: y = 6'b00_0000; //0,1
                5'b00001: y = 6'b00_0001; //2,3
                5'b00010: y = 6'b00_0010; //4,5
                5'b00011: y = 6'b00_0011; //6,7
                5'b00100: y = 6'b00_0100; //8,9
                5'b00101: y = 6'b00_1000; //10,11
                5'b00110: y = 6'b00_1001; //12,13
                5'b00111: y = 6'b00_1010; //14,15
                5'b01000: y = 6'b00_1011; //16,17
                5'b01001: y = 6'b00_1100; //18,19
                5'b01010: y = 6'b01_0000; //20,21
                5'b01011: y = 6'b01_0001; //22,23
                5'b01100: y = 6'b01_0010; //24,25
                5'b01101: y = 6'b01_0011; //26,27
                5'b01110: y = 6'b01_0100; //28,29
                5'b01111: y = 6'b01_1000; //30,31
                5'b10000: y = 6'b01_1001; //32,33
                5'b10001: y = 6'b01_1010; //34,35
                5'b10010: y = 6'b01_1011; //36,37
                5'b10011: y = 6'b01_1100; //38,39
                5'b10100: y = 6'b10_0000; //40,41
                5'b10101: y = 6'b10_0001; //42,43
                5'b10110: y = 6'b10_0010; //44,45
                5'b10111: y = 6'b10_0011; //46,47
                5'b11000: y = 6'b10_0100; //48,49
                5'b11001: y = 6'b10_1000; //50,51
                5'b11010: y = 6'b10_1001; //52,53
                5'b11011: y = 6'b10_1010; //54,55
                5'b11100: y = 6'b10_1011; //56,57
                5'b11101: y = 6'b10_1100; //58,59
                5'b11110: y = 6'b11_0000; //60,61
                5'b11111: y = 6'b11_0001; //62,63
                default: y = 6'b11_1111;
            endcase
        end
            
    end
    
    assign #DELAY y8 = 1;    
    assign #DELAY y7 = 1;    
    assign #DELAY y6 = y[6];    
    assign #DELAY y5 = y[5];    
    assign #DELAY y4 = y[4];    
    assign #DELAY y3 = y[3];    
    assign #DELAY y2 = y[2];    
    assign #DELAY y1 = y[1];    
endmodule
