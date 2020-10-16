`timescale 1ps / 1ps
module t_alu();
	reg [7:0] a;
	reg [7:0] b;
	reg [2:0] f;
	wire [7:0] y;
	reg diff;
	
	reg Clock_50;
	integer i;
	integer j;
	alu op(.a(a),.b(b),.y(y),.f(f));
	
	initial begin
		Clock_50<= 0;
	end
		
	
	always @(*) begin
		#10 Clock_50 <= ~Clock_50;
		
	end
	
	initial begin
		
		
		//test function zero (+)
		#10 f <= 0;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a+b ? 0 : 1;
			end
		end
		
		//test function one (-)
		#10 f <= 1;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a-b ? 0 : 1;
			end
		end
		
		//test function two (<<)
		#10 f <= 2;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a<<1 ? 0 : 1;
			end
		end
		//test function three (>>)x
		#10 f <= 3;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a>>1 ? 0 : 1;
			end
		end
		
		//test function four (and)
		#10 f <= 4;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==(a&b) ? 0 : 1;
			end
		end
		
		//test function five (or)
		#10 f <= 5;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a|b ? 0 : 1;
			end
		end
		//test function six (xor)
		#10 f <= 6;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y==a^b ? 0 : 1;
			end
		end
		
		//test function seven (not)
		#10 f <= 7;
		for(i = 0; i<256;i = i + 1) begin
			for( j =0; j<256;j = j + 1) begin
				#20 a<=i;b<=j; diff <= y== ~a ? 0 : 1;
			end
		end
	end
endmodule
		
	