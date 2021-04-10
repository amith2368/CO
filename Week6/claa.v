`timescale 1ns/1ps

module CLA_Adder(a, b, cin, sum, cout);
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout;
	wire p0, p1, p2, p3, g0, g1, g2, g3, c0, c1, c2, c3, c4;
	assign p0 = (a[0] ^ b[0]),
	p1 = (a[1] ^ b[1]),
	p2 = (a[2] ^ b[2]),
	p3 = (a[3] ^ b[3]);
	
	assign g0 = (a[0] & b[0]),
	g1 = (a[1] & b[1]),
	g2 = (a[2] & b[2]),
	g3 = (a[3] & b[3]);
	
	assign c0 = cin,
	c1 = g0 | (p0 & cin),
	c2 = g1 | (p1 & g0) | (p1 & p0 & cin),
	c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin),
	c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);
	
	assign sum[0] = p0 ^ c0,
	sum[1] = p1 ^ c1,
	sum[2] = p2 ^ c2,
	sum[3] = p3 ^ c3;
	
	assign cout = c4;
    
endmodule // ADDER

module CLA_Adder_tb; 
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    CLA_Adder add( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        #0      a = 4'b0000; b = 4'b0000; cin = 0;
        #10     a = 4'b0000; b = 4'b0000; cin = 1;
        #10     a = 4'b0000; b = 4'b0001; cin = 0;
        #10     a = 4'b0000; b = 4'b0001; cin = 1;
        #10     a = 4'b0000; b = 4'b0010; cin = 0;
        #10     a = 4'b0000; b = 4'b0010; cin = 1;
        #10     a = 4'b0000; b = 4'b0011; cin = 0;
        #10     a = 4'b0000; b = 4'b0011; cin = 1;
        #10     a = 4'b0000; b = 4'b0100; cin = 0;
        #10     a = 4'b0000; b = 4'b0100; cin = 1;
        #10    a = 4'b0000; b = 4'b0101; cin = 0;
    end

    initial begin
        $monitor("%d: a=%b b=%b cin=%b sum=%b cout=%b",$time,a,b,cin,sum,cout);
    end
endmodule // CLAA Testbench
