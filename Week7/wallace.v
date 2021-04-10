`timescale 1ns/1ps
//Multiplicaton module
module MUL(a, b, prod);
     input a,b;
     output prod;

     assign prod = a&b;
endmodule

//Half Adder module
module HA(a, b, sum, cout);
     input a, b;
     output sum, cout;

     assign sum = a^b;
     assign cout = a&b;
endmodule

//Full Adder Module
module FA(a, b, cin, sum, cout);
     input a, b, cin;
     output sum, cout;

     assign sum = ((a^b)^cin);
     assign cout = (a&b)|(a&cin)|(b&cin);
endmodule

//End Sum with Look-Ahead 
module SUM(p, g, cin, sum, cout);
      input p, g, cin;
      output sum, cout;

      assign sum = p^cin;
      assign cout = g|(p&cin);
endmodule

module CLA(a, b, cin, sum, cout);
     input[7:0] a,b;
     input cin;
     output[7:0] sum;
     output cout;
     wire p1, p2, p3, p4, p5, p6, p7, p8, g1, g2, g3, g4, g5, g6, g7, g8;

     HA pg1(a[0], b[0], p1, g1);
     HA pg2(a[1], b[1], p2, g2);
     HA pg3(a[2], b[2], p3, g3);
     HA pg4(a[3], b[3], p4, g4);
     HA pg5(a[4], b[4], p5, g5);
     HA pg6(a[5], b[5], p6, g6);
     HA pg7(a[6], b[6], p7, g7);
     HA pg8(a[7], b[7], p8, g8);

     wire c1, c2, c3, c4, c5, c6, c7;

     SUM sum1(p1, g1, cin, sum[0], c1);
     SUM sum2(p2, g2, c1, sum[1], c2);
     SUM sum3(p3, g3, c2, sum[2], c3);
     SUM sum4(p4, g4, c3, sum[3], c4);
     SUM sum5(p5, g5, c4, sum[4], c5);
     SUM sum6(p6, g6, c5, sum[5], c6);
     SUM sum7(p7, g7, c6, sum[6], c7);
     SUM sum8(p8, g8, c7, sum[7], cout);
endmodule

module Wallace(a, b, prod, cout);
     input [3:0] a,b;
     output [7:0] prod;
     output cout;
     wire a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3;

     MUL mul1(a[0], b[0], a0b0);
     MUL mul2(a[0], b[1], a0b1);
     MUL mul3(a[0], b[2], a0b2);
     MUL mul4(a[0], b[3], a0b3);
     MUL mul5(a[1], b[0], a1b0);
     MUL mul6(a[1], b[1], a1b1);
     MUL mul7(a[1], b[2], a1b2);
     MUL mul8(a[1], b[3], a1b3);
     MUL mul9(a[2], b[0], a2b0);
     MUL mul10(a[2], b[1], a2b1);
     MUL mul11(a[2], b[2], a2b2);
     MUL mul12(a[2], b[3], a2b3);
     MUL mul13(a[3], b[0], a3b0);
     MUL mul14(a[3], b[1], a3b1);
     MUL mul15(a[3], b[2], a3b2);
     MUL mul16(a[3], b[3], a3b3);

//----------------stage 1-------------

     wire s13, s14, c13, c14;
     HA ha1(a2b1, a3b0, s13, c13);
     HA ha2(a2b2, a3b1, s14, c14);

//--------------stage 2-----------

     wire s22, s23, s24, s25, c22, c23, c24, c25;
     HA ha3(a1b1, a2b0, s22, c22);
     FA fa1(a0b3, a1b2, s13, s23, c23);
     FA fa2(a1b3, s14, c13, s24, c24);
     FA fa3(a2b3, a3b2, c14, s25, c25);

//---------stage3--------------

     wire [7:0] ain, bin;
     wire cin;

     assign ain[0] = a0b0;
     assign ain[1] = a0b1;
     assign ain[2] = a0b2;
     assign ain[3] = s23;
     assign ain[4] = s24;
     assign ain[5] = s25;
     assign ain[6] = a3b3;
     assign ain[7] = 0;

     assign bin[0] = 0;
     assign bin[1] = a1b0;
     assign bin[2] = s22;
     assign bin[3] = c22;
     assign bin[4] = c23;
     assign bin[5] = c24;
     assign bin[6] = c25;
     assign bin[7] = 0;

     assign cin = 0;

     CLA cla(ain, bin, cin, prod, cout);
endmodule 

module Wallace_tb;
     reg [3:0] a,b;
     wire [7:0] prod;
     wire cout;

     Wallace wta(a, b, prod, cout);

     initial begin;
          #0  a=4'b0000; b=4'b0000;
          #10 a=4'b1000; b=4'b1010;
          #10 a=4'b0010; b=4'b1111;
          #10 a=4'b0100; b=4'b1001;
          #10 a=4'b0100; b=4'b1011;
    end

    initial begin;
          $monitor("%d: a: %b, b: %b, prod: %b, cout: %b", $time, a, b, prod, cout);
    end
endmodule

	
