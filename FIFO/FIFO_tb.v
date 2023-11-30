///-------------testbench-----------------------///
module tb;
reg w_clk, r_clk, rst, w_en, r_en;
reg [7:0]data_in;
wire full_flag, empty_flag;
wire [7:0]data_out;
always #10 w_clk=~w_clk;
always #20 r_clk=~r_clk;
fifo f1( w_clk, r_clk, rst, w_en, r_en, data_in, full_flag, empty_flag, data_out);
initial begin
w_clk=1'b1;
r_clk=1'b1;
$monitor("%0t rst=%b   w_en=%b   r_en=%b   data_in=%b   data_out=%b   full_flag=%b   empty_flag=%b ",$time,rst, w_en, r_en, data_in, data_out ,full_flag, empty_flag);
     rst<=1; 
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b10011001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b11100001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b10011001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b11110000;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b10011001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b11100001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b10011001;
#20  rst<=0; w_en<= 1; r_en<= 0; data_in<= 8'b11110000;
#20  w_en<= 0; r_en<= 1;

end
initial begin
#1000 $finish;
end
endmodule
