module Semisumador (
  input A,
  input B,
  output Y,
  output X
);
  assign Y = (B ^ A);
  assign X = (A & B);
endmodule
