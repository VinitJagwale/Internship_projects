module alu( in1, in2, opcode, en, result);
input [31:0] in1, in2;
input [4:0]opcode;
input en;
output reg [31:0] result;
always@(opcode)
 begin
  if(en)
   begin
    case(opcode)
      5'd0:begin result = in1 + in2; end       //ADDTION
      5'd1:begin result = in1 - in2; end       //SUBTRACTION
      5'd2:begin result = in1 * in2; end       //MULTIPICATION
      5'd3:begin result = in1 / in2; end       //DIVISION
      5'd4:begin result = in1 % in2; end       //MODULUS
      5'd5:begin result = in2 - in1; end       //SUBTRACTION
      5'd6:begin result = in2 / in1; end       //DIVISION
      5'd7:begin result = in2 % in1; end       //MODULUS
      5'd8:begin result = in1 & in2; end       //LOGICAL AND
      5'd9:begin result = in1 | in2; end       //LOGICAL OR
      5'd10:begin result = in1 ^ in2; end      //LOGICAL XOR
      5'd11:begin result = ~(in1 & in2); end   //LOGICAL NAND
      5'd12:begin result = ~(in1 | in2); end   //LOGICAL NOR
      5'd13:begin result = ~(in1 ^ in2); end   //LOGICAL XNOR
      5'd14:begin result = in1 >> 1; end       //LOGICAL RIGHT SHIFT
      5'd15:begin result = in1 << 1; end       //LOGICAL LEFT SHIFT
      5'd16:begin result = in2 >> 1; end       //LOGICAL RIGHT SHIFT
      5'd17:begin result = in2 << 1; end       //LOGICAL LEFT SHIFT
      5'd18:begin result = ~in1; end           //INVERTER
      5'd19:begin result = ~in2; end           //INVERTER
      5'd20:begin result = in1 && in2; end     //BITWISE LOGICAL AND
      5'd21:begin result = in1 || in2; end     //BITWISE LOGICAL OR
      5'd22:begin result = in1 + 1; end        //INCREMENT
      5'd23:begin result = in2 + 1; end        //INCREMENT
      default :begin result = 32'dz; end
    endcase
   end
 end
endmodule

