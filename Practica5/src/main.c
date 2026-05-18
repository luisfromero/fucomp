#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

// Definimos la función que escribiremos en ensamblador
extern void ejecutar_secuencia(uint32_t *gpio_out_reg);

// Variable global para la dirección GPIO (necesaria para la RTI)
uint32_t *gpio_out_addr;

// Bandera para indicar que se presionó el botón
volatile int boton_presionado = 0;

// RTI (Rutina de Tratamiento de Interrupción) del botón
// DEBE SER MUY RÁPIDA - solo pone una bandera
// Si no, el sistema operativo aniquilará la tarea por tardanza en la RTI

void IRAM_ATTR rti_boton(void* arg) {
    boton_presionado = 1;
}

void app_main() {
    // 1. Configuración del pin del buzzer como SALIDA
    // El buzzer en XIAO expansion board está en el pin A3 que es GPIO 5
    gpio_config_t io_conf = {};
    io_conf.pin_bit_mask = (1ULL<<5);
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    printf("¡Buzzer configurado! Reproduciendo secuencia inicial...\n");

    // 2. Dirección de memoria mágica
    // En el ESP32-C3, escribir en 0x60004004 cambia el voltaje de los pines.
    gpio_out_addr = (uint32_t *)0x60004004; 

    bool entrega=true;
    if(!entrega){
        printf("Reproduciendo: tono alto (duración media) + tono bajo (duración larga)\n");
        ejecutar_secuencia(gpio_out_addr);
    }
    else{
        int gpio_boton = 3;
        
        printf("\nConfigurando interrupción en GPIO %d...\n", gpio_boton);
        gpio_set_direction(gpio_boton, GPIO_MODE_INPUT);
        gpio_set_pull_mode(gpio_boton, GPIO_PULLUP_ONLY);
        gpio_set_intr_type(gpio_boton, GPIO_INTR_NEGEDGE);  // Flanco descendente
        gpio_install_isr_service(0);
        gpio_isr_handler_add(gpio_boton, rti_boton, NULL);
        // La RTI podría ser ejecutar_secuencia directamente, pero es mejor solo poner una bandera 
        // y ejecutar en el main para evitar que el sistema operativo aniquile la tarea por tardanza en la RTI


        printf("¡Listo! Presiona el botón para reproducir la secuencia.\n");
        
        // 5. Loop infinito: revisar bandera y ejecutar secuencia
        while(1) {
            if (boton_presionado) {
                boton_presionado = 0;  // Resetear bandera
                ejecutar_secuencia(gpio_out_addr);  // Ejecutar en el main, NO en la RTI
            }
            vTaskDelay(pdMS_TO_TICKS(50));  // Revisar cada 50ms
        }    
    }
}