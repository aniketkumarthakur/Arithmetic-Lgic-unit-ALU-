
module ALU (
  input     wire [7:0]   a_i,
  input     wire [7:0]   b_i,
  input     wire [2:0]   op_i,

  output    reg [7:0]   alu_o,
  output    reg carry
);

  parameter  OP_ADD = 3'b000;
  parameter  OP_SUB = 3'b001;
  parameter  OP_SLL = 3'b010;
  parameter  OP_LSR = 3'b011;
  parameter  OP_AND = 3'b100;
  parameter  OP_OR  = 3'b101;
  parameter  OP_XOR = 3'b110;
  parameter  OP_EQL = 3'b111;

  always@(*) begin
    case (op_i)
      OP_ADD: {carry, alu_o}= {1'b0, a_i} + {1'b0, b_i};
      OP_SUB: alu_o = a_i - b_i;
      OP_SLL: alu_o = a_i[7:0] << b_i[2:0];
      OP_LSR: alu_o = a_i[7:0] >> b_i[2:0];
      OP_AND: alu_o = a_i[7:0] & b_i[7:0];
      OP_OR:  alu_o = a_i | b_i;
      OP_XOR: alu_o = a_i ^ b_i;
      OP_EQL: alu_o = {7'h0, a_i == b_i};
    endcase
  end

endmodule