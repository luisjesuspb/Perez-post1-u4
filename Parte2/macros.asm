; macros.asm — biblioteca de macros utilitarias

; Macro: terminar programa DOS
%macro fin_dos 0
    mov ax, 4C00h
    int 21h
%endmacro

; Macro: imprimir nueva línea
%macro nueva_linea 0
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
%endmacro

; Macro: imprimir cadena
%macro print_str 1
    mov ah, 09h
    mov dx, %1
    int 21h
%endmacro

; Macro: imprimir un carácter
%macro print_char 1
    mov ah, 02h
    mov dl, %1
    int 21h
%endmacro

; Macro: leer un carácter desde teclado
%macro leer_char 0
    mov ah, 07h
    int 21h
%endmacro

; Macro: imprimir una cadena N veces
%macro repetir_str 2
    mov cx, %2
%%ciclo:
    mov ah, 09h
    mov dx, %1
    int 21h
    loop %%ciclo
%endmacro

; Macro: imprimir un dígito decimal
%macro print_digito 0
    push ax
    and al, 0Fh
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h
    pop ax
%endmacro