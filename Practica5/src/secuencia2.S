.global ejecutar_secuencia2_asm

/*
 * Secuencia DTMF para marcar: 952291924
 * 
 * a0 = Dirección del registro GPIO_OUT (Puntero)
 * a1 = No usado (mantenido por compatibilidad)
 *
 * Tonos DTMF aproximados (frecuencia promedio de las dos componentes):
 * 1: ~950 Hz  | 2: ~1015 Hz | 3: ~1085 Hz
 * 4: ~990 Hz  | 5: ~1055 Hz | 6: ~1125 Hz
 * 7: ~1030 Hz | 8: ~1095 Hz | 9: ~1165 Hz
 * 0: ~1140 Hz
 */

ejecutar_secuencia2_asm:
    // Guardar registros en la pila
    addi sp, sp, -32
    sw ra, 28(sp)      // Guardar return address
    sw s0, 24(sp)      // Guardar s0 (gpio_out_addr)
    sw s1, 20(sp)      // Guardar s1
    sw s2, 16(sp)      // Guardar s2 (factor de duración)
    
    mv s0, a0          // s0 = gpio_out_addr (preservar en s0)
    mv s2, a1          // s2 = factor de duración (100 = normal, 50 = mitad, 200 = doble)
    
    // Si a1 es 0, usar valor por defecto (100)
    bnez s2, skip_default
    li s2, 100
skip_default:
    
    // Patrón para encender el pin 5 (buzzer)
    li s1, 32          // s1 = 0x20 (bit 5)
    
    // --- Secuencia: 952291924 ---
    // Valores pre-calculados para mejor rendimiento:
    // Dígito 1 (~950 Hz):  ciclos=6700, oscilaciones=190
    // Dígito 2 (~1015 Hz): ciclos=6300, oscilaciones=203
    // Dígito 4 (~990 Hz):  ciclos=6450, oscilaciones=198
    // Dígito 5 (~1055 Hz): ciclos=6050, oscilaciones=211
    // Dígito 9 (~1165 Hz): ciclos=5500, oscilaciones=233
    
    // Dígito 9 (~1165 Hz, 200ms)
    li a0, 5500
    li a1, 233
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 5 (~1055 Hz, 200ms)
    li a0, 6050
    li a1, 211
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 2 (~1015 Hz, 200ms)
    li a0, 6300
    li a1, 203
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 2 (~1015 Hz, 200ms)
    li a0, 6300
    li a1, 203
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 9 (~1165 Hz, 200ms)
    li a0, 5500
    li a1, 233
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 1 (~950 Hz, 200ms)
    li a0, 6700
    li a1, 190
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 9 (~1165 Hz, 200ms)
    li a0, 5500
    li a1, 233
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 2 (~1015 Hz, 200ms)
    li a0, 6300
    li a1, 203
    jal ra, aplicar_duracion
    jal ra, generar_tono
    jal ra, pausa_inter_tono
    
    // Dígito 4 (~990 Hz, 200ms)
    li a0, 6450
    li a1, 198
    jal ra, aplicar_duracion
    jal ra, generar_tono
    
    // Restaurar registros y retornar
    lw ra, 28(sp)
    lw s0, 24(sp)
    lw s1, 20(sp)
    lw s2, 16(sp)
    addi sp, sp, 32
    ret

/*
 * Función: generar_tono
 * Genera un tono de frecuencia específica por una duración determinada
 * 
 * Parámetros:
 *   a0 = ciclos de delay (pre-calculado según frecuencia)
 *   a1 = número de oscilaciones (pre-calculado según duración)
 * 
 * Usa: s0 (gpio_out_addr), s1 (pin mask)
 * Modifica: t0, t1, a0, a1
 */
generar_tono:
    mv t0, a0          // t0 = ciclos de delay
    mv t1, a1          // t1 = oscilaciones totales
    
loop_oscilaciones:
    beqz t1, fin_tono  // Si oscilaciones == 0, terminar
    
    // Encender buzzer
    sw s1, 0(s0)
    mv a0, t0          // Cargar delay
delay_on:
    addi a0, a0, -1
    bnez a0, delay_on
    
    // Apagar buzzer
    sw zero, 0(s0)
    mv a0, t0          // Cargar delay
delay_off:
    addi a0, a0, -1
    bnez a0, delay_off
    
    addi t1, t1, -1    // Decrementar contador de oscilaciones
    j loop_oscilaciones

fin_tono:
    ret

/*
 * Función: aplicar_duracion
 * Multiplica las oscilaciones por el factor de duración s2
 * 
 * Parámetros:
 *   a0 = ciclos (sin modificar)
 *   a1 = oscilaciones base
 * Salida:
 *   a1 = oscilaciones * s2 / 100
 */
aplicar_duracion:
    mul a1, a1, s2
    li t3, 100
    div a1, a1, t3
    ret

/*
 * Función: pausa_inter_tono
 * Pausa fija entre tonos (100ms)
 */
pausa_inter_tono:
    li a0, 800000
    j delay_ciclos    // Tail call - reutiliza el ret de delay_ciclos

/*
 * Función: delay_ciclos
 * Genera un retardo en ciclos de CPU
 * 
 * Parámetros:
 *   a0 = número de ciclos de delay
 * 
 * Modifica: a0
 */
delay_ciclos:
loop_delay:
    addi a0, a0, -1
    bnez a0, loop_delay
    ret
