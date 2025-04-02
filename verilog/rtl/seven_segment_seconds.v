`default_nettype none

module seven_segment_seconds (
    `ifdef USE_POWER_PINS
         output vccd1,
         output vssd1,

     `endif 
 

     
    input wire clk,
    input wire reset,
    output wire [6:0] led_out,
      //output wire [6:0] led_oeb,
    output wire [6:0] io_oeb
    

);

    assign io_oeb = 7'b0000000; // Puerto extra en el módulo

    // Contador de 24 bits
    reg [23:0] second_counter;
    reg [3:0] digit;

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile("seven_segment_seconds.vcd");
            $dumpvars(0, seven_segment_seconds);
            #1;
        end
        localparam MAX_COUNT = 100; // Evitar redefinir MAX_COUNT
    `else
        localparam MAX_COUNT = 100;
    `endif

    always @(posedge clk) begin
        if (reset) begin
            second_counter <= 0;
            digit <= 0;
        end else begin
            if (second_counter == MAX_COUNT) begin
                second_counter <= 0;
                digit <= digit + 1'b1;

                if (digit == 9)
                    digit <= 0;
            end else begin
                second_counter <= second_counter + 1'b1;
            end
        end
    end

    // Instancia del display de 7 segmentos
    seg7 seg7_inst (
        .counter(digit), 
        .segments(led_out)
    );

endmodule



module seg7 (
    input wire [3:0] counter,
    output reg [6:0] segments
);

    always @(*) begin
        case(counter)
            //                7654321
            0:  segments = 7'b0111111;
            1:  segments = 7'b0000110;
            2:  segments = 7'b1011011;
            3:  segments = 7'b1001111;
            4:  segments = 7'b1100110;
            5:  segments = 7'b1101101;
            6:  segments = 7'b1111100;
            7:  segments = 7'b0000111;
            8:  segments = 7'b1111111;
            9:  segments = 7'b1100111;
            default:    
                segments = 7'b0000000;
        endcase
    end

endmodule

