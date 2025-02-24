# Tema 2: Representación de la Información

## Transparencia 1
**Tema 2: Representación de la Información**

## Transparencia 2
**Contenido**
1. Introducción
2. Clasificación
3. Datos numéricos
   1. Naturales
   2. Corrección de errores
   3. Enteros
   4. Flotantes
4. Datos alfanuméricos
5. Instrucciones y direcciones
   1. Modos de direccionamiento
   2. Formato de instrucciones
   3. Juego de instrucciones

## Transparencia 3
### 2.1 Representación de la Información
**¿Qué es información?**
- **Instrucciones**: Lo que hay que hacer.
- **Datos**: Sobre los que actúan las instrucciones.
- **Representación**: Traducción a un lenguaje específico que la máquina pueda "entender" y "manipular".
  - Se utilizará el símbolo `>` para indicar la operación de representar.
- **¿Cómo se representan instrucciones y datos?**
  - Utiliza un "lenguaje" con solo dos "letras": `0` y `1` (cada letra está asociada a un potencial eléctrico).
  - Las palabras son cadenas binarias: `00001010101`.

## Transparencia 4
**¿Qué tipos de instrucciones?**
- Muy simples. Ejemplo:
  - Almacenar ciertos datos en registros.
  - Almacenar ciertos datos en alguna posición de memoria.
  - Realizar una operación elemental con los datos y guardar el resultado en algún sitio (memoria o registro):
    - Sumas, restas, `AND`, `OR`.
    - Opuesto, inverso, `NOT`, etc.
- Se representan en binario: `NOT Reg3` → `0100100011`.

## Transparencia 5
**¿Qué tipo de datos?**
- Letras del alfabeto y otros símbolos "alfanuméricos": `a`, `B`, `n`, `)`, `?`, `+`, `3`, `S`, etc.

## Transparencia 6
**Dos tipos de problemas**
- **Problemas directos**: ¿Cómo representamos `X`?
  - Ejemplo: `X` → `00100100`.
- **Problemas inversos**: ¿Qué representa `00100100`?
  - Ejemplo: `00100100` → `4`.

## Transparencia 7
**Inconvenientes**
- Símbolos iguales para instrucciones y datos: `0010100101`.
- El "contexto" es siempre necesario:
  - Donde debe haber instrucciones, habrá instrucciones.
  - Donde se espera un dato de cierto tipo, allí debe estar.
- En caso contrario: "El programa ha efectuado una operación no válida".

## Transparencia 8
**Ejemplo de problema inverso**
- ¿Qué representa `01000101`?
  - No hay respuesta válida sin contexto.
- ¿Qué representa `01000101` si identifica un símbolo alfabético utilizando el formato de representación "ASCII"?
  - `01000101` → `"E"`.

## Transparencia 9
### 2.2 Clasificación de la Información
- Datos
- (El resto del contenido parece incompleto o corrupto: "Dación" repetido).

## Transparencia 10
### 2.3 Representación de Datos Numéricos

## Transparencia 11
**Números Naturales**
- **Arbitrarios**:
  - Ejemplo:
    - `1` → `010001`
    - `2` → `001010`
    - `3` → `100101`
- **No arbitrarios**:
  - Responden a ciertas reglas:
    - `1` → `000001`
    - `2` → `000010`
    - `3` → `000100`

## Transparencia 12
**Naturales**
- **Posicionales**:
  - El valor de un dígito (`0` o `1`) depende de la posición:
  
  a b
0 0 -> 0
0 1 -> 1
1 0 -> 2
1 1 -> 3
  
  - El dígito `a` tiene peso `2`, el dígito `b` tiene peso `1`.
- Similar a la numeración indoarábiga: **binario natural**.

## Transparencia 13
**Cuenta en Binario**

## Transparencia 14
**Cuenta en Binario**
- `0000`
- `0001`
- `0010`
- `0011`
- `0100`
- `0101`
- `0110`
- `0111`
(Nota: Hay repeticiones y errores en el OCR, pero se asume una secuencia estándar).

## Transparencia 15
**Binario Natural**
- El peso de cada dígito depende de su valor `d` (`0` o `1`) y su posición `i`.
- Dígito: `010101`
- Posición: `543210`
- Peso de cada dígito: `d_i * 2^i`
- Número: `0*32 + 1*16 + 0*8 + 1*4 + 0*2 + 1*1 = 21`

## Transparencia 16
**Binario Natural: Solución de Problemas**
- **Imprescindible especificar el número de dígitos en el problema directo**.
- Completar con ceros a la izquierda.
- **Problema inverso**: \(\Sigma(d_i \cdot 2^i)\).
- **Problema directo**:
- Convertir `23` a binario:

23 ÷ 2 = 11, resto 1
11 ÷ 2 = 5, resto 1
5 ÷ 2 = 2, resto 1
2 ÷ 2 = 1, resto 0
1 ÷ 2 = 0, resto 1
- Resultado: `00010111`

## Transparencia 17
**Binario Natural: Trucos Imprescindibles**
- Los ceros a la izquierda no cuentan: `001100` equivale a `1100`.
- Cualquier número en la forma `100000` es una potencia de 2.
- En base 10 sería una potencia de 10 (evidente, ¿no?).
- Cualquier número en la forma `111111` es una potencia de 2 menos 1.
- En base 10, existe una sentencia equivalente.
- Del `0` al `15` deben memorizarse (`0000` a `1111`).
- `1K = 1024 = 2^10 = 10000000000` (1 seguido de 10 ceros).
- `1 Mega = 1048576 = 2^20 = 1000000000000000000000` (20 ceros).
- `1 Giga = 2^30 = 100000000000000000000000000000` (30 ceros).
- Todos los impares terminan en `1`, y en `0` los pares.
- Si `A = 00010101` termina en `01`, entonces `A módulo 4 = 1` (`01`).
- Si `A = 00010101` termina en `101`, entonces `A módulo 8 = 5` (`101`).

## Transparencia 18
**Problema**
- En un torneo de tenis, por el sistema de eliminatorias, participan `1024` jugadores. ¿Cuántos partidos hay que programar, incluida la final?
- **Solución**:
- 512 partidos en primera ronda
- +256 partidos en segunda ronda
- +128 en tercera ronda
- +64 partidos en la cuarta
- +32 partidos
- +16 partidos
- +8 partidos de octavos
- +4 cuartos de final
- +2 semifinales
- +1 final
- Total: **1023 partidos**.

## Transparencia 19
**Otra Solución**
- Si en cada partido se elimina un jugador, y tras la final hay `1023` eliminados y un solo ganador:
- Total: **1023 partidos jugados**.

## Transparencia 20
**Binarios Naturales: Regla**
- \(2^n - 1 = 2^{n-1} + 2^{n-2} + 2^{n-3} + \ldots + 2 + 1\)
- Ejemplo: \(1 + 2 + 4 + 8 = 15 = (16 - 1)\)
- `1111 = 10000 - 1`

## Transparencia 21
**Binario Natural: Otras Bases Posicionales**
- En otras bases, la cuenta es similar:
- Base cuatro: `0, 1, 2, 3, 10, 11, 12, 13, 20`
- Base ocho: `0, 1, 2, 3, 4, 5, 6, 7, 10, 11`
- Agrupaciones de bits:
- `00001110` en binario natural es `0032` en base cuatro.
- Se agrupan los bits de dos en dos y se convierten los grupos.
- `00001110` es `016` en base ocho.

## Transparencia 22
**Hexadecimal, o Base 16**
- Se necesitan 16 símbolos: `0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F`.
- `01101000` en binario natural es `68` en base 16:
- \(6 \cdot 16^1 + 8 \cdot 16^0\)
- Se puede deducir una regla general de agrupación de bits.
- Incluso extrapolar a base 100:
- `054229 = 69042299`.

## Transparencia 23
**Otras Representaciones de N**
- Exceso a `X` (caso particular `X=3`): `N + X` en binario.
- Complemento a `X` (caso `X = 2^n - 1`): `X - N` en binario.
- Binario natural con bit de paridad: 1 bit adicional, XOR.
- Códigos Hamming (SEC y DEC): más bits.
- BCD: cada dígito decimal se convierte a binario de 4 bits.
- Gray, reflejo: `0000 0011 0110 1110 1100`.
- **Problema**: ¿Cuáles son posicionales y cuáles no?

## Transparencia 24
**Binario Natural con Bit de Paridad**
- **Paridad de una cadena binaria**: Paridad del número de "unos" contenidos en la cadena.
- Ejemplo: `A = 10001101` tiene 5 "unos"; 5 es impar, luego `A` tiene paridad impar.
- **Bit de paridad**: `0` para cadenas pares, `1` para impares (el bit de paridad de `A` es `1`).
- Ejemplo: Representación de `23` (`10111` en binario) con bit de paridad a la derecha:
- Solución: `101110` (5 unos → impar → bit `0`).

## Transparencia 25
**Representación de Datos Numéricos Enteros (Números con Signo)**

## Transparencia 26
**Representaciones Elementales (1)**
- **Signo - Magnitud**:
- 1 bit representa el signo (siempre el de la izquierda):
- `0` es positivo.
- `1` es negativo.
- `n-1` bits representan la magnitud (en binario natural).
- Doble representación para el cero. Ejemplo de 8 bits:
- `00000000` → `+0`
- `10000000` → `-0`
- **Notación**:
- `n`: número de bits, incluyendo siempre el signo.
- `N`: número que se quiere representar.

## Transparencia 27
**Representaciones (n=4)**
| Base 10 | Signo-Magnitud |
|---------|----------------|
| +7      | 0111           |
| +6      | 0110           |
| +5      | 0101           |
| +4      | 0100           |
| +3      | 0011           |
| +2      | 0010           |
| +1      | 0001           |
| +0      | 0000           |
| -0      | 1000           |
| -1      | 1001           |
| -2      | 1010           |
| -3      | 1011           |
| -4      | 1100           |
| -5      | 1101           |
| -6      | 1110           |
| -7      | 1111           |

## Transparencia 28
**Representaciones Elementales (2)**
- **Representaciones en Exceso**:
- Una representación en exceso a `X` de `n` bits permite representar números desde `-X` hasta `2^n - X`.
- Ejemplo: Exceso a `127` con 8 bits:
- `127` → `00000000` (`-127 + 127` en binario).
- `0` → `01111111` (`0 + 127` en binario).
- `128` → `11111111` (`128 + 127` en binario).
- El bit más significativo indica el signo, pero `1` es positivo.
- El cero tiene representación única.

## Transparencia 29
**Representaciones (n=4)**
| Base 10 | Signo-Magnitud | Exceso a 8 | Exceso a 7 |
|---------|----------------|------------|------------|
| +7      | 0111           | 1111       | 1110       |
| +6      | 0110           | 1110       | 1101       |
| +5      | 0101           | 1101       | 1100       |
| +4      | 0100           | 1100       | 1011       |
| +3      | 0011           | 1011       | 1010       |
| +2      | 0010           | 1010       | 1001       |
| +1      | 0001           | 1001       | 1000       |
| +0      | 0000           | 1000       | 0111       |
| -0      | 1000           |            |            |
| -1      | 1001           | 0111       | 0110       |
| -2      | 1010           | 0110       | 0101       |
| -3      | 1011           | 0101       | 0100       |
| -4      | 1100           | 0100       | 0011       |
| -5      | 1101           | 0011       | 0010       |
| -6      | 1110           | 0010       | 0001       |
| -7      | 1111           | 0001       | 0000       |
| -8      |                | 0000       |            |

## Transparencia 30
**Representación de Negativos en Complemento a 2**
- Es la representación estándar para números enteros.
- El bit de signo es el más significativo:
- `01010101` → Número de `n=8` bits, positivo.
- `1001` → Número de `n=4` bits, negativo.
- Si el número es positivo, se representa en binario natural: de `0` a `2^n - 1`.
- Si el número es negativo:
- La representación no es muy intuitiva.
- Los negativos se representan en complemento a `2^n` del valor absoluto:
- `BinarioNatural(2^n - abs(N))`.
- Denominación auténtica: **Negativos en complemento a 2^n**.

## Transparencia 31
**Representaciones (n=4)**
| Base 10 | Signo-Magnitud | Exceso a 8 | Exceso a 7 | Negativos C-2 |
|---------|----------------|------------|------------|---------------|
| +7      | 0111           | 1111       | 1110       | 0111          |
| +6      | 0110           | 1110       | 1101       | 0110          |
| +5      | 0101           | 1101       | 1100       | 0101          |
| +4      | 0100           | 1100       | 1011       | 0100          |
| +3      | 0011           | 1011       | 1010       | 0011          |
| +2      | 0010           | 1010       | 1001       | 0010          |
| +1      | 0001           | 1001       | 1000       | 0001          |
| +0      | 0000           | 1000       | 0111       | 0000          |
| -0      | 1000           |            |            |               |
| -1      | 1001           | 0111       | 0110       | 1111          |
| -2      | 1010           | 0110       | 0101       | 1110          |
| -3      | 1011           | 0101       | 0100       | 1101          |
| -4      | 1100           | 0100       | 0011       | 1100          |
| -5      | 1101           | 0011       | 0010       | 1011          |
| -6      | 1110           | 0010       | 0001       | 1010          |
| -7      | 1111           | 0001       | 0000       | 1001          |
| -8      |                | 0000       |            | 1000          |

## Transparencia 32
**Negativos en Complemento a 2**
- **¿Por qué un formato tan poco intuitivo?**
- **Motivo nº 1**: Aritmética mucho más sencilla.
- Ejemplo en base 10, con `n=2`, y negativos en complemento a `100` (usando colores en lugar de signos):
- Tengo `23` euros (positivo) → `23` euros.
- Gasto `12` euros en mascarillas (negativo) → `88` euros (complemento a 100).
- ¿Cuánto suman las dos cantidades?

23 +88
111 (n es 2, descartamos el 1 de la izquierda) → 11 euros.


## Transparencia 33
**Negativos en Complemento a 2**
- Ejemplo en base 10, con `n=2`, y negativos en complemento a `100`:
- Debo `44` euros (negativo) → `56` euros.
- Me tocan `16` euros en la primitiva (positivo) → `16` euros.
- ¿Cuánto suman las dos cantidades?

56 +16
72 (Mi deuda es 28).


## Transparencia 34
**Negativos en Complemento a 2**
- Ejemplo en base 10, con `n=2`, y negativos en complemento a `100`:
- Debo `44` euros (negativo) → `56` euros.
- Me llega otra factura de `23` euros (negativo) → `77` euros.
- ¿Cuánto suman las dos cantidades?

56 +77
133 (Mi deuda es 33, descartamos el 1 → 33 + 100 = 67).


## Transparencia 35
**Negativos en Complemento a 2**
- **Motivo nº 2**: ¡Es muy fácil calcular el complemento!
- Ejemplo en base 10, con `n=4`, y negativos en complemento a `10000`:
- Pregunta: ¿Cuál es el complemento a `10000` del número `1327`?
- Respuesta rápida: Uno más el complemento a `9999` del número `1327`.
- Complemento a `9999`:

9 - 1 = 8
9 - 3 = 6
9 - 2 = 7
9 - 7 = 2
- Resultado: `8672` + 1 = `8673`.

## Transparencia 36
**Representaciones (n=4)**
| Base 10 | Signo-Magnitud | Exceso a 8 | Exceso a 7 | Negativos C-2 |
|---------|----------------|------------|------------|---------------|
| +7      | 0111           | 1111       | 1110       | 0111          |
| +6      | 0110           | 1110       | 1101       | 0110          |
| +5      | 0101           | 1101       | 1100       | 0101          |
| +4      | 0100           | 1100       | 1011       | 0100          |
| +3      | 0011           | 1011       | 1010       | 0011          |
| +2      | 0010           | 1010       | 1001       | 0010          |
| +1      | 0001           | 1001       | 1000       | 0001          |
| +0      | 0000           | 1000       | 0111       | 0000          |
| -0      | 1000           |            |            |               |
| -1      | 1001           | 0111       | 0110       | 1111          |
| -2      | 1010           | 0110       | 0101       | 1110          |
| -3      | 1011           | 0101       | 0100       | 1101          |
| -4      | 1100           | 0100       | 0011       | 1100          |
| -5      | 1101           | 0011       | 0010       | 1011          |
| -6      | 1110           | 0010       | 0001       | 1010          |
| -7      | 1111           | 0001       | 0000       | 1001          |
| -8      |                | 0000       |            | 1000          |

## Transparencia 37
**Antes de Seguir...**
- ¿Sabemos sumar uno a un número binario?
- ¿Qué es el acarreo/carry?
- ¿Y el desbordamiento/overflow?

## Transparencia 38
**Representaciones (n=4)**
| Base 10 | Signo-Magnitud | Exceso a 8 | Exceso a 7 | Negativos C-1 |
|---------|----------------|------------|------------|---------------|
| +7      | 0111           | 1111       | 1110       | 0111          |
| +6      | 0110           | 1110       | 1101       | 0110          |
| +5      | 0101           | 1101       | 1100       | 0101          |
| +4      | 0100           | 1100       | 1011       | 0100          |
| +3      | 0011           | 1011       | 1010       | 0011          |
| +2      | 0010           | 1010       | 1001       | 0010          |
| +1      | 0001           | 1001       | 1000       | 0001          |
| +0      | 0000           | 1000       | 0111       | 0000          |
| -0      | 1000           |            |            | 1111          |
| -1      | 1001           | 0111       | 0110       | 1110          |
| -2      | 1010           | 0110       | 0101       | 1101          |
| -3      | 1011           | 0101       | 0100       | 1100          |
| -4      | 1100           | 0100       | 0011       | 1011          |
| -5      | 1101           | 0011       | 0010       | 1010          |
| -6      | 1110           | 0010       | 0001       | 1001          |
| -7      | 1111           | 0001       | 0000       | 1000          |

## Transparencia 39
**Representación "Negativos en Complemento a 2"**
- Negativos: Complemento a 1, más uno.
- Ejemplo: `-23` con 6 bits (recordemos `bn(23) = 10111`):
- Signo: `1`
- C-1(23) = `01000` → C-2(23) = `01000 + 1 = 01001`
- Resultado: `101001`

## Transparencia 40
**Aviso Importante!**
- **¡Solo los negativos invierten los bits!**

## Transparencia 41
**Representación "Negativos en Complemento a 2"**
- Problema: ¿Qué representa `010111` si está en formato N-2?
- Respuesta: `+23` (¡no invertimos bits, porque es positivo!).
- Problema: ¿Qué representa `100111` si está en formato N-2?

## Transparencia 42
**Representación "Negativos en Complemento a 2"**
- ¿Qué representa `100111` si está en formato N-2?
- Identificar signo: Es negativo.
- Por definición: `00111` (7) es el complemento a `32` de `25`; la solución es `-25`.
- Alternativa más fácil:
a) Restar 1: `00110`
b) Invertir bits: `11001`
c) Convertir a base 10: `25`. Solución: `-25`.
- Otra más fácil aún:
a) Invertir bits: `11000`
b) Sumar 1: `11001`
c) Convertir a base 10: `25`. Solución: `-25`.

## Transparencia 43
**Extensión de Números y Extensión del Signo**
- Dada una representación con `n` bits de un número, ¿cómo se representaría con `n+m` bits?
- **Signo-Magnitud**: Insertar `m` ceros entre el signo y la magnitud.
- **Exceso**: Insertar `m` ceros a la izquierda.
- **C-1 y C-2**: Repetir el signo `m` veces a la izquierda ("extensión del signo").

## Transparencia 44
**Números en Punto Fijo**
- Naturales y enteros se conocen como "números en punto fijo" o "coma fija".
- La coma de fracción está fija en el extremo derecho de los registros de almacenamiento:

| 1 | 1 | 0 | 1 | 1 | 1 |

- Se puede, no obstante, fijar en otra posición.

## Transparencia 45
**Números en Punto Fijo**
- Ejemplo:

| 1 | 1 | 0 | 1 | 1 | 1 |

- Posiciones de los dígitos: `i = 2, 3`.
- Pesos a la derecha de la coma: \(d_i \cdot 2^i\) (igual).
- En el ejemplo, los pesos son `0.5` y `0.25`.
- Para ejercicios sobre complemento a 2, se suma 1 al dígito más a la derecha.
- El problema directo es diferente para las partes entera y fracción.

## Transparencia 46
**Convertir 2.5625 a Binario de 4,4 bits**
- Parte fraccionaria:

0.5625 * 2 = 1.125 -> 1
0.125 * 2 = 0.25   -> 0
0.25 * 2 = 0.5     -> 0
0.5 * 2 = 1.0      -> 1

- Resultado: `10.1001` (2 bits enteros, 4 bits fraccionarios).

## Transparencia 47
**Extensión de Números por la Derecha**
- A la derecha de la coma, la extensión con `m` bits es:
- **Signo-Magnitud y N-2**: Añadir `m` ceros.
- **N-1**:
  - Añadir `m` ceros si es positivo.
  - `m` unos si es negativo.

## Transparencia 48
**Ejemplos (de 8 a 16 bits) Sin Fracción**
- Consideremos el `23` y el `-23`:
| Formato         | 8 bits    | 16 bits           | Comentario            |
|-----------------|-----------|-------------------|-----------------------|
| Binario Natural | 00010111  | 0000000000010111  | 0's a izquierda       |
| S-M             | 00010111  | 0000000000010111  | 0's a izq. magnitud   |
| N-1             | 00010111  | 0000000000010111  | Extensión de signo    |
| N-2             | 00010111  | 0000000000010111  | Extensión de signo    |
| Formato         | 8 bits    | 16 bits           | Comentario            |
| Binario Natural | No válido | No válido         |                       |
| S-M             | 10010111  | 1000000000010111  | 0's a izq. magnitud   |
| N-1             | 11101000  | 1111111111101000  | Extensión de signo    |
| N-2             | 11101001  | 1111111111101001  | Extensión de signo    |

## Transparencia 49
**Ejemplos (de 8 a 16 bits) Con Fracción**
- Consideremos el `23.25` y el `-23.25`:
| Formato         | 8 bits    | 16 bits           | Comentario                  |
|-----------------|-----------|-------------------|-----------------------------|
| Binario Natural | 010111.01 | 0000010111.010000 | 0's a izq., 0's a derecha   |
| S-M             | 010111.01 | 0000010111.010000 | 0's a izq. magnitud, 0's dc |
| N-1             | 010111.01 | 0000010111.010000 | Ext. de signo, 0's a dc     |
| N-2             | 010111.01 | 0000010111.010000 | Ext. de signo, 0's a dc     |
| Formato         | 8 bits    | 16 bits           | Comentario                  |
| Binario Natural | No válido | No válido         |                             |
| S-M             | 110111.01 | 1000010111.010000 | 0's a izq. magnitud, 0's dc |
| N-1             | 101000.10 | 1111101000.101111 | Ext. de signo, 1's a dc     |
| N-2             | 101000.11 | 1111101000.110000 | Ext. de signo, 0's a dc     |

## Transparencia 50
**Representación de Datos Numéricos Reales (Números en Punto Flotante)**

## Transparencia 51
**Coma Flotante**
- La representación en punto fijo no es apropiada para ciertos números:
- Ejemplo: \(6.023 \cdot 10^{23}\), \(1.6 \cdot 10^{-19}\), etc.
- Es preferible usar la forma: **mantisa, base, exponente**.
- El exponente hace "flotar la coma" de la mantisa.

## Transparencia 52
**Coma Flotante**
- Si la mantisa está representada en una base `B` (p.e. `B=2`), entonces la base en punto flotante debe ser una potencia de `B`:
- \(1.011 \cdot 2^{12} = 10.11 \cdot 2^{11}\)
- \(1.011 \cdot 4^6 = 101.1 \cdot 4^5\)
- Incrementos y decrementos de exponente implican desplazamientos a izquierda y derecha de la coma un número entero de posiciones.

## Transparencia 53
**Coma Flotante**
- Fijada la base, un número en coma flotante es una pareja de números en punto fijo: **Mantisa-Exponente**.
- Ejemplo:
- Base 2.
- 3 bits de mantisa en binario, en la forma `m.mm`.
- 2 bits de exponente (representados en C-2).
- `1.00 e 11` → \(1.0 \cdot 2^{-1} = 0.5\)
- `1.10 e 01` → \(1.5 \cdot 2^1 = 3\)

## Transparencia 54
**Coma Flotante: Números Representables**
- (El contenido parece incompleto o corrupto en el OCR; se asume una lista de combinaciones posibles, pero no está clara).

## Transparencia 55
**Coma Flotante: Bases Superiores. Ejemplo Base 4**
- (El contenido está corrupto; se asume una extensión del concepto de base 4, pero no hay datos específicos).

## Transparencia 56
**Coma Flotante: Aumento del Exponente**
- (El contenido está corrupto; se asume que trata sobre cómo ajustar el exponente, pero no hay detalles claros).

## Transparencia 57
**Coma Flotante: Aumento de Mantisa**
- (El contenido está corrupto; se asume que trata sobre cómo ajustar la mantisa, pero no hay detalles claros).

## Transparencia 58
**Normalización de Mantisas**
- \(6.023 \cdot 10^{23}\), \(60.23 \cdot 10^{22}\), \(602.3 \cdot 10^{21}\): varias formas de representar un mismo número.
- Ejemplo: 5 bits → 32 combinaciones, pero solo 20 números representables (redundancia).
- **Solución**: Fijar la coma respecto al dígito más significativo (DMS): **Normalización**.
- Ejemplo: Solo la forma \(6.023 \cdot 10^{23}\) es válida.
- El cero es un caso especial (no tiene DMS).

## Transparencia 59
**Normalización de Mantisas: Bit Implícito**
- Solo las combinaciones `1.MM-EE` son válidas.
- "Gastamos" un bit para guardar siempre un `1`.
- **Solución**: Al representar, no guardar ese `1`.
- **Bit implícito**: `1.011 e 11` se guarda como `011 e 11` (aumentamos la precisión sin coste, al evitar redundancia).
- ¡Al operar con el número, hay que recuperar el bit implícito!

## Transparencia 60
**IEEE-754 de 32 bits**
- Exponente `E` en exceso a `127` con 8 bits.
- Mantisa en formato signo `S` (1 bit) - magnitud `M`.
- La magnitud `M` tiene 24 bits, pero está normalizada con el bit más significativo (BMS) a la izquierda de la coma, y el BMS se hace implícito (23 bits).
- Fórmula: \((-1)^S \cdot 1.M \cdot 2^{(E-127)}\)
- Estructura:

S EEEEEEEE MMMMMMMMMMMMMMMMMMMMMMM


## Transparencia 61
**IEEE-754 de 32 bits**
- 8 bits para exponentes (rangos de \(10^{\pm 38}\)).
- 23 bits para mantisa (precisión equivalente a 7 dígitos en base 10).
- Ejemplo en C:
```c
float a = 3.14159263523452345;
main() {
    printf("%22.20f\n", a);
}
// Salida: 3.14159274101257324219