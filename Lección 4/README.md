# Tema 2: Representación de la Información - Punto Flotante

## Transparencia 50
**Representación de Datos Numéricos Reales (Números en Punto Flotante)**

## Transparencia 51
**Coma Flotante**
- La representación en punto fijo no es apropiada para ciertos números:
- Ejemplo: 6.023 × 10²³, 1.6 × 10⁻¹⁹, etc.
- Es preferible usar la forma: **mantisa, base, exponente**.
- El exponente hace "flotar la coma" de la mantisa.

## Transparencia 52
**Coma Flotante**
- Si la mantisa está representada en una base `B` (p.e. `B=2`), entonces la base en punto flotante debe ser una potencia de `B`:
- 1.011 × 2¹² = 10.11 × 2¹¹
- 1.011 × 4⁶ = 101.1 × 4⁵
- Incrementos y decrementos de exponente implican desplazamientos a izquierda y derecha de la coma un número entero de posiciones.

## Transparencia 53
**Coma Flotante**
- Fijada la base, un número en coma flotante es una pareja de números en punto fijo: **Mantisa-Exponente**.
- Ejemplo:
- Base 2.
- 3 bits de mantisa en binario, en la forma `m.mm`.
- 2 bits de exponente (representados en C-2).
- `1.00 e 11` → 1.0 × 2⁻¹ = 0.5
- `1.10 e 01` → 1.5 × 2¹ = 3

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
- 6.023 × 10²³, 60.23 × 10²², 602.3 × 10²¹: varias formas de representar un mismo número.
- Ejemplo: 5 bits → 32 combinaciones, pero solo 20 números representables (redundancia).
- **Solución**: Fijar la coma respecto al dígito más significativo (DMS): **Normalización**.
- Ejemplo: Solo la forma 6.023 × 10²³ es válida.
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
- Fórmula: (-1)^S × 1.M × 2^(E-127)
- Estructura:

S EEEEEEEE MMMMMMMMMMMMMMMMMMMMMMM


## Transparencia 61
**IEEE-754 de 32 bits**
- 8 bits para exponentes (rangos de 10^±38).
- 23 bits para mantisa (precisión equivalente a 7 dígitos en base 10).
- Ejemplo en C:
```c
float a = 3.14159263523452345;
main() {
    printf("%22.20f\n", a);
}
// Salida: 3.14159274101257324219
```
