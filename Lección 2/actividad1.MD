# Actividad: Simulación del Ciclo de Instrucción

## Introducción

Esta actividad tiene como objetivo que los estudiantes comprendan el ciclo de instrucción de una CPU simulando el proceso con tarjetas de instrucciones. Cada estudiante recibe una tarjeta con dos caras, pero en la primera lección solo se usa la cara verde.

## Materiales

- **Tarjetas** con instrucciones en lenguaje ensamblador y código binario. Las tarjetas se pueden obtener en este [pdf](../recursos/tarjetasES.pdf)
- **Pizarra** para representar registros como `PC`, `R0`, `R1`, `F`, etc.
- **Controlador de memoria** (opcional, un alumno encargado de localizar al poseedor de una tarjeta).
- **Powerpoint** que describe la actividad ([descargar](../recursos/actividad1tarjetas.ppsx))
- **Aplicación Windows** que simula la actividad ([descargar](../recursos/SimpleCPU.exe))

---

## Desarrollo de la Actividad

### 1. Asignación de Tarjetas

Cada estudiante recibe una tarjeta numerada que representa una instrucción. En cada ciclo, la CPU simula la ejecución de la instrucción correspondiente a `PC`.


### 2. Simulación del Ciclo de Instrucción

Cada iteración del ciclo de instrucción sigue estos pasos:

1. **Búsqueda (Fetch):**  
   - El estudiante con el número actual en `PC` lee su tarjeta y la muestra.
   - Se incrementa `PC` en la pizarra.
   
2. **Decodificación (Decode):**  
   - Se identifica la operación en la tarjeta y se explica en la pizarra.
   
3. **Ejecución (Execute):**  
   - El estudiante ejecuta la operación indicada en su tarjeta.
   - Se actualizan los valores en los registros de la pizarra.

---

## Ejemplo de Ejecución

1. **Primer ciclo (`PC = 0`)**
   - El estudiante con la tarjeta `0` la lee:  
     - `LOAD R0, 12`
   - Se actualiza `R0` con el valor de la posición `12` de memoria.
   - `PC` incrementa a `1`.

2. **Segundo ciclo (`PC = 1`)**
   - El estudiante con la tarjeta `1` la lee:  
     - `RESET R1`
   - `R1` se pone a `0`.
   - `PC` incrementa a `2`.

3. **Tercer ciclo (`PC = 2`)**
   - El estudiante con la tarjeta `2` la lee:  
     - `INCR R1`
   - `R1` incrementa en `1`.
   - `PC` incrementa a `3`.

---

## Reflexión y Discusión

Al finalizar, se discute:
- Cómo la CPU ejecuta instrucciones paso a paso.
- El papel del `PC` y los registros.
- Cómo se almacenan las instrucciones en memoria.

Los estudiantes pueden intercambiar tarjetas y repetir el proceso para reforzar el aprendizaje.

