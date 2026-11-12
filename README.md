# Perez-post1-u4
# Laboratorio de Ensamblador NASM – Unidad 4

## Descripción

Este proyecto corresponde al laboratorio de ensamblador de la Unidad 4. Su objetivo es practicar la programación en lenguaje ensamblador utilizando NASM, mediante la creación de programas de 16 bits y su ejecución en DOSBox.

El laboratorio está dividido en dos partes, en las que se trabajan instrucciones, variables, macros, ciclos, comparaciones y procedimientos.

## Herramientas utilizadas

- **NASM:** ensamblador utilizado para generar los archivos objeto.
- **ALINK 1.6:** enlazador utilizado para generar los ejecutables.
- **DOSBox 0.74-3:** emulador utilizado para ejecutar los programas.
- **Visual Studio Code:** editor utilizado para escribir y organizar el código.

## Estructura del proyecto

```text
Perez-post1-u4/
│
├── Parte1/
│   ├── programa.asm
│   ├── programa.obj
│   └── programa.exe
│
├── Parte2/
│   ├── macros.asm
│   ├── programa2.asm
│   ├── programa2.obj
│   └── programa2.exe
│
├── Capturas/
│   └── Evidencias del laboratorio
│
└── README.md
```

## Parte 1 – Fundamentos de ensamblador

En esta parte se desarrolló un programa para practicar el manejo de variables y la salida de información en pantalla.

Se trabajaron los siguientes conceptos:

- Declaración de variables de tipo byte, word y dword.
- Manejo de registros.
- Inicialización del segmento de datos.
- Uso de interrupciones de DOS.
- Conversión e impresión de valores decimales.
- Recorrido e impresión de una tabla de bytes.

## Parte 2 – Macros y control de flujo

En esta parte se implementaron macros y estructuras de control para reutilizar instrucciones y controlar la ejecución del programa.

Se trabajaron los siguientes conceptos:

- Creación y utilización de macros.
- Macros con parámetros.
- Repetición de instrucciones mediante `%rep`.
- Ciclos utilizando `LOOP`.
- Comparaciones mediante `CMP`.
- Saltos condicionales como `JE`.
- Saltos mediante `JMP`.
- Lectura de caracteres desde el teclado.
- Llamadas a procedimientos mediante `CALL` y retorno con `RET`.

Los archivos principales de esta parte son `macros.asm`, donde se encuentran las macros, y `programa2.asm`, donde se utilizan.

## Compilación y ejecución

Los siguientes comandos se ejecutan desde la carpeta principal del proyecto, en PowerShell.

### Compilar y enlazar la Parte 1

```powershell
nasm -f obj Parte1\programa.asm -o Parte1\programa.obj

C:\ASM\TOOLS\alink.exe Parte1\programa.obj -oEXE -o Parte1\programa.exe -entry main
```

### Compilar y enlazar la Parte 2

```powershell
nasm -f obj Parte2\programa2.asm -o Parte2\programa2.obj

C:\ASM\TOOLS\alink.exe Parte2\programa2.obj -oEXE -o Parte2\programa2.exe -entry main
```

### Ejecutar en DOSBox

Montar la carpeta del proyecto:

```dos
MOUNT C "C:\Users\ezlayfer\Desktop\Perez-post1-u4"
```

Para ejecutar la Parte 1:

```dos
C:
CD Parte1
PROGRAMA.EXE
```

Para ejecutar la Parte 2:

```dos
C:
CD Parte2
PROGRA~2.EXE
```

## Evidencias

En la carpeta `Capturas` se encuentran las imágenes tomadas durante el desarrollo del laboratorio, incluyendo la compilación, ejecución y funcionamiento de los programas.

## Conclusión

Con el desarrollo de este laboratorio se practicaron conceptos fundamentales del lenguaje ensamblador, desde el manejo de variables y registros hasta la creación de macros, ciclos, comparaciones y procedimientos.

También se aprendió a compilar y enlazar programas utilizando NASM y ALINK, y a ejecutarlos mediante DOSBox.