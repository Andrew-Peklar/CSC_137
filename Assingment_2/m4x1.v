// Name: Andrew Peklar
// m4x1.v, 4x1 multiplexor, array implementation w/ decoder
// how to compile: ~changw/ivl/bin/iverilog mux2x1.v
// how to run: ./a.out

module DecoderMod(s, o); // from other program
   input  [0:1] s;
   output [0:3] o;

   wire [0:1] w;
   and(o[0], w[1], w[0]);
   and(o[1], s[0], w[0]);
   and(o[2], s[1], w[1]);
   and(o[3], s[1], s[0]);
   not(w[0], s[1]);
   not(w[1], s[0]);
endmodule

module MuxMod(s, d, o);
   input [0:1]s;
   input [0:3] d;
   output o;

   wire [0:3] s_decoded, and_out;

   DecoderMod my_decoder(s, s_decoded); // create instance

   and(and_out[0], d[0], s_decoded[0]); // finishing multiplexor
   and(and_out[1], d[1], s_decoded[1]);
   and(and_out[2], d[2], s_decoded[2]);
   and(and_out[3], d[3], s_decoded[3]);
   or(o, and_out[0], and_out[1], and_out[2], and_out[3]); //final "or" gate
endmodule

module TestMod;
   reg [0:1]s;
   reg [0:3] d;
   wire o;

   MuxMod my_mux(s, d, o);

   initial begin

      $display("Time\ts[0]\ts[1]\td[0]\td[1]\td[2]\td[3]\to");
      $display("-----------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, s[0], s[1], d[0], d[1], d[2], d[3], o);
   end

   initial begin
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 0; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0;
      #1;
      s[0] = 1; s[1] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1;      
      #1;
   end
endmodule