# Instalación de Linux mint y Herramientas para digital 
* [Introducción](#Introducción)
* [Objetivos](#Objetivos)
* [Marco teórico](#Marco-Teórico)
* [Procedimiento](#Procedimiento)
    * [Descarga e instalación Virtualbox](#Descarga-e-instalación-Virtualbox)
    * [Descarga e instalación linux mint](#Descarga-e-instalación-linux-mint)
    * [Descarga e instalación minianaconda y complementos](#Descarga-e-instalación-minianaconda-y-complementos)
    * [Descarga e instalación digital y complementos](#Descarga-e-instalación-digital-y-complementos)
* [Análisis y Resultados](#Análisis-y-Resultados)
* [Discusión](#Discusión)
* [Conclusiones](#Conclusiones)
* [Referencias](#Referencias)

## Resumen

----

## Introducción

Se desarrollará un paso a paso de cómo se instaló linux mint mate en una maquina virtual en este caso VirtualBox como alternativa para no instalar nativamente linux mint, luego se descargaron e instalaron algunas herramientas que se utilizaran a lo largo del curso de electrónica digital I.

## Objetivos

Instalar linux mint y herramientas como miniconda (Iverilog y Yosys) y digital (Complementos para digital)

## Marco Teórico

La virtualización es una tecnología que permite crear **máquinas virtuales** (VM) en un sistema físico, lo que posibilita ejecutar múltiples sistemas operativos en una sola máquina. **VirtualBox**, una plataforma de virtualización, facilita la gestión de VMs emulando sistemas completos. Esto es útil para pruebas, aislamiento y desarrollo.
Una **imagen ISO** es una copia exacta de un sistema de archivos, utilizada para distribuir software y sistemas operativos. Permite instalar sistemas operativos en máquinas virtuales o físicas. 
**Linux Mint**, una distribución de Linux basada en Ubuntu, destaca por su entorno de usuario amigable y estable. Ofrece una alternativa atractiva para aquellos que desean explorar el sistema operativo Linux.
**Miniconda** es una distribución de **Conda**, un sistema de gestión de paquetes de Python. Conda permite administrar entornos aislados de desarrollo, evitando conflictos de dependencias entre proyectos.
**Digital** es un diseñador de lógica digital y simulador de circuitos fácil de usar diseñado con fines educativos y de experimentación en diseño de circuitos digitales.
La configuración con estos elementos trae ventajas, como el aislamiento para pruebas, la gestión de entornos Python y la libertad de configurar herramientas digitales como las FPGA a través de plataformas como **Digital**. Esto facilita el desarrollo y la experimentación con lógica digital en un entorno virtual.

## Procedimiento

### Descarga e instalación de VirtualBox.


Instalar VirtualBox

1. Visita el sitio web de VirtualBox: [virtualbox.org](https://www.virtualbox.org/)
2. Descarga e instala VirtualBox según tu sistema operativo.
   
Crear una Nueva Máquina Virtual en VirtualBox

1. Abre VirtualBox y haz clic en "Nuevo".
2. Sigue el asistente, elige "Linux" como tipo y "Ubuntu (64 bits)" como versión.

Configurar la Máquina Virtual

1. Asigna al menos 2 GB de RAM.
2. Crea un disco duro virtual con la opción "Dinámicamente asignado".

Configurar la Unidad Óptica

1. Selecciona la máquina virtual, haz clic en "Configuración".
2. En la pestaña "Almacenamiento", elige el controlador "IDE".
3. Selecciona "Elegir un archivo de disco óptico virtual" y carga el archivo ISO.

### Descarga e instalación linux mint
Descargar los Archivos

1. Visita el sitio web oficial de Linux Mint: [linuxmint.com](https://linuxmint.com/)
2. Selecciona la edición que deseas descargar y haz clic en "Descargar".
3. Elige la arquitectura (32 bits o 64 bits) y descarga el archivo ISO.
4. Inicia la máquina virtual y selecciona "Start Linux Mint".
5. Sigue las instrucciones en pantalla para instalar Linux Mint.

Completar la Instalación y Configuración

1. Completa la instalación seleccionando idioma, zona horaria, usuario, etc.
2. Reinicia la máquina virtual.

### Descarga e instalación minianaconda y complementos

1.Abre la terminal en tu sistema Linux Mint.

2.Descarga el instalador de Miniconda usando wget (asegúrate de obtener el enlace correcto para tu arquitectura):

```bash
$ cd Downloads
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ bash Miniconda3-latest-Linux-x86_64.sh # Seguir las instrucciones y reiniciar la terminal
```

```bash
(base) $ conda update conda # Actualizar conda
(base) $ conda create -n digital python=3.10 # Configurar digital como variable de entorno y python3.10
(base) $ conda activate digital  # Activar la variable de entorno de conda denominada digital
(digital) $ python --version # Debe presentarse la version 3.10 para poder continuar
```
> Recuerde que para activar el entorno **digital** deberá hacer uso del comando `$ conda activate digital`.
> Para desactivar la variable de entorno **digital** en conda ejecutar `$ conda deactivate`


### Instalación de herramientas desde miniconda

```bash
(digital) $ conda install -c conda-forge gtkwave 
(digital) $ conda install -c conda-forge graphviz
(digital) $ conda install -c symbiflow netlistsvg
(digital) $ conda install -c "litex-hub" yosys
(digital) $ conda install -c "litex-hub" iverilog
```

> Para comprobar que se han instalado las herramientas requeridas podrá listar y ubicarlas con el comando `$ conda list`

### Descarga e instalación digital y complementos

> Digital requiere la máquina virtual de java, puede comprobar que tenga instalada usando el comando`java --version`.
> en el caso de no tener instalada la máquina virtual podría revisar el siguiente enlace: [JVM](https://adoptium.net/).

> En el caso de no tener instalado el JDK o alguna librería requerida en Linux podrá realizar la instalación del JDK desde un gestor de paquetes, ejemplo:
```bash
$ sudo apt install openjdk-11-jdk # > Si es una distribución basada en debian
$ pamac install jdk-openjdk # > Si es una distribución basada en arch
```

Para realizar la instalación de Digital en su sistema podrá seguir estos 3 pasos:

1. Descargar [Digital.zip](https://github.com/hneemann/Digital/releases/latest/download/Digital.zip): este archivo contiene la aplicación y los scripts necesarios.
2. Ejecutar la aplicación: Se descomprime el archivo .zip y en la carpeta generada basta con lanzar el ejecutable con extensión .exe para Windows o `java -jar Digital.jar` en una terminal para Linux.
3. Instalar Digital: si desea encontrar Digital en el menú de aplicaciones bastará con ejecutar el comando `./install.sh` en el directorio donde se encuentra Digitak.jar.


## Resultados y Análisis

A continuación se presentan las imágenes relacionadas a los resultados del proceso de descarga: <br>

   Primeramente se verifica que este activada la opción de virtualización en el administrador de tareas.
   <img src="../Informe1/Imagenes/Imagen1.png" alt="Texto alternativo" width="500"><br>
   
   Se descarga e instala la aplicación VirtualBox.
   <img src="../Informe1/Imagenes/Imagen2.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen3.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen4.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen5.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen6.png" alt="Texto alternativo" width="500"><br>
   
   A su vez se descarga la imagen ISO de Linux Mate.
   <img src="../Informe1/Imagenes/Imagen7.png" alt="Texto alternativo" width="250"><br>

   Se inicializa la máquina virtual con la ISO de Linux Mate.
   <img src="../Informe1/Imagenes/Imagen8.png" alt="Texto alternativo" width="250"><br>

   Se crea un usuario para la máquina virtual.
   <img src="../Informe1/Imagenes/Imagen9.png" alt="Texto alternativo" width="500"><br>
   
   Se asigna 2 núcleos y 3072 MB para la máquina virtual.
   <img src="../Informe1/Imagenes/Imagen10.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen11.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen12.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen13.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen14.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen15.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen16.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen17.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen18.png" alt="Texto alternativo" width="250"><br>
   <img src="../Informe1/Imagenes/Imagen19.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen20.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen21.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen22.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen23.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen25.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen26.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen27.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen28.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen29.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen30.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen31.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen34.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen35.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen36.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen37.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen38.png" alt="Texto alternativo" width="500"><br>
   <img src="../Informe1/Imagenes/Imagen39.png" alt="Texto alternativo" width="500"><br>
</p>

La instalación de Linux Mint y herramientas mediante una máquina virtual y Miniconda ofrece un enfoque inteligente para la creación de entornos de desarrollo aislados. Esto permite a los estudiantes experimentar con sistemas operativos y herramientas sin comprometer sus sistemas principales. La virtualización proporcionada por VirtualBox garantiza seguridad y facilita la configuración.

Sin embargo, esta metodología puede aumentar la complejidad para los principiantes, ya que involucra varios pasos y plataformas como Miniconda, que pueden ser desconocidas para algunos. La instalación de herramientas específicas para electrónica digital, como Iverilog y Yosys, a través de Miniconda, puede ser un proceso detallado y requerir un ajuste por parte de los estudiantes.

La elección de Digital como herramienta de diseño de circuitos digitales plantea una dependencia de Java que podría generar problemas de compatibilidad y requerir soluciones adicionales.

## Discusión

La instalación de Linux Mint y las herramientas asociadas para el curso de Electrónica Digital I es un proceso esencial para brindar a los estudiantes un entorno de desarrollo y experimentación efectivo. La decisión de utilizar una máquina virtual a través de VirtualBox en lugar de una instalación nativa de Linux Mint presenta ventajas significativas en términos de aislamiento y seguridad. Sin embargo, esta elección también plantea cuestiones relacionadas con el rendimiento y la limitación de recursos.

Una discusión clave gira en torno a la elección de Miniconda como la plataforma de gestión de paquetes para Python y la instalación de herramientas como Iverilog y Yosys. Si bien Miniconda brinda un control preciso sobre las dependencias y la creación de entornos aislados, también puede generar cierta complejidad adicional para los estudiantes que no están familiarizados con esta plataforma. La necesidad de crear un entorno separado (como 'digital') puede resultar confusa para los principiantes y requerir un tiempo adicional para entender su funcionamiento.

La instalación de Digital, un simulador de circuitos digitales, también presenta su propio conjunto de desafíos. La dependencia de Java para ejecutar Digital puede ser problemática, especialmente si los estudiantes no tienen experiencia previa con Java o no tienen la versión adecuada instalada. Aunque se proporciona una solución para instalar Digital en Linux, la variedad de sistemas operativos y configuraciones podría llevar a posibles obstáculos para algunos estudiantes.

Otra consideración es la interoperabilidad de todas estas herramientas en un entorno virtual. Aunque la instalación individual se ha detallado claramente, podría haber interacciones inesperadas o problemas de compatibilidad entre las herramientas, lo que puede ser frustrante y requerir tiempo para resolver.

## Conclusiones

Este informe ha demostrado el proceso detallado de instalación de Linux Mint, herramientas de Miniconda y Digital para el curso de Electrónica Digital I. La virtualización con VirtualBox permite crear entornos aislados y facilita la instalación de sistemas operativos y herramientas sin afectar el sistema principal. La utilización de Miniconda proporciona un entorno de desarrollo aislado para Python, lo que ayuda a evitar conflictos de dependencias y permite la instalación de Iverilog y Yosys, componentes cruciales para la simulación y síntesis de circuitos digitales. Además, la instalación de Digital brinda una plataforma de diseño y simulación de circuitos digitales accesible y educativa.

Este enfoque de instalación y configuración de herramientas en una máquina virtual resulta beneficioso, ya que proporciona un ambiente controlado y seguro para explorar y experimentar con las tecnologías digitales sin comprometer el sistema principal. La documentación detallada y las referencias proporcionadas son recursos útiles para cualquier estudiante o persona interesada en configurar estas herramientas.

## Referencias

[Repositorio de la guia para instalación de linux y miniconda](https://github.com/johnnycubides/digital-electronic-1-101/tree/main/installTools#complementos-para-digital)

[Repositorio del proyecto digital en github](https://github.com/hneemann/Digital)

