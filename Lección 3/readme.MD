# Tema 2: Representación de la Información (Parte 1: Punto Fijo)

## 1. Introducción

### 1.1 Conceptos Básicos

Cuando hablamos de **información** en un computador, siempre podemos distinguir dos grandes tipos:

- **Instrucciones**: Son las órdenes que le dicen al procesador qué hacer (sumar, cargar un dato de memoria, comparar, saltar a otra dirección, etc.).  
- **Datos**: Son los valores sobre los que operan esas instrucciones (números, caracteres, píxeles de una imagen, muestras de audio, direcciones de memoria, etc.).

En una máquina digital, absolutamente todo se codifica mediante la **representación binaria**, es decir, como cadenas de bits (`0` y `1`).  
Cada bit se asocia a un nivel de tensión eléctrica (baja ≈ `0`, alta ≈ `1`), y combinando muchos bits podemos representar una enorme variedad de valores y símbolos.

Es importante entender que el hardware solo ve patrones de unos y ceros; la interpretación (número, carácter, instrucción…) la pone el **contexto** del programa y de la arquitectura del sistema.

### 1.2 Tipos de Problemas

En esta parte del temario aparecen constantemente dos tipos de ejercicios relacionados con la representación:

- **Problema directo**: Dado un valor “humano” (por ejemplo en decimal), obtener su representación binaria en cierta codificación.  
  - Ejemplo: “Representar `23` en binario con 8 bits”.  
- **Problema inverso**: Dada una cadena de bits, averiguar qué valor representa según la codificación indicada.  
  - Ejemplo: “¿Qué número entero representa `01000101` en binario natural?”  
  - Ejemplo: “¿Qué carácter ASCII es `01000101`?”

En exámenes suelen mezclar ambos tipos, y es fácil equivocarse si no se tiene claro **en qué formato** está el número (natural, con signo, complemento a 2, punto fijo, etc.).

### 1.3 Importancia del Contexto

Un mismo patrón de bits puede representar muchas cosas distintas:

- `01000101` puede ser:
  - El número `69` en binario natural.
  - El carácter `E` en ASCII.
  - Parte de una instrucción de máquina.
  - Un color, si se interpreta como componente de un píxel, etc.

Por tanto, **sin contexto** (sin saber qué tipo de dato estamos manejando y qué codificación se utiliza), el significado no es único.  
Esto explica por qué en enunciados siempre se insiste en “representar en C-2”, “en exceso a 127”, “en ASCII”, etc.: el contexto determina la **semántica** de los bits.

---

## 2. Números Naturales (Binario Natural)

### 2.1 Sistema Posicional

El **binario natural** es un sistema posicional, igual que el decimal, pero con base 2 en lugar de base 10.  
<<<<<<< HEAD
En un número binario con **n** bits, cada dígito **dᵢ** toma valor 0 o 1 y tiene un peso **2ⁱ**, siendo **i** la posición empezando en 0 por la derecha:

```math
Valor = Σ(dᵢ · 2ⁱ) para i desde 0 hasta n-1
```
=======
En un número binario con \( n \) bits, cada dígito \( d_i \) toma valor 0 o 1 y tiene un peso \( 2^i \), siendo \( i \) la posición empezando en 0 por la derecha:

\[
\text{Valor} = \sum_{i=0}^{n-1} d_i \cdot 2^i
\]
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Ejemplo: `010101`

- Posiciones (de izquierda a derecha): 5 4 3 2 1 0  
<<<<<<< HEAD
- Pesos: 2⁵, 2⁴, 2³, 2², 2¹, 2⁰
- Cálculo del valor:

```
0·32 + 1·16 + 0·8 + 1·4 + 0·2 + 1·1 = 21
```

Por tanto, `010101` en binario natural representa el número decimal `21`.  
Este proceso es análogo a leer un número decimal: en `432`, el 4 vale 4·10², el 3 pesa como decenas y el 2 como unidades, pero en lugar de base 10 usamos base 2.
=======
- Pesos: \(2^5, 2^4, 2^3, 2^2, 2^1, 2^0\)  
- Cálculo del valor:

\[
0 \cdot 32 + 1 \cdot 16 + 0 \cdot 8 + 1 \cdot 4 + 0 \cdot 2 + 1 \cdot 1 = 21
\]

Por tanto, `010101` en binario natural representa el número decimal `21`.  
Este proceso es análogo a leer un número decimal: en `432`, el 4 vale \(4 \cdot 10^2\), etc., pero en lugar de base 10 usamos base 2.
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

### 2.2 Conversión Decimal → Binario

El método estándar para pasar de decimal entero positivo a binario es el **método de divisiones sucesivas por 2**:

1. Dividir el número entre 2.  
2. Anotar el resto (0 o 1).  
3. Repetir el proceso con el cociente hasta que sea 0.  
4. El número binario se obtiene leyendo los restos **de abajo hacia arriba**.

Ejemplo: Convertir `23` a binario:

```
23 ÷ 2 = 11, resto 1  ↓
11 ÷ 2 = 5,  resto 1  ↓
5  ÷ 2 = 2,  resto 1  ↓
2  ÷ 2 = 1,  resto 0  ↓
1  ÷ 2 = 0,  resto 1  ↓
```

Leyendo los restos desde el último al primero: `10111`.  
Si el enunciado pide, por ejemplo, “representar con 8 bits”, rellenar con ceros a la izquierda: `00010111`.

Otro ejemplo rápido:  
Convertir `10` a binario:

- 10 ÷ 2 = 5, resto 0  
- 5 ÷ 2 = 2, resto 1  
- 2 ÷ 2 = 1, resto 0  
- 1 ÷ 2 = 0, resto 1  

Resultado: `1010`.

### 2.3 Reglas y Trucos Importantes

#### Potencias de 2

Conviene memorizar las potencias más típicas porque aparecen en muchas preguntas:

<<<<<<< HEAD
- **2¹⁰ = 1024 ≈ 1K** → `1` seguido de 10 ceros binarios (`10000000000`)
- **2²⁰ ≈ 1M** → `1` seguido de 20 ceros
- **2³⁰ ≈ 1G** → `1` seguido de 30 ceros
=======
- \(2^{10} = 1024 \approx 1\text{K}\) → `1` seguido de 10 ceros binarios (`10000000000`).  
- \(2^{20} \approx 1\text{M}\) → `1` seguido de 20 ceros.  
- \(2^{30} \approx 1\text{G}\) → `1` seguido de 30 ceros.
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Saber esto ayuda para estimar tamaños de memoria, rangos de enteros, etc.

#### Patrones útiles

<<<<<<< HEAD
- `1` seguido de **n** ceros (`100...0`) equivale a **2ⁿ**
- **n** unos (`111...1`) equivale a **2ⁿ - 1**
- En general:

```math
2ⁿ - 1 = 2ⁿ⁻¹ + 2ⁿ⁻² + ... + 2 + 1
```

Ejemplo:  
`1111` (4 unos) = **2⁴ - 1 = 16 - 1 = 15** = 8 + 4 + 2 + 1
=======
- `1` seguido de \(n\) ceros (`100...0`) equivale a \(2^n\).  
- `n` unos (`111...1`) equivale a \(2^n - 1\).  
- En general:

\[
2^n - 1 = 2^{n-1} + 2^{n-2} + \dots + 2 + 1
\]

Ejemplo:  
`1111` (4 unos) = \(2^4 - 1 = 16 - 1 = 15\) = 8 + 4 + 2 + 1.
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

#### Otros trucos rápidos

- Los ceros a la izquierda **no cambian** el valor del número:  
  `001100` = `1100` = 12.  
- Un número binario **impar** siempre termina en `1`; un número **par** termina en `0`.  
<<<<<<< HEAD
- Los últimos **k** bits determinan el valor módulo **2ᵏ**:  
=======
- Los últimos \(k\) bits determinan el valor módulo \(2^k\):  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
  - Últimos 2 bits → valor módulo 4.  
  - Últimos 3 bits → valor módulo 8.

Memorizar las representaciones de los números del 0 al 15 ayuda mucho:

- 0 → `0000`  
- 1 → `0001`  
- 2 → `0010`  
- …  
- 15 → `1111`

### 2.4 Otras Bases (Octal y Hexadecimal)

Para compactar cadenas largas de bits se utilizan bases intermedias: **octal** (base 8) y **hexadecimal** (base 16).  
<<<<<<< HEAD
Ambas se relacionan muy bien con el binario porque 8 = **2³** y 16 = **2⁴**.
=======
Ambas se relacionan muy bien con el binario porque 8 = \(2^3\) y 16 = \(2^4\).
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

**Octal (base 8)**

- Cada dígito octal representa 3 bits.  
- Para convertir binario → octal, se agrupan los bits de 3 en 3 desde la derecha.  

Ejemplo: `00001110` (binario)

- Agrupar: `000 011 10` → añadir un cero a la izquierda para tener grupos de 3: `000 011 010`.  
- Cada grupo:
  - `000` = 0  
  - `011` = 3  
  - `010` = 2  
- Resultado: `032` en octal.  
En el snippet tenías `016`, depende de cómo se agrupen los bits (cuidado con el alineamiento).

**Hexadecimal (base 16)**

- Cada dígito hexadecimal representa 4 bits.  
- Símbolos: `0-9` y `A, B, C, D, E, F` (donde A=10, B=11, …, F=15).  
- Binario → hex: agrupar bits de 4 en 4 desde la derecha.

Ejemplo: `01101000`

- Agrupación: `0110 1000`  
- `0110` = 6  
- `1000` = 8  
- Resultado: `68` en hexadecimal.

Los ingenieros usan muchísimo hexadecimal porque es más compacto que el binario y sigue siendo fácil de relacionar mentalmente con los bits.

### 2.5 Detección de Errores: Bit de Paridad

Una de las formas más simples de detectar errores de transmisión es añadir un **bit de paridad**:

- **Paridad par**: El número total de unos (incluyendo el bit de paridad) debe ser par.  
- **Paridad impar**: Se fuerza a que el número total de unos sea impar.

Ejemplo: Representar `23` (`10111`) con paridad **par**:

- `10111` tiene 4 unos → ya es un número par de unos.  
- Para mantener paridad par, añadimos un `0` como bit de paridad.  
- Resultado final: `101110`.

Si durante la transmisión se invierte un bit, al contar los unos detectaremos que el total es impar (cuando debe ser par), lo que indica error.  
No corrige el error, pero permite detectar muchas alteraciones simples de un bit.

---

## 3. Números Enteros (con Signo)

### 3.1 Representaciones Elementales

Para representar **números negativos** en binario hay varias codificaciones.  
En todas se suele reservar el bit más significativo (MSB) para el **signo**:

- `0` → número positivo o cero.  
- `1` → número negativo (en las codificaciones con signo).

Dos esquemas básicos:

#### Signo-Magnitud (S-M)

<<<<<<< HEAD
- Se usa 1 bit de signo + **(n-1)** bits para la magnitud en binario natural.  
=======
- Se usa 1 bit de signo + \(n-1\) bits para la magnitud en binario natural.  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
- Ejemplo con 8 bits:
  - `00010111` → signo 0, magnitud `0010111` → +23.  
  - `10010111` → signo 1, magnitud `0010111` → -23.  
- **Problema importante**: existen dos representaciones para el cero:
  - `00000000` → +0  
  - `10000000` → -0  
  Esto complica la lógica y no es deseable en hardware.

#### Exceso a X (biased)

<<<<<<< HEAD
- La idea es desplazar todos los valores sumando una constante **X** (llamada exceso)
- Un número N se codifica como **N + X** en binario natural  
=======
- La idea es desplazar todos los valores sumando una constante \(X\) (llamada exceso).  
- Un número N se codifica como \(N + X\) en binario natural.  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
- Ejemplo: Exceso a 127 con 8 bits:
  - `0` → `0 + 127 = 127` → `01111111`.  
  - `-127` → `-127 + 127 = 0` → `00000000`.

Esta codificación se usa mucho en exponentes de formatos de coma flotante (por ejemplo, IEEE 754 usa exceso a 127 o 1023).

### 3.2 Complemento a 2 (C-2): El Estándar

La representación en **complemento a 2** (C-2) es la más utilizada en procesadores actuales para enteros con signo porque simplifica mucho la aritmética.

#### Representación

<<<<<<< HEAD
Con **n** bits:

- Números **positivos**: se codifican como binario natural, igual que siempre
- Números **negativos**: se representan como **2ⁿ - |N|** en binario

El rango de valores representables con C-2 es:

```math
-2^(n-1) a 2^(n-1) - 1
```
=======
Con \(n\) bits:

- Números **positivos**: se codifican como binario natural, igual que siempre.  
- Números **negativos**: se representan como \(2^n - |N|\) en binario.

El rango de valores representables con C-2 es:

\[
-2^{n-1} \text{ a } 2^{n-1} - 1
\]
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Ejemplo con 8 bits: rango de -128 a 127.

#### Cálculo rápido del complemento a 2 de un negativo

Hay dos formas habituales:

**Método 1: Invertir bits + sumar 1**

Para representar -23 con 8 bits:

1. Representar +23 en binario con 8 bits:  
   `23` = `00010111`.  
2. Invertir todos los bits (complemento a 1):  
   `00010111` → `11101000`.  
3. Sumar 1:  
   `11101000` + `1` = `11101001`.  

Resultado: `11101001` es la representación en C-2 de -23 (con 8 bits).

**Método 2: Calcular \(2^n - |N|\)**

<<<<<<< HEAD
Con 8 bits, **2⁸ = 256**:

- **-23** se codifica como **256 - 23 = 233**  
=======
Con 8 bits, \(2^8 = 256\):

- \(-23\) se codifica como \(256 - 23 = 233\).  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
- 233 en binario: `11101001`.  
- Coincide con el resultado anterior.

#### Problema inverso en C-2: interpretar un binario

Ejemplo: ¿Qué representa `100111` en C-2 (6 bits)?

1. Mirar el primer bit (MSB): es `1` → el número es negativo.  
2. Para obtener la magnitud:
   - Restar 1: `100111` → `100110`.  
   - Invertir los bits: `100110` → `011001`.  
3. `011001` en binario natural es:
<<<<<<< HEAD
   - 0·32 + 1·16 + 1·8 + 0·4 + 0·2 + 1·1 = **25**  
=======
   - \(0 \cdot 32 + 1 \cdot 16 + 1 \cdot 8 + 0 \cdot 4 + 0 \cdot 2 + 1 \cdot 1 = 25\).  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
4. Por tanto, el valor decimal es `-25`.

Truco: si el primer bit es `0`, el valor es el binario natural; si es `1`, hay que aplicar el proceso de “restar 1 e invertir” para hallar la magnitud.

### 3.3 Comparativa de Representaciones (n=4 bits)

| Decimal | Signo-Mag | Exceso a 7 | Exceso a 8 | C-1  | C-2  |
|---------|-----------|------------|------------|------|------|
| +7      | 0111      | 1110       | 1111       | 0111 | 0111 |
| +3      | 0011      | 1010       | 1011       | 0011 | 0011 |
| +0      | 0000      | 0111       | 1000       | 0000 | 0000 |
| -0      | 1000      | —          | —          | 1111 | —    |
| -1      | 1001      | 0110       | 0111       | 1110 | 1111 |
| -3      | 1011      | 0100       | 0101       | 1100 | 1101 |
| -7      | 1111      | 0000       | 0001       | 1000 | 1001 |
| -8      | —         | —          | 0000       | —    | 1000 |

Algunas observaciones importantes:

- En signo-magnitud y complemento a 1 (C-1) existen dos ceros (+0 y -0).  
- En C-2 no existe -0, solo un cero.  
- En C-2, la realización de suma y resta es muy sencilla: se puede usar el mismo circuito que para números sin signo, lo cual simplifica el diseño del ALU.

**Ventajas del C-2**:

- Una única representación del cero.  
- Suma y resta se implementan con el mismo hardware que para enteros sin signo.  
- El rango es simétrico salvo por un valor (el mínimo, p.ej. -128 con 8 bits) que no tiene positivo representable.

### 3.4 Extensión de Signo

Muchas veces hay que representar un mismo valor con más bits (por ejemplo, de 8 a 16 bits).  
Este proceso se llama **extensión** y debe respetar el valor numérico.

Reglas según formato:

| Formato          | Método de extensión                               |
|------------------|---------------------------------------------------|
| Binario Natural  | Añadir ceros a la izquierda                       |
| Signo-Magnitud   | Insertar ceros entre el bit de signo y la magnitud |
| Exceso           | Añadir ceros a la izquierda (manteniendo el exceso) |
<<<<<<< HEAD
| C-1 y C-2        | Repetir el bit de signo (MSB) **m** veces         |
=======
| C-1 y C-2        | Repetir el bit de signo (MSB) \(m\) veces         |
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Ejemplo C-2: `11101001` (8 bits) → a 16 bits:

- Bit de signo = `1`.  
- Se repite ese 1 en las nuevas posiciones de la izquierda:  
  `11111111 11101001`.

Así se mantiene el valor negativo, y la máquina lo interpretará correctamente como el mismo número en más bits.

---

## 4. Números en Punto Fijo (Coma Fija)

### 4.1 Representación de Fracciones

Hasta ahora hemos tratado solo enteros.  
Para representar números con parte fraccionaria se puede utilizar **punto fijo** (coma fija):

- Se fija de antemano la posición de la **coma** dentro del registro.  
- Por ejemplo, formato 4.4: 4 bits para la parte entera y 4 bits para la fracción.

En un formato 4.4, si numeramos posiciones desde la derecha:

- Bits de la parte fraccionaria tienen pesos:
<<<<<<< HEAD
  - **2⁻¹ = 0.5**
  - **2⁻² = 0.25**
  - **2⁻³ = 0.125**
  - **2⁻⁴ = 0.0625**
=======
  - \(2^{-1} = 0.5\)  
  - \(2^{-2} = 0.25\)  
  - \(2^{-3} = 0.125\)  
  - \(2^{-4} = 0.0625\)
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Ejemplo: `10.1001` en un formato con 4 bits fraccionarios:

- Parte entera `10` → 2 decimal.  
<<<<<<< HEAD
- Parte fraccionaria `.1001` → 1·0.5 + 0·0.25 + 0·0.125 + 1·0.0625 = **0.5625**  
=======
- Parte fraccionaria `.1001` → \(1 \cdot 0.5 + 0 \cdot 0.25 + 0 \cdot 0.125 + 1 \cdot 0.0625 = 0.5625\).  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
- Valor total: 2.5625.

### 4.2 Conversión de Fracciones

Para convertir una fracción decimal entre 0 y 1 a binario se usa el método de **multiplicaciones sucesivas por 2**:

1. Multiplicar la fracción por 2.  
2. La parte entera del resultado (0 o 1) es el siguiente bit de la parte fraccionaria.  
3. Tomar la nueva parte fraccionaria (lo que queda tras quitar la parte entera) y repetir.  
4. Parar cuando la parte fraccionaria sea 0 o se alcance la precisión deseada.

Ejemplo: Convertir `0.5625` a binario:

```
0.5625 × 2 = 1.125 → bit = 1, nueva fracción = 0.125
0.125  × 2 = 0.25  → bit = 0, nueva fracción = 0.25
0.25   × 2 = 0.5   → bit = 0, nueva fracción = 0.5
0.5    × 2 = 1.0   → bit = 1, nueva fracción = 0.0
```

Bits obtenidos: `1001`.  
Resultado: `0.1001` en binario.

Si el número completo es `2.5625`:

- Parte entera `2` → `10` en binario.  
- Parte fraccionaria `0.5625` → `.1001`.  

Número completo: `10.1001`.

Este método es análogo al de divisiones por 2 para la parte entera, pero “al revés”.

### 4.3 Extensión con Fracciones

Si tenemos un número en punto fijo y queremos **aumentar la precisión** (más bits de fracción) o el número total de bits, hay que tener cuidado con la extensión:

- **Por la derecha (después de la coma)**:
  - Signo-Magnitud y C-2: se añaden ceros a la derecha (equivale a ganar precisión sin cambiar el valor aproximado).  
  - Complemento a 1 (C-1): se añaden ceros si el número es positivo, y unos si es negativo (para mantener el patrón de complemento).

En la práctica, en ejercicios suele ser suficiente recordar que añadir bits de fracción a la derecha con ceros equivale a afinar la resolución sin cambiar el valor original, si se interpreta con la nueva escala.

### 4.4 Ejemplos Prácticos

#### Representar +23 y -23 (sin fracción)

| Formato         | 8 bits          | 16 bits               | Método                       |
|-----------------|-----------------|------------------------|------------------------------|
| **+23**         |                 |                        |                              |
| Binario Natural | `00010111`      | `0000000000010111`     | Ceros a la izquierda         |
| Signo-Magnitud  | `00010111`      | `0000000000010111`     | Ceros entre signo y magnitud |
| C-1             | `00010111`      | `0000000000010111`     | Extensión de signo (MSB=0)   |
| C-2             | `00010111`      | `0000000000010111`     | Extensión de signo (MSB=0)   |
| **-23**         |                 |                        |                              |
| Signo-Magnitud  | `10010111`      | `1000000000010111`     | Ceros entre signo y magnitud |
| C-1             | `11101000`      | `1111111111101000`     | Extensión de signo           |
| C-2             | `11101001`      | `1111111111101001`     | Extensión de signo           |

Fíjate cómo en C-1 y C-2, al extender de 8 a 16 bits, se repite el bit de signo (1) en las nuevas posiciones.

#### Representar +23.25 y -23.25 (con fracción)

Primero, pasamos a binario:

- `23` = `10111`  
<<<<<<< HEAD
- `0.25` = `0.01` en binario (porque 0.25 = 1/4 = **2⁻²**)  
=======
- `0.25` = `0.01` en binario (porque 0.25 = 1/4 = \(2^{-2}\))  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Luego:

- `23.25` = `10111.01` en binario.

Tabla resumen:

| Formato         | 8 bits          | 16 bits                 | Observaciones                          |
|-----------------|-----------------|--------------------------|----------------------------------------|
| **+23.25**      |                 |                          |                                        |
| Binario Natural | `010111.01`     | `0000010111.010000`      | Ceros a la izq. y a la derecha         |
| Signo-Magnitud  | `010111.01`     | `0000010111.010000`      | Igual, signo 0                         |
| C-1             | `010111.01`     | `0000010111.010000`      | Ext. de signo + ceros a la derecha     |
| C-2             | `010111.01`     | `0000010111.010000`      | Ext. de signo + ceros                  |
| **-23.25**      |                 |                          |                                        |
| Signo-Magnitud  | `110111.01`     | `1000010111.010000`      | Bit de signo = 1                       |
| C-1             | `101000.10`     | `1111101000.101111`      | Ext. de signo + unos en fracción       |
| C-2             | `101000.11`     | `1111101000.110000`      | Ext. de signo + ceros en fracción      |

Estos ejemplos combinan varios conceptos: paso a binario, representación con signo y manejo de la parte fraccionaria.

---

## 5. Conceptos Clave para Exámenes

### 5.1 Problema del Torneo (Ejemplo de \(2^n - 1\))

<<<<<<< HEAD
Planteamiento:

> En un torneo de eliminación directa con 1024 jugadores, ¿cuántos partidos se juegan en total?

Cálculo sin pensar:

- En primera ronda se juegan 512 partidos, 256 en segunda, 128 en tercera, y así, 64, 32, 16, y 8 en octavos. 4 cuartos, 2 semifinales y 1 final. Suman 1023 partidos.


=======
Planteamiento típico:

> En un torneo de eliminación directa con 1024 jugadores, ¿cuántos partidos se juegan en total?

>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
Razonamiento:

- Cada partido elimina exactamente a un jugador.  
- Si empiezas con 1024 jugadores y quieres que quede 1 campeón, debes eliminar a 1023 jugadores.  
- Por tanto, se juegan 1023 partidos, independientemente de cómo se organicen las rondas.

Cálculo rápido usando potencias de 2:

<<<<<<< HEAD
- 1024 = **2¹⁰**
- Número de partidos = **2¹⁰ - 1 = 1023**  
=======
- 1024 = \(2^{10}\).  
- Número de partidos = \(2^{10} - 1 = 1023\).  
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Este problema ilustra de forma intuitiva la fórmula general \(2^n - 1\), que también aparece cuando se habla de “todos unos” en binario.

### 5.2 ¿Por qué Complemento a 2?

La gran ventaja del C-2 es la **simplicidad aritmética**: permite sumar números positivos y negativos usando exactamente el mismo circuito que para números sin signo.  
Es decir, el hardware no necesita un módulo especial para restar; se convierte la resta en suma de complementos.

Analogía en decimal usando complemento a 100:

Supón que quieres hacer 23 - 12 usando solo sumas:

1. Calculas el complemento a 100 de 12:  
   - 100 - 12 = 88.  
2. Sumas 23 + 88:  
   - 23 + 88 = 111.  
3. Te quedas con las dos últimas cifras (mod 100):  
   - Resultado: 11.  

Ejemplo:

```
Tengo 23€ y gasto 12€:
  23 (positivo)
+ 88 (complemento a 100 de 12)
----
 111 → descartamos el 1 → 11€ restantes ✓
```

En binario, el complemento a 2 juega el mismo papel que el complemento a 10, 100 o 1000 en decimal.  
Además, el cálculo del complemento a 2 se reduce a una operación muy sencilla: **invertir todos los bits y sumar 1**, lo que es fácil de implementar en hardware.

---

## Resumen Rápido

Tabla para repasar fórmulas y reglas clave:

| Concepto                 | Fórmula/Regla                             |
|--------------------------|-------------------------------------------|
<<<<<<< HEAD
| **Binario → Decimal**    | Σ(dᵢ · 2ⁱ)                                |
=======
| **Binario → Decimal**    | \(\sum d_i \cdot 2^i\)                    |
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd
| **Decimal → Binario**    | Divisiones sucesivas por 2                |
| **Fracción → Binario**   | Multiplicaciones sucesivas por 2          |
| **C-2 de N**             | Invertir bits + sumar 1                   |
| **Extensión de signo**   | Repetir MSB a la izquierda                |
<<<<<<< HEAD
| **Rango C-2 (n bits)**   | -2^(n-1) a 2^(n-1) - 1                    |
| **Potencias de 2 típicas** | 2¹⁰ ≈ 1K, 2²⁰ ≈ 1M, 2³⁰ ≈ 1G              |
=======
| **Rango C-2 (n bits)**   | \(-2^{n-1}\) a \(2^{n-1}-1\)              |
| **Potencias de 2 típicas** | \(2^{10} \approx 1\text{K}\), \(2^{20} \approx 1\text{M}\), \(2^{30} \approx 1\text{G}\) |
>>>>>>> 286ac24e020a4eb320d7bcc1de3663f6544220cd

Estas reglas y ejemplos son la base para resolver con soltura ejercicios de representación de la información en punto fijo y enteros con signo.