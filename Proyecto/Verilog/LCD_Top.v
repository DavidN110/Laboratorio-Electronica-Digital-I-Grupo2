`timescale 1ns / 1ps
module LCD_Top(
                CLOCK_50,  //50 MZ
                 LCD_RW,   //LCD Read/Write Select, 0 = Write, 1 = Read
                 LCD_EN,   //LCD Enable
                 LCD_RS,   //LCD Command/Data Select, 0 = Command, 1 = Data
                 LCD_DATA, //LCD Data bus 8 bits
				senal_alcohol,
				senal_sonido,
				echo, 
				trigger,
				led1,
				led2,
				led3,
				led4,
				rele
					  );
					  
reg [8:0] Mostrar_10 = "H";
reg [8:0] Mostrar_11 = "O";
reg [8:0] Mostrar_12 = "L";
reg [8:0] Mostrar_13 = "A";
reg [8:0] Mostrar_14 = " ";
reg [8:0] Mostrar_15 = "M";
reg [8:0] Mostrar_16 = "U";
reg [8:0] Mostrar_17 = "N";
reg [8:0] Mostrar_18 = "D";
reg [8:0] Mostrar_19 = "O";
reg [8:0] Mostrar_110 = " ";
reg [8:0] Mostrar_111 = "L";
reg [8:0] Mostrar_112 = "I";
reg [8:0] Mostrar_113 = "N";
reg [8:0] Mostrar_114 = "E";
reg [8:0] Mostrar_115 = "1";
reg [8:0] Mostrar_20 = "P";
reg [8:0] Mostrar_21 = "R";
reg [8:0] Mostrar_22 = "U";
reg [8:0] Mostrar_23 = "E";
reg [8:0] Mostrar_24 = "B";
reg [8:0] Mostrar_25 = "A";
reg [8:0] Mostrar_26 = " ";
reg [8:0] Mostrar_27 = "L";
reg [8:0] Mostrar_28 = "I";
reg [8:0] Mostrar_29 = "N";
reg [8:0] Mostrar_210 = "E";
reg [8:0] Mostrar_211 = "A";
reg [8:0] Mostrar_212 = " ";
reg [8:0] Mostrar_213 = "2";
reg [8:0] Mostrar_214 = " ";
reg [8:0] Mostrar_215 = " ";               


input CLOCK_50;       //50 MHz
inout [7:0] LCD_DATA; //LCD Data bus 8 bits
input senal_alcohol;
input senal_sonido;
input echo;
output trigger;
output led1;
output led2;
output led3;
output led4;
output reg rele;
output LCD_RW;        //LCD Read/Write Select, 0 = Write, 1 = Read
output LCD_EN;        //LCD Enable
output LCD_RS;        //LCD Command/Data Select, 0 = Command, 1 = Data

wire DLY_RST;

reg [2:0] mensaje = 0;
reg senal_distancia;
reg [29:0] tiempo_espera = 0;

Reset_Delay r0 ( .iCLK(CLOCK_50),.oRESET(DLY_RST)    );
LEDs Integrado(.clk(CLOCK_50), .senal_alcohol(senal_alcohol), .senal_sonido(senal_sonido), .senal_distancia(senal_distancia), .led1(led1), .led2(led2), .rele(rele));
sensor Distancia(.clk(CLOCK_50), .echo(echo), .trig(trigger), .led1(senal_distancia), .led2(led3), .led3(led4));

always @ ( CLOCK_50)begin
if(senal_distancia)
begin
	if(tiempo_espera == 0)
	begin
		mensaje <= 0;
		if(senal_sonido)
		begin
			tiempo_espera <= tiempo_espera+1;
			if(~senal_alcohol)
			begin
				mensaje <= 2;
			end
			else
			begin
				mensaje <= 3;
			end
		end
	end
	else
	begin
		if(tiempo_espera < 30'd500000000)
		begin
			tiempo_espera <= tiempo_espera+1;
		end
		else
		begin
			tiempo_espera <= 0;
		end
	end
end
else
begin
	mensaje <= 1;
	tiempo_espera <= 0;
end

case(mensaje)
	0:begin
	  Mostrar_10<=9'h120;//
      Mostrar_11<=9'h120;//
      Mostrar_12<=9'h120;//
      Mostrar_13<=9'h142;//B
      Mostrar_14<=9'h149;//I
      Mostrar_15<=9'h145;//E
      Mostrar_16<=9'h14E;//N
      Mostrar_17<=9'h156;//V
      Mostrar_18<=9'h145;//E
      Mostrar_19<=9'h14E;//N
      Mostrar_110<=9'h149;//I
      Mostrar_111<=9'h144;//D
      Mostrar_112<=9'h14F;//O
      Mostrar_113<=9'h120;//
      Mostrar_114<=9'h120;//
      Mostrar_115<=9'h120;//
      Mostrar_20<=9'h153;//S
      Mostrar_21<=9'h14F;//O
      Mostrar_22<=9'h150;//P
      Mostrar_23<=9'h14C;//L
      Mostrar_24<=9'h145;//E
      Mostrar_25<=9'h120;//
      Mostrar_26<=9'h150;//P
      Mostrar_27<=9'h14F;//O
      Mostrar_28<=9'h152;//R
      Mostrar_29<=9'h120;//
      Mostrar_210<=9'h146;//F
      Mostrar_211<=9'h141;//A
      Mostrar_212<=9'h156;//V
      Mostrar_213<=9'h14F;//O
      Mostrar_214<=9'h152;//R
      Mostrar_215<=9'h120;//
	end

	1:begin
	  Mostrar_10<=9'h120;//
      Mostrar_11<=9'h120;//
      Mostrar_12<=9'h120;//
      Mostrar_13<=9'h150;//P
      Mostrar_14<=9'h14F;//O
      Mostrar_15<=9'h152;//R
      Mostrar_16<=9'h120;//
      Mostrar_17<=9'h146;//F
      Mostrar_18<=9'h141;//A
      Mostrar_19<=9'h156;//V
      Mostrar_110<=9'h14F;//O
      Mostrar_111<=9'h152;//R
      Mostrar_112<=9'h120;//
      Mostrar_113<=9'h120;//
      Mostrar_114<=9'h120;//
      Mostrar_115<=9'h120;//
      Mostrar_20<=9'h141;//A
      Mostrar_21<=9'h143;//C
      Mostrar_22<=9'h14F;//O
      Mostrar_23<=9'h14D;//M
      Mostrar_24<=9'h14F;//O
      Mostrar_25<=9'h144;//D
      Mostrar_26<=9'h145;//E
      Mostrar_27<=9'h153;//S
      Mostrar_28<=9'h145;//E 
      Mostrar_29<=9'h120;//
      Mostrar_210<=9'h14D;//M
      Mostrar_211<=9'h145;//E
      Mostrar_212<=9'h14A;//J
      Mostrar_213<=9'h14F;//O
      Mostrar_214<=9'h152;//R
      Mostrar_215<=9'h120;//
		end
		
	2:begin
	Mostrar_10<=9'h141;//A
      Mostrar_11<=9'h14C;//L
      Mostrar_12<=9'h143;//C
      Mostrar_13<=9'h14F;//O
      Mostrar_14<=9'h148;//H
      Mostrar_15<=9'h14F;//O
      Mostrar_16<=9'h14C;//L
      Mostrar_17<=9'h120;//
      Mostrar_18<=9'h150;//P
      Mostrar_19<=9'h152;//R
      Mostrar_110<=9'h145;//E
      Mostrar_111<=9'h153;//S
      Mostrar_112<=9'h145;//E
      Mostrar_113<=9'h14E;//N
      Mostrar_114<=9'h154;//T
      Mostrar_115<=9'h145;//E
      Mostrar_20<=9'h120;//
      Mostrar_21<=9'h141;//A
      Mostrar_22<=9'h143;//C
      Mostrar_23<=9'h143;//C
      Mostrar_24<=9'h145;//E
      Mostrar_25<=9'h153;//S
      Mostrar_26<=9'h14F;//O
      Mostrar_27<=9'h120;//
      Mostrar_28<=9'h144;//D
      Mostrar_29<=9'h145;//E
      Mostrar_210<=9'h14E;//N
      Mostrar_211<=9'h145;//E
      Mostrar_212<=9'h147;//G
      Mostrar_213<=9'h141;//A
      Mostrar_214<=9'h144;//D
      Mostrar_215<=9'h14F;//O
	end
	
	3:begin
	Mostrar_10<=9'h120;//
      Mostrar_11<=9'h120;//
      Mostrar_12<=9'h153;//S
      Mostrar_13<=9'h149;//I
      Mostrar_14<=9'h14E;//N
      Mostrar_15<=9'h120;//
      Mostrar_16<=9'h141;//A
      Mostrar_17<=9'h14C;//L
      Mostrar_18<=9'h143;//C
      Mostrar_19<=9'h14F;//O
      Mostrar_110<=9'h148;//H
      Mostrar_111<=9'h14F;//O
      Mostrar_112<=9'h14C;//L
      Mostrar_113<=9'h120;//
      Mostrar_114<=9'h120;//
      Mostrar_115<=9'h120;//
      Mostrar_20<=9'h141;//A
      Mostrar_21<=9'h143;//C
      Mostrar_22<=9'h143;//C
      Mostrar_23<=9'h145;//E
      Mostrar_24<=9'h153;//S
      Mostrar_25<=9'h14F;//O
      Mostrar_26<=9'h120;//
      Mostrar_27<=9'h143;//C
      Mostrar_28<=9'h14F;//O
      Mostrar_29<=9'h14E;//N
      Mostrar_210<=9'h143;//C
      Mostrar_211<=9'h145;//E
      Mostrar_212<=9'h144;//D
      Mostrar_213<=9'h149;//I
      Mostrar_214<=9'h144;//D
      Mostrar_215<=9'h14F;//O
	end
	
	4:begin
		Mostrar_10<=9'h120;//ESP
      Mostrar_11<=9'h120;//ESP
      Mostrar_12<=9'h120;//ESP
      Mostrar_13<=9'h120;//ESP
      Mostrar_14<=9'h120;//ESP
      Mostrar_15<=9'h157;//W
      Mostrar_16<=9'h141;//A
      Mostrar_17<=9'h152;//R
      Mostrar_18<=9'h14E;//N
      Mostrar_19<=9'h149;//I
      Mostrar_110<=9'h14E;//N
      Mostrar_111<=9'h147;//G
      Mostrar_112<=9'h120;//ESP
      Mostrar_113<=9'h120;//ESP
      Mostrar_114<=9'h120;//ESP
      Mostrar_115<=9'h120;//ESP
		
      Mostrar_20<=9'h120;//ESP
      Mostrar_21<=9'h120;//ESP
      Mostrar_22<=9'h120;//ESP
      Mostrar_23<=9'h120;//ESP
      Mostrar_24<=9'h120;//ESP
      Mostrar_25<=9'h120;//ESP
      Mostrar_26<=9'h121;//!
      Mostrar_27<=9'h121;//!
      Mostrar_28<=9'h121;//!
      Mostrar_29<=9'h121;//!
      Mostrar_210<=9'h120;//ESP
      Mostrar_211<=9'h120;//ESP
      Mostrar_212<=9'h120;//ESP
      Mostrar_213<=9'h120;//ESP
      Mostrar_214<=9'h120;//ESP
      Mostrar_215<=9'h120;//ESP
	end

endcase

end

LCD_TEST u5 (//Host Side
         .iCLK(CLOCK_50),
         .iRST_N(DLY_RST),
             //    LCD Side
         .LCD_DATA(LCD_DATA),
         .LCD_RW(LCD_RW),
         .LCD_EN(LCD_EN),
         .LCD_RS(LCD_RS),   
         .Mostrar_10(Mostrar_10),
		   .Mostrar_11(Mostrar_11),
			.Mostrar_12(Mostrar_12),
			.Mostrar_13(Mostrar_13),
			.Mostrar_14(Mostrar_14),
			.Mostrar_15(Mostrar_15),
			.Mostrar_16(Mostrar_16),
			.Mostrar_17(Mostrar_17),
			.Mostrar_18(Mostrar_18),
			.Mostrar_19(Mostrar_19),
			.Mostrar_110(Mostrar_110),
			.Mostrar_111(Mostrar_111),
			.Mostrar_112(Mostrar_112),
			.Mostrar_113(Mostrar_113),
			.Mostrar_114(Mostrar_114),
			.Mostrar_115(Mostrar_115),
			.Mostrar_20(Mostrar_20),
			.Mostrar_21(Mostrar_21),
			.Mostrar_22(Mostrar_22),
			.Mostrar_23(Mostrar_23),
			.Mostrar_24(Mostrar_24),
			.Mostrar_25(Mostrar_25),
			.Mostrar_26(Mostrar_26),
			.Mostrar_27(Mostrar_27),
			.Mostrar_28(Mostrar_28),
			.Mostrar_29(Mostrar_29),
			.Mostrar_210(Mostrar_210),
			.Mostrar_211(Mostrar_211),
			.Mostrar_212(Mostrar_212),
			.Mostrar_213(Mostrar_213),
			.Mostrar_214(Mostrar_214),
			.Mostrar_215(Mostrar_215)
             );

endmodule


