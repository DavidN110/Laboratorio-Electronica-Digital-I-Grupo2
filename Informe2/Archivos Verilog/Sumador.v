module Sumador (
  input A,
  input B,
  input CIn,
  output COut,
  output Sum
);
  wire s0;
  wire s1;
  wire s2;
  Semisumador Semisumador_0 (A,B,s0,s1);
  Semisumador Semisumador_1 (s0,CIn,Sum,s2);
  assign COut = (s2 | s1);
endmodule
