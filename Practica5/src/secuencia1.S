.global ejecutar_secuencia1_asm

/* * a0 = Dirección del registro GPIO_OUT (Puntero)
 * a1 = Cantidad de ciclos de espera (Delay)
 *
 * Secuencia de tres notas:
 * - Mi 6 (E6, ~1319 Hz): 300-350ms, empieza en t=0
 * - Do 6 (C6, ~1047 Hz): 350-400ms, empieza en t=0.35s
 * - Sol 6 (G6, ~1568 Hz): 650ms, empieza en t=0.75s
 * A 160MHz, calculamos los ciclos para cada frecuencia
 */

ejecutar_secuencia1_asm:
    // t0: Patrón para encender el pin 5 (buzzer en A3)
    li t0, 32         // Bit 5 = 100000 en binario = 32 en decimal
    
    // --- PRIMERA NOTA: Mi 6 (~1319 Hz, 325ms) ---
    // Frecuencia: 1319 Hz → período: 758 µs → semi-período: 379 µs
    // A 160 MHz: 379 µs ≈ 60640 ciclos (ajustado por overhead)
    li t4, 430        // Número de oscilaciones: 325ms / 0.758ms ≈ 429
generar_mi6:
    // Encender buzzer
    sw t0, 0(a0)
    li t1, 4850       // Ajustado para ~1319 Hz
delay_on_mi6:
    addi t1, t1, -1
    bnez t1, delay_on_mi6
    
    // Apagar buzzer
    sw zero, 0(a0)
    li t1, 4850
delay_off_mi6:
    addi t1, t1, -1
    bnez t1, delay_off_mi6
    
    addi t4, t4, -1
    bnez t4, generar_mi6
    
    // Pausa hasta t=0.35s (desde que termina Mi 6 hasta Do 6)
    // Mi 6 termina en ~0.325s, pausa de ~25ms
    li t1, 200000
pausa1:
    addi t1, t1, -1
    bnez t1, pausa1
    
    // --- SEGUNDA NOTA: Do 6 (~1047 Hz, 375ms) ---
    // Frecuencia: 1047 Hz → período: 955 µs → semi-período: 477.5 µs
    // A 160 MHz: 477.5 µs ≈ 76400 ciclos (ajustado por overhead)
    li t4, 393        // Número de oscilaciones: 375ms / 0.955ms ≈ 393
generar_do6:
    // Encender buzzer
    sw t0, 0(a0)
    li t1, 6100       // Ajustado para ~1047 Hz
delay_on_do6:
    addi t1, t1, -1
    bnez t1, delay_on_do6
    
    // Apagar buzzer
    sw zero, 0(a0)
    li t1, 6100
delay_off_do6:
    addi t1, t1, -1
    bnez t1, delay_off_do6
    
    addi t4, t4, -1
    bnez t4, generar_do6
    
    // Pausa hasta t=0.75s (desde que termina Do 6 hasta Sol 6)
    // Do 6 termina en ~0.725s, pausa de ~25ms
    li t1, 200000
pausa2:
    addi t1, t1, -1
    bnez t1, pausa2
    
    // --- TERCERA NOTA: Sol 6 (~1568 Hz, 650ms) ---
    // Frecuencia: 1568 Hz → período: 638 µs → semi-período: 319 µs
    // A 160 MHz: 319 µs ≈ 51040 ciclos (ajustado por overhead)
    li t4, 1020       // Número de oscilaciones: 650ms / 0.638ms ≈ 1019
generar_sol6:
    // Encender buzzer
    sw t0, 0(a0)
    li t1, 4050       // Ajustado para ~1568 Hz
delay_on_sol6:
    addi t1, t1, -1
    bnez t1, delay_on_sol6
    
    // Apagar buzzer
    sw zero, 0(a0)
    li t1, 4050
delay_off_sol6:
    addi t1, t1, -1
    bnez t1, delay_off_sol6
    
    addi t4, t4, -1
    bnez t4, generar_sol6
    
    // Asegurar que el buzzer queda apagado
    sw zero, 0(a0)
    
    // TERMINAR - Retornar al programa principal
    ret