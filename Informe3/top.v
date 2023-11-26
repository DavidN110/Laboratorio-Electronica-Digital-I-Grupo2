/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/
module top (
    input  clk, input switch,
    output reg pwm=1'b0
 );
wire [23:0]cable1;
wire [23:0]cable2;

contador contador1(.clk_in(clk), .count(cable1));
duty duty1(.clk_in(clk), .switch(switch), .duty(cable2));

always@(posedge clk) /*comparador*/
begin
if (cable1 < cable2)
	pwm <= 1'b1;
else
	pwm <= 1'b0;
end

endmodule

