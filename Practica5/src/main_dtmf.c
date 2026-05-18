#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

// Definimos la función que escribiremos en ensamblador
extern void ejecutar_secuencia1_asm(uint32_t *gpio_out_reg, int delay_loops);
extern void ejecutar_secuencia2_asm(uint32_t *gpio_out_reg, int delay_loops);
//extern void solucion_profesor(uint32_t *gpio_out_reg, int delay_loops);
void app_main_old() {
    // 1. Configuración del pin del buzzer como SALIDA
    // El buzzer en XIAO expansion board está en el pin A3 que es GPIO 5
    gpio_config_t io_conf = {};
    io_conf.pin_bit_mask = (1ULL<<5);
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    printf("¡Buzzer configurado! Reproduciendo doble beep...\n");

    // 2. Dirección de memoria mágica
    // En el ESP32-C3, escribir en 0x60004004 cambia el voltaje de los pines.
    uint32_t *gpio_out_addr = (uint32_t *)0x60004004; 

    // 3. Ejecutar la secuencia de doble beep
    // Param 1 (a0): Dirección de los GPIO
    // Param 2 (a1): Delay entre beeps (ajustado para doble beep)
    //ejecutar_secuencia1_asm(gpio_out_addr, 3000000);
    
    // 4. Ejecutar secuencia DTMF: 952291924
    // Param 2 (a1): Factor de duración (100=normal, 50=mitad, 200=doble)
    int duracion = 300;  // Cambiar este valor para ajustar duración de beeps
    printf("Reproduciendo secuencia DTMF: 952291924 (duración: %d%%)\n", duracion);
    ejecutar_secuencia2_asm(gpio_out_addr, duracion);

    //solucion_profesor(gpio_out_addr, 8000000);
}