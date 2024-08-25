`include "alu_1.v"
module ALU_Tb;
  reg[7:0] a_i,b_i;
  reg[2:0] op_i;
  wire[7:0] alu_o;
  wire carry;
  ALU alu(a_i,b_i,op_i,alu_o,carry);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("a_i=%d,b_i=%d,op_i=%b,alu_o=%b",a_i,b_i,op_i,alu_o);
    repeat(8)begin
      {a_i,b_i,op_i}=$random;
      #5;
    end
  end
endmodule