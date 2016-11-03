// Name: Andrew Peklar
// decoder2x4.v, 2x4 decoder, array implementation
// how to compile: ~changw/ivl/bin/iverilog mux2x1.v
// how to run: ./a.out

module DecoderMod(s, o); // module definition
   input  [0:1] s;
   output [0:3] o;

   wire [0:1] w;
   and(o[0], w[0], w[1]);
   and(o[1], s[1], w[0]);
   and(o[2], s[0], w[1]);
   and(o[3], s[1], s[0]);
   not(w[1], s[1]);
   not(w[0], s[0]);
endmodule

module TestMod;
   reg  [0:1] s;
   wire [0:3] o;

   DecoderMod my_decoder(s, o); // create instance

initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, s[0], s[1], o[0], o[1], o[2], o[3]);
      $display("Time\ts[0]\ts[1]\to[0]\to[1]\to[2]\to[3]");
      $display("--------------------------");
   end

   initial begin
      s[0] = 0; s[1]= 0;          
      #1;
      s[0] = 0; s[1]= 1;         
      #1;
      s[0] = 1; s[1]= 0;          
      #1;
      s[0] = 1; s[1]= 1;          
      #1;
   end
endmodule