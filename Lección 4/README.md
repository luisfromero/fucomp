
- 1 bit de signo. [file:2]
- 8 bits de exponente. [file:2]
- 23 bits de mantisa almacenada. [file:2]

---

## Transparencia 61
**IEEE-754 de 32 bits** [file:2]

Características cuantitativas del formato `float` (32 bits):

- 8 bits para exponentes → rango aproximado de \(10^{\pm 38}\) en base 10. [file:2]
- 23 bits de mantisa almacenada (24 con el bit implícito) → precisión equivalente a unos **7 dígitos decimales significativos**. [file:2]

Ejemplo en C (tal como aparece en la transparencia): [file:2]

```c
float a = 3.14159263523452345;
main() {
    printf("%22.20f\n", a);
}
// Salida: 3.14159274101257324219
