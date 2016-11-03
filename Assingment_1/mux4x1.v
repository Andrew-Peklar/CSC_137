// Name: Andrew Peklar 
// mux4x1.v, 4x1 muxer
// how to compile: ~changw/ivl/bin/iverilog decoder1x2.v
// how to run: ./a.out

module MuxMod(s1, s0, d0, d1, d2, d3, o); // module definition
   input s1, s0, d0, d1, d2, d3;
   output o;

   wire not_s1, not_s0, cntr0, cntr1, cntr2, cntr3;

   not(not_s1, s1);                    // declares internal wires
   not(not_s0, s0);                    // these are inverters

   and(cntr0, d0, not_s0, not_s1);     // and gate 1st
   and(cntr1, d1, s0, not_s1);         // and gate 2nd
   and(cntr2, d2, not_s0, s1);         // and gate 3rd
   and(cntr3, d3, s0, s1);             // and gate 4th
   
   or(o, cntr0, cntr1, cntr2, cntr3);  // final gate or

endmodule

module TestMod; 
   reg s1, s0, d0, d1, d2, d3;       
   wire o;                          

   MuxMod muxer(s1, s0, d0, d1, d2, d3, o); // create instance of circuit and test

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s0, d0, d1, d2, d3, o);
      $display("Time\ts1\ts0\td0\td1\td1\td1\to");
      $display("-----------------------------------------------------------------");
   end

   initial begin
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 1;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 0;
      #1;
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 1;      
      #1;
   end
endmodule