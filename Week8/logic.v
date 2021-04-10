`timescale 1ns/1ps

module Logic(in1, in2, out, sel);
	input [3:0] sel;
	input signed[3:0] in1, in2;
	output reg signed[3:0] out;
	wire[3:0] o1, o2, o3, o4, o5, o6, o7, o8, o9, o10;
	
	assign o1 = in1 & in2;
	assign o2 = in1 | in2;
	assign o3 = in1 ^ in2;
	assign o4 = in1 >>> in2;
	assign o5 = in1 <<< in2;
	assign o6 = in1 >> in2;
	assign o7 = in1 << in2;
	assign o8 = ~in1;
		
	
	
	always @(*)
	begin
		case(sel)
			4'b0000 : out = o1; //and
			4'b0001 : out = o2; //or
			4'b0010 : out = o3; //xor
			4'b0011 : out = o4; //arith rshift
			4'b0100 : out = o5; //arith lshift
			4'b0101 : out = o6; //logic rshift
			4'b0110 : out = o7;
			4'b0111 : out = o8;
		endcase
		
	end 
	
	//Circular Right Shift
	always @(*)
		if (in2[1:0] == 2'b00 && sel == 4'b1000)
		begin
			out = in1;
		end
		else if (in2[1:0] == 2'b01 && sel == 4'b1000)
		begin
			out = {in1[0], in1[3:1]};
		end
		else if (in2[1:0] == 2'b10 && sel == 4'b1000)
		begin
			out = {in1[1:0], in1[3:2]};
		end
		else if (in2[1:0] == 2'b11 && sel == 4'b1000)
		begin
			out = in1;
		end
		
		//Circular Left Shift
		else if (in2[1:0] == 2'b00 && sel == 4'b1001)
		begin
			out = in1;
		end
		else if (in2[1:0] == 2'b01 && sel == 4'b1001)
		begin
			out = {in1[2:0], in1[3]};
		end
		else if (in2[1:0] == 2'b10 && sel == 4'b1001)
		begin
			out = {in1[1:0], in1[3:2]};
		end
		else if (in2[1:0] == 2'b11 && sel == 4'b1001)
		begin
			out = in1;
		end
	
endmodule	

module Logic_tb;
	reg[3:0] sel;
	reg signed[3:0] in1, in2;
	wire signed[3:0] out;
	
	Logic log(in1, in2, out, sel);
	
	initial begin;
	$monitor("time:%d in1:%b in2=%b out=%b sel=%b", $time,in1, in2, out, sel);
	#0	in1=4'b0111; in2=4'b0010; sel=4'b0000;
	#10 	in1=4'b0001; in2=4'b0011; sel=4'b0001;
	#10	in1=4'b0101; in2=4'b0011; sel=4'b0010;
	#10	in1=4'b1100; in2=4'b0001; sel=4'b0011;
	#10	in1=4'b0101; in2=4'b0001; sel=4'b0100;
	#10	in1=4'b1100; in2=4'b0010; sel=4'b0101;
	#10	in1=4'b0101; in2=4'b0011; sel=4'b0110;
	#10	in1=4'b0101; in2=4'b0001; sel=4'b0111;
	#10	in1=4'b0111; in2=4'b1001; sel=4'b1000;
	#10	in1=4'b0111; in2=4'b1101; sel=4'b1001;
		
	end 
endmodule







