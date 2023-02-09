module convert_num ( select , input_number , result );

    input select ;
    input [4:0] input_number ;
    output reg [4:0] result ;

    always @( input_number ) begin

        //this section converts bcd number to gray number.

        if ( select == 0 ) begin

            if ( result > 9 ) begin
                result = result - 6 ;
            end  
            else begin
                result = result ;
            end    
            
            result[4] = input_number[4] ;
            result[3] = input_number[3] ^ input_number[4] ;
            result[2] = input_number[2] ^ input_number[3] ;
            result[1] = input_number[1] ^ input_number[2] ;
            result[0] = input_number[0] ^ input_number[1] ;


        end

        //this section converts gray number to bcd number.
        else begin

            
            result[4] = input_number[4] ;
            result[3] = result[4] ^ input_number[3] ;
            result[2] = result[3] ^ input_number[2] ;
            result[1] = result[2] ^ input_number[1] ;
            result[0] = result[1] ^ input_number[0] ;


            if ( result > 9 ) begin
                result = result + 6 ;
            end
            else begin
                result = result ;
            end
            if ( result > 19 ) begin
                result = result + 12 ;
            end
            else begin
                result = result ;
            end
            if ( result > 29 ) begin
                result = result + 18 ;
            end
            else begin
                result = result ;
            end
           
        end

    end
endmodule
