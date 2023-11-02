# Creación y Control de un Servomotor SG90 con Quartus para FPGA
* [Introducción](#Introducción)
* [Objetivos](#Objetivos)
* [Marco teórico](#Marco-Teórico)
* [Procedimiento](#Procedimiento)
* [Resultados y Análisis](#Resultados-y-Análisis)
* [Discusión](#Discusión)
* [Conclusiones](#Conclusiones)
* [Referencias](#Referencias)

## Introducción
La creación y control de un servomotor SG90 mediante Quartus en una FPGA es un proceso esencial en el diseño de sistemas electrónicos digitales. En este informe, se destacan dos ejemplos significativos: la implementación de un programa para controlar el ángulo de un servomotor SG90 y la implementación de un sumador BCD (Binary Coded Decimal), que se utilizará para realizar operaciones aritméticas específicas. Estas aplicaciones son ejemplos fundamentales para comprender los aspectos básicos de la programación de FPGAs y explorar cómo Quartus, una de las herramientas de diseño de hardware más utilizadas, puede interactuar con un servomotor SG90.

## Objetivos
Los objetivos de este proyecto son los siguientes:

1. Observar e implementar proyectos relacionados con el control de un servomotor SG90 en una FPGA.
2. Reconocer y asimilar nuevos comandos y técnicas de programación específicas para el control de servomotores en una FPGA, en base a lo aprendido en Verilog y Digital para la FPGA.

## Marco Teórico
El servomotor SG90 es un dispositivo que permite el control preciso de ángulos en aplicaciones como robótica y automatización. En el contexto de una FPGA, se pueden utilizar señales PWM (Pulse Width Modulation) para controlar la posición angular del servomotor SG90. La programación de Quartus permite generar las señales PWM necesarias para mover el servomotor a ángulos específicos.

## Procedimiento
En este proyecto, se utilizarán las capacidades de Quartus para generar señales PWM que controlen el servomotor SG90. Se programarán los comandos necesarios para mover el servomotor a ángulos específicos y se realizarán pruebas para validar su funcionamiento.

## Resultados y Análisis
Los resultados de las pruebas muestran un control exitoso del servomotor SG90 a ángulos específicos mediante Quartus y la FPGA. Se logra una precisión en el posicionamiento angular, lo que demuestra la viabilidad de esta solución en aplicaciones de control.

## Discusión
La capacidad de controlar un servomotor SG90 con Quartus en una FPGA es de gran relevancia en aplicaciones de automatización y robótica, donde la precisión en el control de posición es esencial. Esta solución proporciona una base sólida para proyectos futuros que requieran el control de dispositivos mecánicos.

## Conclusiones
En este proyecto, se demostró que es posible controlar un servomotor SG90 de manera precisa utilizando Quartus y una FPGA. Esto tiene aplicaciones significativas en el campo de la automatización y la robótica, donde el control preciso de ángulos es esencial.

## Referencias

[1] FUNDAMENTOS DE SISTEMAS DIGITALES, Thomas L. Floyd, PEARSON EDUCACIÓN S.A., Madrid, 2006.

[2] [Repositorio de github instalación de quartus y Cyclon IV](https://github.com/johnnycubides/digital-electronic-1-101/blob/main/installTools/quartus.md)

[3][Repositorio de github Proyectos en FPGA](https://github.com/johnnycubides/digital-electronic-1-101/tree/main/fpga-example/altera-c4e6e10)
