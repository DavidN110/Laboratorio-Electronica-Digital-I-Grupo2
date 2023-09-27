module testbech;
 reg [10:0] inputs;
  integer i;
  initial
  begin
  for (i=0; i<2048; i=i+1)
  begin
  inputs = i;
  #1;
  end
  end
  
  wire [5:0] outs;
  // DEVICE/DESIGN UNDER TEST
  MiniALU dut (
    .SB(inputs[10]), .SA(inputs[9]),
    .B3(inputs[8]), .A3(inputs[7]), .B2(inputs[6]),
    .A2(inputs[5]), .B1(inputs[4]), .A1(inputs[3]),
    .B0(inputs[2]), .A0(inputs[1]), .Cin(inputs[0]), 
    .SC (outs[5]), .Cout (outs[4]), .\C3 (outs[3]), .C2 (outs[2]), 
    .C1 (outs[1]), .C0 (outs[0])
  );

  // MONITOR
  // initial
  //   $monitor("Time: %t, a = %d, b = %d => out = %d",
  //     $time, a, b, value);

  // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("MiniALU.vcd");
    $dumpvars(0, testbech);

  end

endmodule
