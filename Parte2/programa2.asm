%include "Parte2/macros.asm"

section .data
    mensaje db "=== Parte 2: Macros y Control de Flujo ===", 0Dh, 0Ah, "$"
    mensaje_fin db "Programa finalizado correctamente.", 0Dh, 0Ah, "$"

section .stack stack
    resb 256

section .text
global main

main:
   mov ax, seg mensaje
mov ds, ax

    ; Aqui comenzaremos a utilizar las macros
    
    print_str mensaje
    nueva_linea
    ; Repetir un mensaje cinco veces
%rep 5
    print_str mensaje
%endrep
    ; Repetir mensaje mediante LOOP
    mov cx, 3

ciclo_loop:
    print_str mensaje_fin
    loop ciclo_loop
        ; Comparar un valor y realizar un salto condicional
    mov ax, 5
    cmp ax, 5
   je near valor_igual

    print_str mensaje_fin
    jmp near continuar

valor_igual:
    print_str mensaje

continuar:
    ; Leer un caracter desde el teclado
    print_str mensaje
    leer_char
        ; Mostrar el caracter ingresado
    print_char al
            call mostrar_separador
    nueva_linea

    fin_dos

; Procedimiento para mostrar un separador
mostrar_separador:
    print_str mensaje_fin
    ret