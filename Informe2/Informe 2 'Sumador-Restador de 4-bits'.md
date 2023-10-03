# Sumador-Restador de 4-bits
* [Introducción](#Introducción)
* [Objetivos](#Objetivos)
* [Marco teórico](#Marco-Teórico)
* [Procedimiento](#Procedimiento)
* [Resultados y Análisis](#Resultados-y-Análisis)
* [Discusión](#Discusión)
* [Conclusiones](#Conclusiones)
* [Referencias](#Referencias)

## Resumen

El siguiente informe detalla el diseño y funcionamiento de un Sumador-Restador de 4-bits. Este dispositivo se utiliza comúnmente en aplicaciones digitales para realizar operaciones de suma y resta de números binarios de 4 bits. El diseño y la implementación se basan en principios de lógica digital y utiliza compuertas lógicas para realizar las operaciones requeridas.

## Introducción

Un sumador-restador de 4-bits es un componente esencial en sistemas digitales que requieren la capacidad de realizar operaciones aritméticas con números binarios de 4 bits. Puede sumar o restar dos números binarios de 4 bits y proporcionar un resultado de 4 bits junto con una salida de acarreo (carry-out) que indica si se produce un desbordamiento.

## Objetivos

Elaborar un modelo digital de un sumador-restador de 4 bits 

Describir el funcionamiento de un sumador-restador de 4 bits

Simular el comportamiento de un sumador-restador de 4 bits y sus componentes.

## Marco Teórico

El sumador-restador de 4-bits consta de cuatro etapas, una para cada bit de entrada, y una etapa adicional para manejar el acarreo de entrada (carry-in) en el caso de una operación de resta. Cada etapa opera de la siguiente manera:

1. Etapas de Suma:

Cada etapa de suma toma dos bits de entrada, A y B, y el acarreo de la etapa anterior (Cin).
Utiliza compuertas XOR para calcular la suma (S) y compuertas AND para calcular el acarreo de salida (Cout).
La suma (S) es el resultado de A XOR B XOR Cin.
El acarreo de salida (Cout) es el resultado de (A AND B) OR ((A XOR B) AND Cin).

2. Etapas de Resta:

Para realizar la resta de dos números, se requiere transformar el número negativo para operarlo como si fuera una suma, para ello se emplea una técnica denominada complemento a 2 en el sistema binario, en la cual los bits del número negativo a operar se niegan, mediante el uso de compuertas XOR que se activan con un bit de signo, y se le suma uno a todo el resultado con compuertas XOR y compuertas AND que emiten acarreos de salida que se suman a los bits consecutivamente más significativos, luego de ello se suma el número complementado al número positivo de forma tradicional como en la etapa de suma.

## Procedimiento
En primer lugar se construye el semisumador el cual utiliza una compuerta XOR para emitir la suma binaria y una compuerta AND para emitir el acarreo de salida (Carry Out).<br>
<p align="center">
   <img src="../Informe2/Imagenes/SemiSumador.png" alt="Texto alternativo" width="150"><br>
</p>
Con dos módulos semisumadores se construye un sumador de un bit, el cual difiere del semisumador por la incorporación de un acarreo de entrada (Carry In) el cual abarca todas las entradas posibles y permite la implementación del módulo en sumas más grandes.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Sumador 1 bit.png" alt="Texto alternativo" width="250"><br>
</p>
Con cuatro módulos sumadores se construye un sumador de 4 bits, teniendo en cuenta que la suma se realiza bit a bit y que el acarreo de salida del bit menos significativo será el acarreo de entrada del siguiente bit, lo cual se repite sucesivamente hasta llegar al bit más significativo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Sumador 4 bits.png" alt="Texto alternativo" width="250"><br>
</p>
Para la resta se realiza un módulo que transforme el número de 4 bits a complemento a dos, cuando el bit de signo así lo indique, para ello se usan compuertas XOR que niegan los bits cuando el bit de signo es uno, pero los dejan iguales cuando es cero, una vez se hayan negado, se procede a efectuar la suma de 1 con el mismo bit de signo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Complemento a 2.png" alt="Texto alternativo" width="250"><br>
</p>
Finalmente, para terminar de construir el sumador-restador de 4 bits, se incorporan los módulos de complemento a 2 para cada entrada antes de pasarlas por el sumador de 4 bits, a su vez, a la salida del sumador se coloca otro módulo de complemento para facilitar la lectura del resultado final. En cuanto al acarreo del resultado, se ubicaron una serie de multiplexores con compuertas AND y OR que habilitan o deshabilitan el acarreo de salida del sumador de 4 bits dependiendo si los signos de los entradas son iguales o son diferentes, además para el signo del resultado se suman los bits de signo y estos determinan el signo resultante salvo para el caso de cuando ambos números son negativos, para ello se emplea una compuerta AND y un multiplexor que deja pasar o no las señales del semisumador de signo o de la compuerta AND de signo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Mini ALU.jpeg" alt="Texto alternativo" width="250"><br>
</p>
Para las simulaciones, se exportan todos los archivos anteriores a Verilog y se realizan módulos de prueba (testbech) para cada componente, en los cuales se asignarán casos de prueba para cada una de los entradas que la compongan. Una vez se tengan hechos se ejecuta el siguiente comando para generar el archivo .vpp:

```bash
$ iverilog -o MiniALU.vvp MiniALU_tb.v MiniALU.v \4_bit_adder.v Com_to_2.v Sumador.v Semisumador.v
```
Este comando varía según el nombre del archivo .vvp que se haya usado en los testbech y los módulos usados durante su implementación. 

Una vez se tenga el archivo .vpp se ejecta el siguiente comando para generar el archivo .vcd:

```bash
$ vvp MiniALU.vvp
```

Finalmente se abre el programa  gtkwave y se cargan todos los archivos .vcd para visualizar las ondas de salida de cada componente.
## Resultados y Análisis
Estos fueron los resultados de las simulaciones hechas en gtkwave para cada uno de los componentes del sumador-restador de  4 bits:<br>
<p align="center">
   <img src="../Informe2/Imagenes/Sim Suma 1 bit.png" alt="Texto alternativo" width="250"><br>
<p align="center">
   <img src="../Informe2/Imagenes/Sim Suma 4 bits.png" alt="Texto alternativo" width="250"><br>
<p align="center">
   <img src="../Informe2/Imagenes/Sim Complemento 2.png" alt="Texto alternativo" width="250"><br>
<p align="center">
   <img src="../Informe2/Imagenes/Sim Mini ALU.png" alt="Texto alternativo" width="250"><br>

## Caso de uso

El formato en que se ingresa el número es: sb_ X3_ X2_ X_1 X_0
Donde sb es el bit de signo llamado sb o Sa donde 1 es un número negativo y 0 es un número positivo
X_3 X_2 X_2 X_1 es el número de cuatro bits en binario.
Por ejemplo 10011 es el número -3 y 00011 es el numero 3.
Luego se suman los números dando el formato en el que se presenta la salida: SC_Co_S3_S2_S1_S0
Donde SC es el bit de sign sindo 1 un numero negativo y 0 un numero positivo
Co_S3_S2_S1_S0 es el número donde puede ser de 5 Bits si la suma de dos numeros de 4 bits se desborda y genera el carry de salida que es Co

Se tomo en consideración 4 casos escenciales:
A+B
A-B cuando A>B y A<B
-A+B cuando A>B y A<B
-A-B


## Discusión
El sumador-restador fue implementado de manera que la resta pueda ser aplicada de la primera entrada a la segunda y en el sentido inverso, permitiendo más aplicabilidad de como se procesan los numeros de 4-bits.

## Conclusiones

El sumador-restador de 4-bits es una unidad fundamental en la aritmética binaria utilizada en la mayoría de los sistemas digitales. Su diseño se basa en principios de lógica digital y utiliza compuertas XOR, AND y OR para realizar operaciones aritméticas de suma y resta. Es esencial comprender su funcionamiento para diseñar y trabajar con sistemas digitales que requieran operaciones binarias de 4 bits.

