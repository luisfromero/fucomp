# Apuntes: Arquitectura del Juego de Instrucciones (ISA)

Este documento detalla los conceptos clave sobre las instrucciones en código binario (vulgarmente conocidas como código máquina) que representa la interfaz entre el hardware y el software, centrándose en cómo las instrucciones representan operaciones y cómo se accede a los datos en memoria.

---

## 1. El Nivel ISA (Instruction Set Architecture)
El nivel **ISA** se define como la "barrera" o frontera crítica entre el hardware y el software.

- **Doble naturaleza:** Es un lenguaje inteligible para el ser humano (a través del ensamblador) y, al mismo tiempo, directamente ejecutable por los circuitos lógicos del computador.
- **Jerarquía:** Se sitúa por debajo del lenguaje ensamblador y por encima de los bloques funcionales y las puertas lógicas.
- **Traducción:** * El paso de lenguaje de alto nivel a binario se considera **traducción de software**.
    * La ejecución de los opcodes por las puertas lógicas y transistores es la **traducción de hardware**.

---

## 2. Anatomía de una Instrucción
Una instrucción es una secuencia binaria que contiene tres elementos fundamentales:
1. **Código de Operación (OpCode):** Especifica la acción (Ej: Sumar, Mover, Saltar).
2. **Operandos:** Identifica los datos o las direcciones necesarias para la operación.
3. **Efectos Colaterales:** Cambios automáticos en registros de control como el **PC** (Program Counter), el **SR** (Status Register) o registros de índices.

La operación es una tarea sencilla, en la que, normalmente, uno o dos datos guardados en algún lugar del computador, se procesan y guardan en otro lugar.

Los movimientos (que realmente son  _copias_ de datos) son algunas de las instrucciones más frecuentes: lo que se almacena aquí se copia a otro lugar. Equivale al x=y que habitualmente usamos en programación de alto nivel.

Otro ejemplo muy frecuente es el de la suma: x = y + z. En este caso, la instrucción busca dos datos, los procesa, y guarda el resultado.

---

## 3. Gestión de Memoria y Alineación
La memoria es una estructura ordenada donde los datos pueden ocupar múltiples posiciones.

- **Direccionamiento:** La dirección de un dato multibyte es siempre la de su posición más baja.
- **Alineación:** Para optimizar el acceso, los datos de tamaño *n* deben situarse en direcciones que sean múltiplos de *n*.
- **Orden de bytes (Endianness):**
    * **Big Endian:** La dirección apunta al byte más significativo.
    * **Little Endian:** La dirección apunta al byte menos significativo.

---

## 4. Modos de Direccionamiento
Determinan cómo el procesador localiza el dato.

### A. Modos Directos
- **Directo por Registro:** El dato está en un registro. Se usa en el 50% de las instrucciones.
- **Directo por Memoria (Absoluto):** La instrucción contiene la dirección de memoria exacta del dato.

### B. Modos Indirectos
La instrucción indica dónde está guardada la dirección del dato.
- **Indirecto por Registro:** Un registro guarda la dirección de memoria del dato.
- **Indirecto por Memoria:** Una posición de memoria guarda la dirección del dato final.

### C. Otros Modos
- **Inmediato (Literal):** El propio dato está incluido dentro de la instrucción (Ej: `ADD #1.5`).
- **Relativo:** La dirección se calcula sumando una base (registro) y un desplazamiento (constante).

---

## 5. Operaciones y Operandos Implícitos
No todos los elementos de una instrucción aparecen de forma explícita en el código.

- **Operandos Implícitos:** Registros que se usan por defecto. 
    * Ejemplo: `MUL BL` asume que el otro operando está en `AL`.
- **Operaciones Implícitas:** Acciones que ocurren automáticamente.
    * Todas las instrucciones incrementan el registro **PC** al finalizar.
    * Muchas instrucciones modifican los **registros de estado** (flags) tras operar.

### El Caso de la Pila (Stack)
La pila es el ejemplo máximo de uso implícito:
- **PUSH / POP:** Modifican el dato pero también gestionan implícitamente el **puntero de pila** (incremento/decremento).

---

## 6. Estándares de Simbología (IEEE-694)
Existen diferentes formas de escribir estas instrucciones según la arquitectura:

| Modo | MIPS | Intel (80x86) | IEEE-694 |
| :--- | :--- | :--- | :--- |
| **Inmediato** | `63` | `63` | `#63` |
| **Indirecto** | `[$s23]` | `[BX]` | `[.23]` |
| **Relativo** | `100($s23)` | `[BX]+4` | `1025[.23]` |

---

