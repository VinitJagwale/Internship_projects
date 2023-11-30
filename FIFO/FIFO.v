///-------MEMORY_ARRAY---------///
module fifo #(parameter width=8,parameter depth=8)(
input w_clk, r_clk, rst, w_en, r_en,
input [width-1:0]data_in,
output full_flag, empty_flag,
output reg [width-1:0]data_out
);
reg [width-1:0] memo[depth-1:0];
reg [$clog2(depth)-1:0]w_ptr,r_ptr;
always@(posedge w_clk)
 begin
  if(rst==1) 
   begin 
     w_ptr<=0; r_ptr<=0; data_out<=0; 
   end
 end

always@(posedge w_clk)
 begin
    if(w_en & !full_flag)
     begin
 	memo[w_ptr]<=data_in;
        w_ptr<=w_ptr+1;
     end
 end

always@(posedge r_clk)
 begin
    if(r_en & !empty_flag)
     begin
 	data_out<=memo[r_ptr];
        r_ptr<=r_ptr+1;
     end
 end

assign full_flag = ((w_ptr+1'b1)==r_ptr);
assign empty_flag = (w_ptr == r_ptr);
endmodule
