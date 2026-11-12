; ==========================================
; Laboratorio: Segmentos y salida DOS
; Autor: Luis Perez
; Parte 1
; ==========================================

CR          EQU  0Dh
LF          EQU  0Ah
TERMINADOR  EQU  24h
ITERACIONES EQU  5
ANCHO_LINEA EQU  40

section .data
    bienvenida  db "=== Laboratorio NASM - Unidad 4 ===", CR, LF, TERMINADOR
    separador   db "----------------------------------------", CR, LF, TERMINADOR
    etiqueta_a  db "Variable A (byte):  ", TERMINADOR
        salto_linea db CR, LF, TERMINADOR
    etiqueta_b  db "Variable B (word): ", TERMINADOR
    etiqueta_c  db "Variable C (dword): ", TERMINADOR
    fin_msg     db "Programa finalizado correctamente.", CR, LF, TERMINADOR

    var_byte    db 42
    var_word    dw 1234h
    var_dword   dd 0DEADBEEFh
    tabla_bytes db 1, 2, 3, 4, 5

section .bss
    buffer    resb 80
    resultado resw 1

section .stack stack
    resb 256
section .text
global main

main:
    ; Inicializar el segmento de datos
    mov ax, seg bienvenida
    mov ds, ax

    ; Mostrar mensaje de bienvenida
    mov ah, 09h
    mov dx, bienvenida
    int 21h
        ; Mostrar separador
    mov ah, 09h
    mov dx, separador
    int 21h
    ; Mostrar valor de la variable byte
    mov ah, 09h
    mov dx, etiqueta_a
    int 21h
    mov al, [var_byte]
    xor ah, ah
    mov bx, 10
    xor cx, cx

convertir_byte:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convertir_byte

imprimir_byte:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop imprimir_byte

    mov ah, 09h
    mov dx, salto_linea
    int 21h

    ; Mostrar valor de la variable word
    mov ah, 09h
    mov dx, etiqueta_b
    int 21h

    mov ax, [var_word]
    mov bx, 10
    xor cx, cx
   
convertir_word:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convertir_word

imprimir_word:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop imprimir_word
        mov ah, 09h
    mov dx, salto_linea
    int 21h
      ; Mostrar valor de la variable dword
    mov ah, 09h
    mov dx, etiqueta_c
    int 21h

    mov eax, [var_dword]
    mov ecx, 10
    xor si, si

convertir_dword:
    xor edx, edx
    div ecx
    push dx
    inc si
    test eax, eax
    jnz convertir_dword

imprimir_dword:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    dec si
    jnz imprimir_dword

    ; Salto de línea
    mov ah, 02h
    mov dl, CR
    int 21h

    mov dl, LF
    int 21h

    ; Recorrer e imprimir la tabla de bytes
    mov si, tabla_bytes
    mov cx, ITERACIONES

recorrer_tabla:
    mov al, [si]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Imprimir un espacio
    mov dl, ' '
    mov ah, 02h
    int 21h

    inc si
    loop recorrer_tabla

    ; Mostrar mensaje final
    mov ah, 09h
    mov dx, fin_msg
    int 21h

    ; Terminar programa y regresar a DOS
    mov ax, 4C00h
    int 21h