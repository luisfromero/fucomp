/*
 * SOLUCIÓN PROFESOR: Secuencia "Coche Fantástico" (Rebote)
 * Arquitectura: RISC-V (ESP32-C3)
 *
 * Lógica:
 * El programa mantiene el estado de la luz en el registro t0.
 * Se mueve a la izquierda (slli) hasta tocar el bit 3 (valor 8).
 * Luego cambia de estado y se mueve a la derecha (srli) hasta tocar el bit 0 (valor 1).
 */

.global solucion_profesor

/* * a0 = Dirección base del registro GPIO_OUT
 * a1 = Valor del delay (ciclos de espera)
 */

solucion_profesor:
    // t0: Patrón de luces actual. Empezamos en bit 0 (Pin 0) -> valor 1
    li t0, 1          

ir_izquierda:
    // 1. Escribir en Hardware (Encender LED)
    sw t0, 0(a0)      

    // 2. Llamada a la subrutina de Delay
    call delay_func

    // 3. Comprobar si hemos llegado al tope izquierdo (Bit 3 -> Valor 8)
    li t2, 8
    beq t0, t2, cambiar_a_derecha // Si t0 == 8, cambiamos de dirección

    // 4. Desplazamiento a la IZQUIERDA
    slli t0, t0, 1    
    j ir_izquierda

cambiar_a_derecha:
    // Ajuste previo: Como acabamos de escribir el 8, el siguiente debe ser 4.
    srli t0, t0, 1 
    // Caemos directamente ("fall through") a la rutina de ir_derecha

ir_derecha:
    // 1. Escribir en Hardware
    sw t0, 0(a0)

    // 2. Delay
    call delay_func

    // 3. Comprobar si hemos llegado al tope derecho (Bit 0 -> Valor 1)
    li t2, 1
    beq t0, t2, cambiar_a_izquierda // Si t0 == 1, cambiamos de dirección

    // 4. Desplazamiento a la DERECHA
    srli t0, t0, 1    
    j ir_derecha

cambiar_a_izquierda:
    // Ajuste previo: Como acabamos de escribir el 1, el siguiente debe ser 2.
    slli t0, t0, 1
    j ir_izquierda


// --- Subrutina de Delay ---
delay_func:
    mv t1, a1         // Copiamos el valor original del delay (a1) a un temporal (t1)
lazo_espera:
    addi t1, t1, -1   // Restamos 1
    bnez t1, lazo_espera // Si no es 0, repetimos
    ret               // Volver