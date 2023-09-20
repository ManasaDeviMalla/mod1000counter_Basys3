`timescale 1ns / 1ps

module upcounter_7seg(
    input clk_100Mhz, 
    input reset,
    output reg [3:0] Anode_Activate, 
    output reg [0:6] seg_out   
    );
    
    wire reset_out;
    reg temp1, temp2, temp3;
    always @(posedge clk_100Mhz)
    begin
            temp1 <= reset;
            temp2 <= temp1;
            temp3 <= temp2;
    end
    assign reset_out = temp3;
       
    reg [26:0]one_second_counter; // counter for generating 1 second clock enable
    wire one_second_enable;// one second enable for counting numbers
    
    reg [9:0] displayed_count; // counting number to be displayed
    reg [3:0] displayed_count_reg; 
    // To select each anode in turn
     reg [1:0] anode_select;
     reg [16:0] anode_timer;
                    
   always @(posedge clk_100Mhz or posedge reset_out)
   begin
     if(reset_out) begin
         anode_select <= 0;
         anode_timer <= 0; 
     end
     else
         if(anode_timer == 99_999) begin
             anode_timer <= 0;
             anode_select <=  anode_select + 1;
         end
      else
          anode_timer <=  anode_timer + 1;
     end   
       
     always @(*) 
     begin
             case(anode_select)
                 0: Anode_Activate <= 4'b1110;
                 1: Anode_Activate <= 4'b1101;
                 2: Anode_Activate <= 4'b1011;
                 default:Anode_Activate <= 4'b1111;
             endcase
               end   
                            
    always @(posedge clk_100Mhz or posedge reset_out)
    begin
        if(reset_out==1)
            one_second_counter <= 0;
        else begin
            if(one_second_counter>=49999999) 
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end 
    assign one_second_enable = (one_second_counter==99999999)?1:0;
   
  
    
    //mod-1000 counter
     always @(posedge clk_100Mhz or posedge reset_out)
       begin
           if(reset_out==1)
               displayed_count <= 0;
           else if(one_second_enable==1)
               displayed_count <= displayed_count + 1;
       end
       
    
    always @(*)
    begin
        case(anode_select)
        2'b00: begin
            Anode_Activate <= 4'b1110; 
            displayed_count_reg <= displayed_count%10;
              end
        2'b01: begin
            Anode_Activate <= 4'b1101; 
            displayed_count_reg <= (displayed_count/10)%10;
              end
        2'b10: begin
            Anode_Activate <= 4'b1011; 
            displayed_count_reg <= (displayed_count/10)/10;
                end
       default:   begin
                   Anode_Activate <= 4'b1111; 
                  displayed_count_reg <= 0; 
                  end  
        endcase
    end
    
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(displayed_count_reg)
        4'b0000: seg_out <= 7'b0000001; // "0"     
        4'b0001: seg_out <= 7'b1001111; // "1" 
        4'b0010: seg_out <= 7'b0010010; // "2" 
        4'b0011: seg_out <= 7'b0000110; // "3" 
        4'b0100: seg_out <= 7'b1001100; // "4" 
        4'b0101: seg_out <= 7'b0100100; // "5" 
        4'b0110: seg_out <= 7'b0100000; // "6" 
        4'b0111: seg_out <= 7'b0001111; // "7" 
        4'b1000: seg_out <= 7'b0000000; // "8"     
        4'b1001: seg_out <= 7'b0000100; // "9" 
        default: seg_out <= 7'b0000001; // "0"
        endcase
    end
 endmodule
