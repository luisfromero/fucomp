# Práctica 5 - Programación en Ensamblador RISC-V: Control de Hardware e Interrupciones

## Hardware Utilizado

### ESP32-C3 (Seeed XIAO) con Tarjeta de Expansión

En esta práctica utilizamos la **ESP32-C3** con la **tarjeta de expansión XIAO**, no tanto por necesidad de potencia de cómputo, sino por razones pedagógicas:

- **Perder el miedo a programar microcontroladores reales**: La ESP32-C3 es un microcontrolador moderno y accesible que permite interactuar directamente con hardware físico.
- **Facilidad de acceso a periféricos**: La tarjeta de expansión proporciona acceso directo a buzzer, botones, LEDs y sensores sin necesidad de breadboards complejos.
- **Preparación para proyectos reales**: Aprender a activar motores, leer sensores, y controlar actuadores es esencial en sistemas embebidos.
- **Arquitectura RISC-V**: Oportunidad de trabajar con una arquitectura moderna, abierta y en crecimiento.

## Conceptos Teóricos

### 1. Puertos Mapeados en Memoria (Memory-Mapped I/O)

En el ESP32-C3, los periféricos (GPIO, UART, SPI, etc.) se controlan mediante **registros mapeados en memoria**. Esto significa que escribir en ciertas direcciones de memoria tiene efectos directos sobre el hardware.

**Ventajas:**
- Simplifica la programación: usar `sw` (store word) para controlar hardware
- No requiere instrucciones especiales de I/O (a diferencia de arquitecturas x86 con `in`/`out`)
- Uniformidad: todo el hardware se accede igual que la memoria RAM

### 2. Interrupciones y Rutinas de Tratamiento de Interrupción (RTI/ISR)

**Interrupción**: Mecanismo hardware que permite que eventos externos (botón presionado, dato recibido, timer) interrumpan el flujo normal del programa.

**RTI (Rutina de Tratamiento de Interrupción)** o **ISR (Interrupt Service Routine)**:
- Función que se ejecuta automáticamente cuando ocurre una interrupción
- Debe ser **muy rápida** (típicamente microsegundos)
- No debe realizar operaciones bloqueantes
- Patrón común: poner una bandera y retornar, el main loop procesa la acción

**Ventajas vs Polling:**
- **Eficiencia**: La CPU puede hacer otras tareas en lugar de preguntar constantemente
- **Menor latencia**: Respuesta inmediata al evento
- **Menor consumo energético**: La CPU puede entrar en modo de bajo consumo

## Direcciones y Pines Utilizados

### Direcciones de Memoria Mapeadas

| Dirección    | Nombre simbólico (ESP-IDF) | Función                                    |
|--------------|----------------------------|--------------------------------------------|
| `0x60004004` | `GPIO_OUT_REG`             | Escritura: establece el nivel de los GPIO  |
| `0x60004008` | `GPIO_IN_REG`              | Lectura: lee el nivel actual de los GPIO   |

**Nota:** 
- Estas son direcciones físicas del bus APB (Advanced Peripheral Bus) del ESP32-C3
- Los nombres `GPIO_OUT_REG`, `GPIO_IN_REG` son **constantes** definidas en el SDK (ESP-IDF)
- En ensamblador usamos directamente los números: `0x60004004`, `0x60004008`

### Pines Específicos Utilizados

#### Buzzer (Salida)
- **Pin físico**: A3 en la tarjeta de expansión
- **GPIO**: GPIO 5
- **Máscara de bit**: `0x20` (bit 5 = `1 << 5`)
- **Uso**: Generación de tonos mediante onda cuadrada

**Control del buzzer:**
```riscv
li t0, 0x20              # Máscara para GPIO 5
lui t1, 0x60004          # Cargar dirección base
addi t1, t1, 4           # GPIO_OUT_REG = 0x60004004
sw t0, 0(t1)             # Encender (escribir 1 en bit 5)
sw zero, 0(t1)           # Apagar (escribir 0)
```

#### Botón de Usuario (Entrada con Interrupción)
- **Pin físico**: Botón de usuario en tarjeta de expansión
- **GPIO**: GPIO 3 (puede variar según la tarjeta, verificar con escaneo)
- **Configuración**: Pull-up interno habilitado
- **Tipo de interrupción**: Flanco descendente (`GPIO_INTR_NEGEDGE`)
- **Uso**: Disparar la reproducción de secuencia de tonos

**Lógica del botón:**
- **Estado en reposo** (no presionado): `1` (por pull-up)
- **Estado presionado**: `0` (conecta a GND)
- **Interrupción**: Se dispara en la transición `1→0`

### Máscara de Bits para GPIO

Para controlar un GPIO específico mediante `GPIO_OUT_REG`, se usa una **máscara de bits**:

```
GPIO 5 → bit 5 → 0b00100000 → 0x20
```

**Operaciones:**
- **Encender GPIO 5**: Escribir `0x20` en `0x60004004`
- **Apagar GPIO 5**: Escribir `0x00` en `0x60004004`
- **Múltiples GPIO**: Usar OR lógico de máscaras

## Estructura del Código

### Parámetros en Memoria (`.rodata`)

Los parámetros de frecuencia y duración están almacenados en la sección de solo lectura:

```riscv
.section .rodata
param_freq_alta:     .word 4000    # ~1600 Hz (tono agudo)
param_freq_baja:     .word 12000   # ~1050 Hz (tono grave)
param_duracion_media: .word 500     # ~400ms
param_duracion_larga: .word 1500    # ~800ms
param_pin_mask:      .word 0x20    # GPIO 5
```

### Flujo de Interrupción

1. **Configuración** (en `main.c`):
   - Instalar servicio de interrupciones: `gpio_install_isr_service()`
   - Registrar RTI: `gpio_isr_handler_add(GPIO_NUM_3, rti_boton, NULL)`

2. **Evento** (hardware):
   - Usuario presiona el botón
   - GPIO 3 cambia de `1` a `0`
   - Controlador de interrupciones detecta flanco descendente

3. **RTI ejecutada** (automática):
   ```c
   void IRAM_ATTR rti_boton(void* arg) {
       boton_presionado = 1;  // Solo poner bandera (muy rápido)
   }
   ```

4. **Main loop procesa**:
   ```c
   if (boton_presionado) {
       boton_presionado = 0;
       ejecutar_secuencia(gpio_out_addr);  // Acción larga
   }
   ```

## Objetivos de Aprendizaje

1. **Acceso directo a hardware**: Escribir en direcciones de memoria para controlar periféricos
2. **Programación en ensamblador RISC-V**: Uso de registros, stack, llamadas a funciones
3. **Gestión de interrupciones**: Configuración, RTI eficientes, sincronización
4. **Generación de señales**: Crear ondas cuadradas con delays para producir tonos
5. **Organización de código**: Separación entre datos (`.rodata`), código (`.text`), y funciones modulares

## Compilación y Carga

```bash
# Compilar
pio run

# Cargar al ESP32-C3
pio run --target upload

# Monitor serie (115200 baud)
pio device monitor
```

## Modos de Operación

El código tiene dos modos configurables mediante la variable `entrega`:

- **`entrega = false`**: Modo sin botón, reproduce la secuencia una vez al inicio
- **`entrega = true`**: Modo con interrupción, reproduce al presionar el botón

## Referencias

- [ESP32-C3 Technical Reference Manual](https://www.espressif.com/sites/default/files/documentation/esp32-c3_technical_reference_manual_en.pdf)
- [RISC-V Assembly Programmer's Manual](https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm.md)
- [Seeed XIAO ESP32C3 Wiki](https://wiki.seeedstudio.com/XIAO_ESP32C3_Getting_Started/)
