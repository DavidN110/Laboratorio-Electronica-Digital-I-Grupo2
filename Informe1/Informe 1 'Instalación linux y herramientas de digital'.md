# Instalación de Linux mint y Herramientas para digital 
* [Introducción](#Introducción)
* [Objetivos](#Objetivos)
* [Marco teórico](#Marco-Teórico)
* [Procedimeinto](#Procedimeinto)
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
   
![imagen](informe 1/Imagenes/Imagen1.png)

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


## Análisis y Resultados

<<<<<<< HEAD
A continuación se presentan las imágenes relacionadas a la descarga: 
=======
A continuación se presentan algunas 
![imagen](informe 1/Imagenes/Imagen1.png);
>>>>>>> bc14fc83cfbbc681a771556f34b8a0803bc98515

## Discusión



## Conclusiones



## Referencias

[Repositorio de la guia para instalación de linux y miniconda](https://github.com/johnnycubides/digital-electronic-1-101/tree/main/installTools#complementos-para-digital)

[Repositorio del proyecto digital en github](https://github.com/hneemann/Digital)

