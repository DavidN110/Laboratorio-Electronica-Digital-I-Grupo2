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

Cada etapa de resta también toma dos bits de entrada, A y B, y el acarreo de la etapa anterior (Cin).
Utiliza compuertas XOR para calcular la diferencia (D) y compuertas AND para calcular el acarreo de salida (Cout).
La diferencia (D) es el resultado de A XOR B XOR Cin.
El acarreo de salida (Cout) es el resultado de (A AND B') OR ((A XOR B') AND Cin), donde B' es la negación de B.

## Procedimiento

## Resultados y Análisis

<p align="center">
   <img src="../Informe2/Imagenes/SemiSumador.png" alt="Texto alternativo" width="150"><br>
   <img src="../Informe2/Imagenes/Sumador 1 bit.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Sumador 4 bits.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Complemento a 2.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Mini ALU.jpeg" alt="Texto alternativo" width="250"><br>

   <img src="../Informe2/Imagenes/Sim Suma 1 bit.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Sim Suma 4 bits.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Sim Complemento 2.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe2/Imagenes/Sim Mini ALU.png" alt="Texto alternativo" width="250"><br>

## Discusión

## Conclusiones

El sumador-restador de 4-bits es una unidad fundamental en la aritmética binaria utilizada en la mayoría de los sistemas digitales. Su diseño se basa en principios de lógica digital y utiliza compuertas XOR, AND y OR para realizar operaciones aritméticas de suma y resta. Es esencial comprender su funcionamiento para diseñar y trabajar con sistemas digitales que requieran operaciones binarias de 4 bits.

