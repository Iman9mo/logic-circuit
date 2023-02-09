
module test();

    reg select ;
    reg [4:0] input_number ;
    wire [4:0] result ;

    convert_num convert_num( select , input_number , result );

    initial begin

        //test 1 : converts bcd number to gray number.       
        select = 0 ;
        input_number = 5'b00100;
        
        #10 
	$display("the result is : %b\n" , result );
        
        //test 2 : converts gray number to bcd number.
        select = 1 ;
        input_number = 5'b01110 ;
        
        #10
        $display("the result is : %b\n" , result ); 
    
    end
endmodule