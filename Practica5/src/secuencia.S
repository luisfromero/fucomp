# secuencia.S - Reproducir dos tonos con parámetros en memoria
# Arquitectura: RISC-V (ESP32-C3)
# Función: ejecutar_secuencia(uint32_t *gpio_out_reg)
# 
# Parámetros de entrada:
#   a0 = Dirección del registro GPIO_OUT (0x60004004)
#
# Secuencia:
#   1. Tono de frecuencia ALTA con duración MEDIA
#   2. Tono de frecuencia BAJA con duración LARGA
#
# Todos los parámetros (frecuencias y duraciones) están definidos en memoria

.section .rodata
.align 4

# Parámetros almacenados en memoria (solo lectura)
param_freq_alta:
    .word 4000          # Delay pequeño = frecuencia alta (sonido agudo, ~1600 Hz)

param_freq_baja:
    .word 12000          # Delay grande = frecuencia baja (sonido grave, ~1050 Hz)

param_duracion_media:
    .word 500           # Ciclos del tono 1 (duración media ~400ms)

param_duracion_larga:
    .word 1500           # Ciclos del tono 2 (duración larga ~800ms)

param_pin_mask:
    .word 0x20          # Máscara para GPIO 5 (bit 5 = 0x20)


.section .text
.global ejecutar_secuencia
.type ejecutar_secuencia, @function

ejecutar_secuencia:
    # a0 = dirección GPIO_OUT
    
    # Guardar registros que vamos a usar
    addi sp, sp, -32
    sw ra, 28(sp)
    sw s0, 24(sp)
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)
    sw s4, 8(sp)
    sw s5, 4(sp)
    
    # Guardar dirección GPIO en s0
    mv s0, a0
    
    # Cargar TODOS los parámetros desde memoria al principio (más legible)
    la t0, param_pin_mask
    lw s1, 0(t0)            # s1 = máscara del pin (0x20)
    
    la t0, param_freq_alta
    lw s2, 0(t0)            # s2 = frecuencia alta
    
    la t0, param_freq_baja
    lw s3, 0(t0)            # s3 = frecuencia baja
    
    la t0, param_duracion_media
    lw s4, 0(t0)            # s4 = duración media
    
    la t0, param_duracion_larga
    lw s5, 0(t0)            # s5 = duración larga
    
    # === TONO 1: Frecuencia ALTA, Duración MEDIA ===
    mv a0, s0               # Dirección GPIO
    mv a1, s1               # Máscara pin
    mv a2, s2               # Frecuencia alta (desde s2)
    mv a3, s4               # Duración media (desde s4)
    call reproducir_tono
    
    # Pausa entre tonos
    li a0, 400000
    call delay_simple
    
    # === TONO 2: Frecuencia BAJA, Duración LARGA ===
    mv a0, s0               # Dirección GPIO
    mv a1, s1               # Máscara pin
    mv a2, s3               # Frecuencia baja (desde s3)
    mv a3, s5               # Duración larga (desde s5)
    call reproducir_tono
    
    # Restaurar registros
    lw ra, 28(sp)
    lw s0, 24(sp)
    lw s1, 20(sp)
    lw s2, 16(sp)
    lw s3, 12(sp)
    lw s4, 8(sp)
    lw s5, 4(sp)
    addi sp, sp, 32
    
    ret


# Función auxiliar: reproducir_tono
# Genera una onda cuadrada con frecuencia y duración específicas
# Parámetros:
#   a0 = dirección GPIO_OUT
#   a1 = máscara del pin
#   a2 = delay (controla frecuencia: menor=más agudo)
#   a3 = número de ciclos (controla duración)
reproducir_tono:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)
    
    mv s0, a0               # Guardar dirección GPIO
    mv s1, a3               # Guardar contador de ciclos
    
tono_loop:
    beqz s1, tono_fin       # Si contador = 0, terminar
    
    # Encender pin (escribir máscara)
    sw a1, 0(s0)
    
    # Delay (controla frecuencia)
    mv a0, a2
    call delay_simple
    
    # Apagar pin (escribir 0)
    sw zero, 0(s0)
    
    # Delay (controla frecuencia)
    mv a0, a2
    call delay_simple
    
    # Decrementar contador y repetir
    addi s1, s1, -1
    j tono_loop
    
tono_fin:
    lw ra, 12(sp)
    lw s0, 8(sp)
    lw s1, 4(sp)
    addi sp, sp, 16
    ret


# Función auxiliar: delay simple
# Parámetro: a0 = número de iteraciones
delay_simple:
    addi sp, sp, -4
    sw t0, 0(sp)
    
    mv t0, a0
delay_loop:
    beqz t0, delay_fin
    addi t0, t0, -1
    j delay_loop
    
delay_fin:
    lw t0, 0(sp)
    addi sp, sp, 4
    ret
