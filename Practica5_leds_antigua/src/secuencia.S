.global ejecutar_secuencia_asm

/* * a0 = Dirección del registro GPIO_OUT (Puntero)
 * a1 = Cantidad de ciclos de espera (Delay)
 */

ejecutar_secuencia_asm:
    // t0 será nuestro patrón de luces.
    // Empezamos con el bit 0 encendido (Valor 1) -> Pin 0
    li t0, 1          

bucle_principal:
    // --- PASO 1: Escribir en el Hardware (MMIO) ---
    // ¡Boom! Esto enciende el LED físico.
    sw t0, 0(a0)      

    // --- PASO 2: Delay (Gastar tiempo) ---
    mv t1, a1         // Copiamos el valor del delay a un contador temporal (t1)
delay_loop:
    addi t1, t1, -1     // Restar 1
    bnez t1, delay_loop // Si no es cero, sigue restando

    // --- PASO 3: Mover la luz (Shift Left) ---
    // Desplaza el bit una posición a la izquierda
    // 0001 (1) -> 0010 (2) -> 0100 (4) -> 1000 (8)
    slli t0, t0, 1    
    
    // --- PASO 4: Comprobar si nos hemos salido ---
    // Si llegamos a 16 (binario 10000), significa que nos pasamos del pin 3.
    li t2, 16         
    bge t0, t2, reiniciar_patron // Si t0 >= 16, reinicia
    
    j bucle_principal // Repetir infinitamente

reiniciar_patron:
    li t0, 1          // Volver al primer LED (Pin 0)
    j bucle_principal