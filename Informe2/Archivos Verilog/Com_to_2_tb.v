module testbech;
 reg [4:0] inputs;
  integer i;
  initial
  begin
  for (i=0; i<32; i=i+1)
  begin
  inputs = i;
  #1;
  end
  end
  
  wire [3:0] outs;
  // DEVICE/DESIGN UNDER TEST
  Com_to_2 dut (
    .Sin(inputs[4]), .A3(inputs[3]), 
    .A2(inputs[2]), .A1(inputs[1]), .A0(inputs[0]), 
    .\-A3 (outs[3]), .\-A2 (outs[2]), .\-A1 (outs[1]), .\-A0 (outs[0])
  );

  // MONITOR
  // initial
  //   $monitor("Time: %t, a = %d, b = %d => out = %d",
  //     $time, a, b, value);

  // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("com_to_2.vcd");
    $dumpvars(0, testbech);

  end

endmodule
