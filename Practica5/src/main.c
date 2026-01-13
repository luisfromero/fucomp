#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

// Definimos la función que escribiremos en ensamblador
extern void ejecutar_secuencia_asm(uint32_t *gpio_out_reg, int delay_loops);
extern void solucion_profesor(uint32_t *gpio_out_reg, int delay_loops);
void app_main() {
    // 1. Configuración de los 4 pines como SALIDA
    // Seleccionamos pines 0, 1, 2 y 3 (Máscara de bits)
    gpio_config_t io_conf = {};
    io_conf.pin_bit_mask = (1ULL<<0) | (1ULL<<1) | (1ULL<<2) | (1ULL<<3);
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    printf("¡Hardware listo! Cediendo el control al Ensamblador RISC-V...\n");

    // 2. Dirección de memoria mágica
    // En el ESP32-C3, escribir en 0x60004004 cambia el voltaje de los pines.
    uint32_t *gpio_out_addr = (uint32_t *)0x60004004; 

    // 3. Ejecutar la secuencia
    // Param 1 (a0): Dirección de los GPIO
    // Param 2 (a1): Velocidad (aprox 4-5 millones de ciclos para ver el parpadeo)
    //ejecutar_secuencia_asm(gpio_out_addr, 8000000);
    solucion_profesor(gpio_out_addr, 8000000);

}