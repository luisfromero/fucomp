## 1. Fundamentos del Formato de Instrucción

En computación, una **instrucción** es la unidad mínima de información que el hardware puede interpretar. Físicamente, es una secuencia binaria dividida en secciones lógicas llamadas **campos**.

### Longitud de la instrucción

* **Fija (RISC-V):** Las instrucciones tienen siempre el mismo tamaño, típicamente **32 bits** (4 bytes). Esto permite que el hardware de decodificación sea simple, rápido y consuma menos energía, ya que el procesador sabe exactamente dónde empieza y termina cada instrucción antes de leerla.
* **Variable (CISC):** Utilizada en arquitecturas antiguas (o x86). Permite instrucciones cortas para tareas simples y largas para complejas. Aunque ahorra memoria, hace que el hardware sea ineficiente al no poder predecir el tamaño de la siguiente instrucción.

### Componentes Clave

1. **Opcode (Código de Operación):** Define qué debe hacer el procesador (sumar, cargar, saltar). En RISC-V suele ocupar 7 bits.
2. **Registros:** Los procesadores modernos operan sobre un "banco de registros". RISC-V tiene **32 registros** de propósito general. Para identificar uno de estos 32 registros, se necesitan 5 bits ($2^5 = 32$).
3. **Inmediatos:** Valores numéricos constantes codificados dentro de la propia instrucción.

---

## 2. El Repertorio de Instrucciones (ISA)

El repertorio es el conjunto de operaciones que el hardware es capaz de entender. RISC-V sigue una filosofía de **instrucciones reducidas**, donde cada instrucción hace solo una cosa pero de forma muy eficiente.

### Clasificación General

* **Transformación:** Aritméticas (suma, resta) y lógicas (AND, OR, XOR).
* **Transferencia:** Movimiento de datos entre la memoria RAM y los registros.
* **Control de flujo:** Saltos condicionales e incondicionales que alteran el Program Counter (PC).

---

## 3. Transferencia de Datos: Modelo Load-Store

RISC-V es una arquitectura **Load-Store**. Esto significa que las operaciones aritméticas (como una suma) no pueden acceder directamente a la memoria RAM. Primero hay que "cargar" los datos en registros, operar con ellos y luego "almacenarlos" de vuelta.

### Carga de Datos (Load Word - `lw`)

La instrucción `lw` copia 32 bits desde la memoria a un registro.

* **Direccionamiento Relativo:** La dirección de memoria se calcula sumando el contenido de un **registro base** y un **desplazamiento** (offset) de 12 bits.
* **Sintaxis:** `lw rd, offset(rs1)` $\rightarrow$ El registro `rd` recibe el contenido de la memoria en la posición `rs1 + offset`.

### Almacenamiento de Datos (Store Word - `sw`)

Realiza la operación inversa: copia el contenido de un registro a la memoria.

* **Sintaxis:** `sw rs2, offset(rs1)` $\rightarrow$ La memoria en la posición `rs1 + offset` recibe el valor del registro `rs2`.

### Variaciones de Tamaño y Signo

No siempre trabajamos con palabras de 32 bits. RISC-V ofrece instrucciones para distintos tamaños:

* **Media palabra (16 bits):** `lh` (carga con extensión de signo), `lhu` (carga con ceros) y `sh` (almacena 16 bits).
* **Byte (8 bits):** `lb` (carga con extensión de signo), `lbu` (carga con ceros) y `sb` (almacena 8 bits).

> **Importante:** RISC-V utiliza el orden **Little-Endian**, lo que significa que el byte menos significativo se almacena en la dirección de memoria más baja.

---

## 4. Operaciones de Desplazamiento y Aritmética Rápida

Los desplazamientos de bits son herramientas potentes para manipular datos a nivel bajo y optimizar cálculos matemáticos.

### Desplazamientos Lógicos (`sll`, `srl`)

Mueven los bits a la izquierda o derecha introduciendo **ceros**.

* **Multiplicación:** Desplazar $n$ posiciones a la izquierda (`slli`) equivale a multiplicar el valor por $2^n$. Es mucho más rápido que usar una unidad de multiplicación.
* **División sin signo:** Desplazar $n$ posiciones a la derecha (`srli`) equivale a dividir por $2^n$ (truncando decimales).

### Desplazamiento Aritmético a la Derecha (`sra`, `srai`)

Es crucial para datos con signo. En lugar de introducir ceros por la izquierda, **propaga el bit de signo** (el bit 31).

* Si el número es negativo, introduce 1s.
* Si es positivo, introduce 0s.
* Esto permite realizar **divisiones con signo** correctas, manteniendo la integridad del valor negativo.

---

## 5. Secuenciamiento de Rutinas y Saltos

El secuenciamiento es la capacidad de romper el orden lineal de ejecución para ejecutar funciones (rutinas) y luego regresar al punto de origen.

### Salto a Función (Jump and Link - `jal`)

Se usa cuando sabemos a dónde queremos saltar (dirección relativa al PC).

* **Mecánica:** Salta a una dirección y guarda la dirección de la "siguiente instrucción" ($PC + 4$) en un registro de enlace (típicamente `ra` o `x1`).
* Ese registro guardado es nuestra "miga de pan" para volver.

### Salto Indirecto (Jump and Link Register - `jalr`)

Es la instrucción más flexible para el manejo de rutinas. La dirección de destino se calcula sumando un registro y un inmediato.

* **Retorno de Subrutina:** Es el uso más común. Si llamamos a una función y la dirección de retorno quedó en `x31`, la función termina con:
`jalr x0, x31, 0`
*Usamos `x0` como destino porque al volver de la función no necesitamos guardar una nueva dirección de retorno.*
* **Punteros a funciones:** Permite saltar a direcciones calculadas en tiempo de ejecución (útil en polimorfismo o tablas de saltos).

### El papel de `x0` y `jr`

En muchos ensambladores verás la instrucción `jr rs` (Jump Register). En realidad, es un pseudocódigo de `jalr x0, rs, 0`. Al usar el registro constante cero (`x0`) como destino, le decimos al procesador: "salta a la dirección que dice el registro, pero no te molestes en guardar dónde estamos ahora".

---
