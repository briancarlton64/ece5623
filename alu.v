module alu(a,b,f,y);
	input [7:0] a;
	input [7:0] b;
	input [2:0] f;
	output reg [7:0] y;
	
	always @(*) begin
		case(f)
			3'b000:
				y <= a+b;
			3'b001:
				y <= a-b;
			3'b010:
				y <= a<<1'b1;
			3'b011:
				y <= a>>1'b1;
			3'b100:
				y <= a & b;
			3'b101:
				y <= a | b;
			3'b110:
				y <= a ^ b;
			3'b111:
				y <= ~a;	
			default:
				y <= 1'b0;
		endcase
	end
endmodule