Esta es la curiosa historia de cómo un conflicto satírico sobre huevos pasados por agua terminó definiendo la arquitectura de los procesadores modernos.

## El Origen: Jonathan Swift y los Viajes de Gulliver

El término **"endian"** proviene de la novela *Los viajes de Gulliver* (1726) de Jonathan Swift. En el libro, las naciones de Liliput y Blefuscu llevan décadas en una guerra sangrienta por una nimiedad religiosa: **¿por qué extremo se debe cascar un huevo pasado por agua?**

Originalmente, todos los liliputienses los cascaban por el extremo más ancho (**Big-endians**). Sin embargo, después de que el hijo del Emperador se cortara un dedo con un cuchillo al abrir el huevo, se dictó un decreto obligando a todos a cascar los huevos por el extremo más estrecho (**Little-endians**). Esto provocó rebeliones y guerras civiles, simbolizando lo absurdo de los conflictos doctrinales humanos.

> **Nota Lingüística:** Es importante notar que en inglés, **"endian"** es un **juego de palabras**. No es una palabra técnica original, sino un neologismo creado por Swift al combinar *end* (extremo) con el sufijo *-ian*, que recuerda *indian* (indio), aplicada de forma cómica a las tribus "partidarias de un extremo u otro del huevo". 


---

## El Salto a la Computación: Danny Cohen

En 1980, el informático **Danny Cohen** rescató esta metáfora en su famoso artículo [*"On Holy Wars and a Plea for Peace"*](https://gwern.net/doc/cs/algorithm/1981-cohen.pdf). Cohen utilizó el término para describir cómo diferentes arquitecturas de ordenadores ordenan los bytes en la memoria:

* **Big-endian:** El byte más significativo (el "extremo grande") se almacena en la dirección de memoria más baja. Es la forma en que escribimos los números de izquierda a derecha.
* **Little-endian:** El byte menos significativo (el "extremo pequeño") se almacena primero.


---

## La Guerra Santa: Intel vs. Motorola

El artículo de Cohen comparaba esta disputa con la lucha técnica entre **Intel** y **Motorola**, las dos potencias de la época. Intel adoptó el formato **Little-endian** para su arquitectura x86, argumentando beneficios en operaciones matemáticas de precisión variable. Por el contrario, Motorola (y más tarde Apple e IBM con PowerPC) eligió el **Big-endian**, defendiendo que era más intuitivo para los humanos al depurar código, ya que el orden en memoria coincidía con el orden numérico lógico. Esta decisión técnica obligó a generaciones de programadores a lidiar con la incompatibilidad de datos entre sistemas, una "guerra santa" que persiste hoy en día, aunque la mayoría de los procesadores modernos han adoptado modos "bi-endian" para intentar, finalmente, firmar la paz.

---

## Ejemplo Práctico: El número 23.25

Para representar el número real `23.25` en formato IEEE-754 de 32 bits (float), su valor hexadecimal es `0x41BA0000`.

Así es como se guardaría en la memoria (imaginemos que empieza en la dirección `0x100`):

### Big-endian (Motorola, Redes)
Se guarda tal cual lo leemos ("la parte grande primero"):
| Dirección | 0x100 | 0x101 | 0x102 | 0x103 |
|-----------|-------|-------|-------|-------|
| **Valor** | **41**| **BA**| **00**| **00**|

### Little-endian (Intel x86, RISC-V)
Se guarda al revés ("la parte pequeña primero"):
| Dirección | 0x100 | 0x101 | 0x102 | 0x103 |
|-----------|-------|-------|-------|-------|
| **Valor** | **00**| **00**| **BA**| **41**|

> **Regla mnemotécnica:** En Little-endian, el byte "pequeño" (el del final, LSB) vive en la dirección pequeña.