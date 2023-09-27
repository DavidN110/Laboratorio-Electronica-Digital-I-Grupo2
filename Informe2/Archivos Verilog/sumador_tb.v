module testbech;
 reg [2:0] inputs;
  integer i;
  initial
  begin
  for (i=0; i<8; i=i+1)
  begin
  inputs = i;
  #1;
  end
  end
  
  wire [1:0] outs;
  // DEVICE/DESIGN UNDER TEST
  Sumador dut (
    .B(inputs[2]), .A(inputs[1]), .CIn(inputs[0]),
    .COut(outs[1]), .Sum(outs[0])
  );

  // MONITOR
  // initial
  //   $monitor("Time: %t, a = %d, b = %d => out = %d",
  //     $time, a, b, value);

  // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("suma.vcd");
    $dumpvars(0, testbech);
  end

endmodule
