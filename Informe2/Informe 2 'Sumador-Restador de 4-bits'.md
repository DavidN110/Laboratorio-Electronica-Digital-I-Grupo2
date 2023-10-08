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

El sumador-restador de 4-bits consta de tres etapas, una para cada bit de entrada, y una etapa adicional para manejar el acarreo de entrada (carry-in) en el caso de una operación de resta. Cada etapa opera de la siguiente manera:

1. Etapa de Suma:

Cada etapa de suma toma dos bits de entrada, A y B, y el acarreo de la etapa anterior (Cin).
Utiliza compuertas XOR para calcular la suma (S) y compuertas AND para calcular el acarreo de salida (Cout).
La suma (S) es el resultado de A XOR B XOR Cin.
El acarreo de salida (Cout) es el resultado de (A AND B) OR ((A XOR B) AND Cin).

2. Etapa de Resta:

Para realizar la resta de dos números, se requiere transformar el número negativo para operarlo como si fuera una suma, para ello se emplea una técnica denominada complemento a 2 en el sistema binario, en la cual los bits del número negativo a operar se niegan, mediante el uso de compuertas XOR que se activan con un bit de signo, y se le suma uno a todo el resultado con compuertas XOR y compuertas AND que emiten acarreos de salida que se suman a los bits consecutivamente más significativos, luego de ello se suma el número complementado al número positivo de forma tradicional como en la etapa de suma.

3. Etapa de overflow y carry out:

Cuando ya se tiene la suma de los dos numeros y hay desbordamiento u overflow se necesitan volver a hacer complemento a 2, para esto se necesita reconocer el desbordamiento, por ello se implementa un tipo de multiplexor en donde se utilizan compuertas and, or y xor y un semisumador que habilitan o deshabilitan el carry de salida cuando identifican el desbordamiento.

## Diagrama de flujo

<p align="center">
   <img src="../Informe2/Imagenes/Diagrama en blanco.png" alt="Texto alternativo" width="850"><br>
</p>

## Procedimiento
En primer lugar se construye el semisumador el cual utiliza una compuerta XOR para emitir la suma binaria y una compuerta AND para emitir el acarreo de salida (Carry Out).<br>
<p align="center">
   <img src="../Informe2/Imagenes/SemiSumador.png" alt="Texto alternativo" width="150"><br>
</p>
<p align="center">
   <img src="../Informe2/Imagenes/Semisumador.svg" alt="Texto alternativo" width="450"><br>
</p>

Con dos módulos semisumadores se construye un sumador de un bit, el cual difiere del semisumador por la incorporación de un acarreo de entrada (Carry In) el cual abarca todas las entradas posibles y permite la implementación del módulo en sumas más grandes.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Sumador 1 bit.png" alt="Texto alternativo" width="250"><br>
</p>
<p align="center">
   <img src="../Informe2/Imagenes/Sumadorbit.svg" alt="Texto alternativo" width="250"><br>
</p>

Con cuatro módulos sumadores se construye un sumador de 4 bits, teniendo en cuenta que la suma se realiza bit a bit y que el acarreo de salida del bit menos significativo será el acarreo de entrada del siguiente bit, lo cual se repite sucesivamente hasta llegar al bit más significativo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Sumador 4 bits.png" alt="Texto alternativo" width="250"><br>
</p>
<p align="center">
   <img src="../Informe2/Imagenes/4_bit_adder.svg" alt="Texto alternativo" width="450"><br>
</p>
Para la resta se realiza un módulo que transforme el número de 4 bits a complemento a dos, cuando el bit de signo así lo indique, para ello se usan compuertas XOR que niegan los bits cuando el bit de signo es uno, pero los dejan iguales cuando es cero, una vez se hayan negado, se procede a efectuar la suma de 1 con el mismo bit de signo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Complemento a 2.png" alt="Texto alternativo" width="250"><br>
</p>
<p align="center">
   <img src="../Informe2/Imagenes/Com_to_2.svg" alt="Texto alternativo" width="450"><br>
</p>   
Finalmente, para terminar de construir el sumador-restador de 4 bits, se incorporan los módulos de complemento a 2 para cada entrada antes de pasarlas por el sumador de 4 bits, a su vez, a la salida del sumador se coloca otro módulo de complemento para facilitar la lectura del resultado final. En cuanto al acarreo del resultado, se ubicaron una serie de multiplexores con compuertas AND y OR que habilitan o deshabilitan el acarreo de salida del sumador de 4 bits dependiendo si los signos de los entradas son iguales o son diferentes, además para el signo del resultado se suman los bits de signo y estos determinan el signo resultante salvo para el caso de cuando ambos números son negativos, para ello se emplea una compuerta AND y un multiplexor que deja pasar o no las señales del semisumador de signo o de la compuerta AND de signo.<br>
<p align="center">
   <img src="../Informe2/Imagenes/Mini ALU.jpeg" alt="Texto alternativo" width="250"><br>
</p>
<p align="center">
   <img src="../Informe2/Imagenes/MiniALU.svg" alt="Texto alternativo" width="450"><br>
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
   <img src="../Informe2/Imagenes/Sim Suma 1 bit.png" alt="Texto alternativo" width="450"><br>
   
<p align="center">
   <img src="../Informe2/Imagenes/Sim Suma 4 bits.png" alt="Texto alternativo" width="450"><br>

<p align="center">
   <img src="../Informe2/Imagenes/Sim Complemento 2.png" alt="Texto alternativo" width="450"><br>
   
<p align="center">
   <img src="../Informe2/Imagenes/Sim Mini ALU.png" alt="Texto alternativo" width="450"><br>

## Caso de Uso: Suma de Números en Formato Binario

### Descripción

Este caso de uso se centra en la conversión y suma de números expresados en un formato signo-magnitud. Los números ingresados siguen un patrón específico, y la suma resultante se presenta en un formato signo-magnitud. A continuación, se describen los detalles de este proceso.

### Formato de Entrada

El formato en el que se ingresa el número:

1. **Bit de Signo (Sb o Sa):** Se utiliza para representar el signo del número. Un valor de 1 indica un número negativo, mientras que un valor de 0 indica un número positivo.

2. **Cuatro Bits en Binario (A_3, A_2, A_1, A_0):** Estos cuatro bits representan el valor numérico en formato binario del número en cuestión.

   Ejemplo:
   - `10011` representa el número -3.
   - `00011` representa el número 3.

### Proceso de Suma

Luego de ingresar los números en el formato mencionado, se procede a realizar la suma. La salida se presenta en el siguiente formato:

- **Bit de Signo de la Suma (SC):** Indica el signo de la suma. Un valor de 1 denota un número negativo, mientras que un valor de 0 indica un número positivo.

- **Suma de Cinco Bits (Co_C3_C2_C1_C0):** Representa el valor resultante de la suma. Puede constar de cinco bits si la suma de los dos números de cuatro bits genera un carry de salida, denominado "Co."

### Casos Esenciales Considerados

Este caso de uso aborda cuatro casos esenciales:

1. **Suma de Dos Números (A + B):**
   
```bash
+9 + 4 = 13

01001 + 00100 = 01101

input(01001,00100)
output(001101)
```
2. **Resta de Dos Números (A - B):**

```bash
9 - 4 = 5

El complemento a 2 de 4 es 11100 == -4 

01001 + 11100 = 100101

Como el resultado tiene que ser positivo se descarta el ultimo bit

01001 + 11100 = 00101

input(01001,10100)
output(000101)
```

3. **Resta de Dos Números (-A + B):**

```bash
-9 + 4 = -5

El complemento a 2 de 9 es 10111 ==-9

10111 + 00100 = 11011

Se descarta el Cout quedando 1011
complemento a 2 pues hay overflow 1011 es 0101 y como es negativo 10101

10111 + 00100 = 10101

input(11001,0100)
output(100101)
```

4. **Resta de Dos Números (-A - B):**

```bash
-9 - 4 = -13

utilizamos el complemento a 2 de 9 y 4 vistos anteriormente

10111 + 11100 = 110011

se descartan los últimos dos bits más significativos

y se hace complemento a 2 0011 pues hay overflow quedando 1101

10111 + 11100 = 11101

input(11001,10100)
output(11101)
```

5. **Suma de Dos Números (-A + A):**

```bash
-4 + 4 = 0

Complemento a 2 de 4

00100+ 11100 = 100000

Se descartan los dos últimos bits más significativos quedando 0000

00100+ 11100 = 00000

input(00100,10100)
output(000000)
```
   

## Discusión
El sumador-restador fue implementado de manera que la resta pueda ser aplicada de la primera entrada a la segunda y en el sentido inverso, permitiendo más aplicabilidad de como se procesan los numeros de 4-bits. Uno de los problemas mas grandes fue reconocer cuando había overflow pues esto se debe puramente a entender el funcionamiento algebraico de como funciona el complemento a2 y de el desbordamiento de operar dos numeros. Se pueden encontrar mejores soluciones un poco mas optimizadas a futuro para el sumador-restador.

## Conclusiones

El sumador-restador de 4-bits es una unidad fundamental en la aritmética binaria utilizada en la mayoría de los sistemas digitales. Su diseño se basa en principios de lógica digital y utiliza compuertas XOR, AND y OR para realizar operaciones aritméticas de suma y resta. Es esencial comprender su funcionamiento para diseñar y trabajar con sistemas digitales que requieran operaciones binarias de 4 bits.

Descargar el archivo completo [MiniALU.zip](./sumador-restador.zip)

## Referencias

[1] FUNDAMENTOS DE SISTEMAS DIGITALES, Thomas L. Floyd, PEARSON EDUCACIÓN S.A., Madrid, 2006.

[2] [Repositorio de FullAdder digital en github](https://github.com/johnnycubides/digital-electronic-1-101/tree/main/simulations/digital)
