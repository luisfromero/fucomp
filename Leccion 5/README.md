# Lección 5: Representación Alfanumérica

## Introducción

En las lecciones anteriores hemos visto cómo representar números en un ordenador. Sin embargo, los ordenadores también necesitan representar texto: letras, números escritos, símbolos de puntuación, y otros caracteres especiales. Esta es la representación alfanumérica.

El problema fundamental es: **¿cómo asignar códigos numéricos a los caracteres de texto?**

## 1. ASCII de 7 bits: El Origen (1963)

### Historia y Motivación

ASCII (American Standard Code for Information Interchange) se desarrolló en 1963 como un estándar para la comunicación entre equipos de diferentes fabricantes. Antes de ASCII, cada fabricante usaba su propio código, lo que hacía imposible la comunicación entre sistemas diferentes.

### Características de ASCII 7 bits

ASCII utiliza **7 bits** para codificar caracteres, lo que permite representar **2⁷ = 128 caracteres diferentes**.

La distribución de estos 128 códigos es:
- **0-31**: Caracteres de control (no imprimibles)
- **32-126**: Caracteres imprimibles
- **127**: DEL (carácter de borrado)

### Tabla ASCII Simplificada

| Rango | Decimal | Hex | Contenido |
|-------|---------|-----|-----------|
| Control | 0-31 | 00-1F | CR, LF, TAB, ESC, BEL, etc. |
| Espacio y símbolos | 32-47 | 20-2F | Espacio, !, ", #, $, %, &, ', (, ), *, +, ,, -, ., / |
| Números | 48-57 | 30-39 | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 |
| Símbolos | 58-64 | 3A-40 | :, ;, <, =, >, ?, @ |
| Mayúsculas | 65-90 | 41-5A | A-Z |
| Símbolos | 91-96 | 5B-60 | [, \, ], ^, _, ` |
| Minúsculas | 97-122 | 61-7A | a-z |
| Símbolos | 123-126 | 7B-7E | {, \|, }, ~ |
| Control | 127 | 7F | DEL |

### Ejemplos de Códigos ASCII

```
'A' = 65 (decimal) = 0x41 (hex) = 01000001 (binario)
'a' = 97 (decimal) = 0x61 (hex) = 01100001 (binario)
'0' = 48 (decimal) = 0x30 (hex) = 00110000 (binario)
' ' = 32 (decimal) = 0x20 (hex) = 00100000 (binario)
```

### Conversión Mayúsculas-Minúsculas

Una característica ingeniosa del diseño ASCII es que la diferencia entre una letra mayúscula y su correspondiente minúscula es exactamente 32:

```
'a' - 'A' = 97 - 65 = 32 = 0x20 = 00100000
```

Esto significa que para convertir:
- **Mayúscula → Minúscula**: sumar 32 (o activar bit 5)
- **Minúscula → Mayúscula**: restar 32 (o desactivar bit 5)

### Caracteres de Control Importantes

- **0 (NUL)**: Fin de cadena en C
- **7 (BEL)**: Pitido
- **8 (BS)**: Backspace
- **9 (TAB)**: Tabulador
- **10 (LF)**: Line Feed (nueva línea en Unix/Linux)
- **13 (CR)**: Carriage Return (retorno de carro, parte de nueva línea en Windows)
- **27 (ESC)**: Escape

### Limitaciones de ASCII 7 bits

- Solo cubre el alfabeto inglés
- No hay letras acentuadas (á, é, í, ó, ú)
- No hay letra ñ
- No hay símbolos de moneda (€, £, ¥)
- No hay alfabetos no latinos (cirílico, griego, árabe, chino, etc.)

---

## 2. ASCII Extendido de 8 bits

### El Octavo Bit

Dado que los ordenadores trabajan con bytes (8 bits), el séptimo bit quedaba sin usar en ASCII estándar. Los fabricantes decidieron aprovecharlo.

Con 8 bits se pueden representar **2⁸ = 256 caracteres**.

### El Problema: Incompatibilidad

Cada fabricante o región decidió usar los códigos 128-255 para sus propios caracteres, creando **múltiples versiones incompatibles** de ASCII extendido. Esto llevó a la era de los **Code Pages** (páginas de códigos).

---

## 3. La Época de los Code Pages (1980s-1990s)

### ¿Qué es un Code Page?

Un **Code Page** (página de códigos) es una tabla que define qué carácter corresponde a cada valor numérico en el rango 128-255 (los primeros 128 son siempre ASCII estándar).

### Code Page 437 (CP437) - OEM US

Fue el code page original de **IBM PC** (1981).

**Características:**
- Diseñado para el mercado estadounidense
- Incluía caracteres de dibujo de cajas (box-drawing characters)
- Símbolos matemáticos y algunos caracteres internacionales
- Los caracteres 176-223 son para dibujar cajas y gráficos en modo texto

**Contenido adicional:**
- Letras acentuadas: á, é, í, ó, ú, à, è
- Letra ñ, Ñ
- Símbolos: ¢, £, ¥, ₧
- Caracteres de dibujo: ┌, ┐, └, ┘, ├, ┤, ┬, ┴, ┼, ─, │
- Bloques: █, ▓, ▒, ░

**Uso típico:** MS-DOS, primeras versiones de Windows (modo consola)

### Code Page 850 (CP850) - Latin 1

Desarrollado como mejora del CP437 para **Europa Occidental**.

**Mejoras sobre CP437:**
- Más caracteres acentuados europeos
- Mejor soporte para idiomas como español, francés, alemán, italiano
- Menos caracteres de dibujo de cajas

**Diferencias con CP437:**
- Mantiene ASCII 0-127
- Reorganiza 128-255 para incluir más caracteres útiles en Europa
- Incluye: À, Á, Â, Ã, Ä, Å, Æ, Ç, È, É, Ê, Ë, etc.

### Otros Code Pages Importantes

- **CP852**: Europa Central (polaco, checo, húngaro)
- **CP855**: Cirílico
- **CP857**: Turco
- **CP860**: Portugués
- **CP861**: Islandés
- **CP862**: Hebreo
- **CP863**: Francés canadiense
- **CP865**: Nórdico
- **CP866**: Cirílico ruso

### El Problema de los Code Pages

**Ventaja:**
- Cada región podía tener sus caracteres específicos

**Desventajas:**
- **Incompatibilidad total entre regiones**: un documento escrito en CP850 se veía mal en CP437
- **Imposible mezclar idiomas**: no se podía tener texto en español y ruso en el mismo documento
- **Confusión**: el mismo byte representaba diferentes caracteres según el code page activo
- **Problemas de intercambio**: enviar un archivo a otro país podía resultar en "mojibake" (caracteres incorrectos)

---

## 4. Intentos de Estandarización: ISO e ISO-8859

### ISO 8859: Una Familia de Estándares

La **International Organization for Standardization (ISO)** intentó resolver el caos creando una familia de estándares llamada **ISO 8859** (o ISO/IEC 8859).

Cada parte de la serie ISO 8859 define una "página de códigos" para una región o grupo de idiomas específico.

### ISO 8859-1 (Latin-1): El Más Común

**ISO 8859-1** o **Latin-1** se diseñó para Europa Occidental y América:

**Características:**
- Códigos 0-127: idénticos a ASCII
- Códigos 128-159: caracteres de control (no usados normalmente)
- Códigos 160-255: caracteres latinos extendidos

**Incluye:**
- Todas las letras acentuadas de lenguas europeas occidentales
- Símbolos de moneda: £, ¥, ¢
- Símbolos matemáticos: ×, ÷, ±
- Símbolos especiales: ©, ®, §, ¶
- Fracciones: ¼, ½, ¾

**Idiomas soportados:** español, francés, alemán, portugués, italiano, inglés, sueco, noruego, danés, islandés, finlandés, etc.

### Otras Partes de ISO 8859

- **ISO 8859-2** (Latin-2): Europa Central
- **ISO 8859-3** (Latin-3): Europa del Sur
- **ISO 8859-4** (Latin-4): Europa del Norte
- **ISO 8859-5**: Cirílico
- **ISO 8859-6**: Árabe
- **ISO 8859-7**: Griego
- **ISO 8859-8**: Hebreo
- **ISO 8859-9** (Latin-5): Turco
- **ISO 8859-10** (Latin-6): Nórdico
- **ISO 8859-11**: Tailandés
- **ISO 8859-13** (Latin-7): Báltico
- **ISO 8859-14** (Latin-8): Celta
- **ISO 8859-15** (Latin-9): Revisión de Latin-1 con símbolo €
- **ISO 8859-16** (Latin-10): Europa del Sureste

### Windows-1252: La Variante Microsoft

Microsoft creó **Windows-1252** (también llamado **CP1252**), basado en ISO 8859-1 pero con diferencias:

**Diferencia principal:** Los códigos 128-159 (que en ISO 8859-1 son caracteres de control) se usan para caracteres adicionales:
- Comillas tipográficas: " " ' '
- Guiones especiales: – —
- Símbolo del euro: €
- Símbolo de marca registrada: ™
- Puntos suspensivos: …

**Impacto:** Windows-1252 fue tan usado que se convirtió en un estándar de facto en sistemas Windows.

### Problema Persistente

Aunque ISO 8859 fue una mejora, **seguía siendo imposible**:
- Mezclar múltiples idiomas en un documento (por ejemplo, español con chino)
- Representar todos los idiomas del mundo simultáneamente
- Tener un estándar verdaderamente universal

---

## 5. ANSI: Confusión Terminológica

### El Mito de "ANSI"

En el mundo Windows, es común oír hablar de codificación "ANSI", pero esto es **técnicamente incorrecto**.

**Lo que realmente significa "ANSI" en Windows:**
- En sistemas Windows ingleses: Windows-1252
- En sistemas Windows de Europa Occidental: Windows-1252
- En sistemas Windows de Europa del Este: Windows-1250
- En sistemas Windows rusos: Windows-1251
- etc.

**La verdad:**
- **ANSI** (American National Standards Institute) nunca definió estos estándares de codificación
- El término es heredado de Windows 3.x y se ha mantenido por compatibilidad
- Es simplemente el "code page del sistema" activo

**Conclusión:** Cuando veas "ANSI", realmente significa "el code page predeterminado del sistema Windows", que varía según la configuración regional.

---

## 6. Unicode: La Solución Universal

### El Problema que Unicode Resuelve

A finales de los 1980s, el problema era claro:
- Miles de code pages incompatibles
- Imposible representar todos los idiomas del mundo
- Intercambio internacional de documentos muy problemático
- La web emergente necesitaba un estándar universal

### ¿Qué es Unicode?

**Unicode** es un estándar que asigna un número único (**code point**) a cada carácter de todos los sistemas de escritura del mundo.

**Objetivo:** "Un número para cada carácter, sin importar la plataforma, programa o idioma"

### Unicode Consortium

Fundado en 1991 por empresas como Apple, Microsoft, IBM, Sun, Oracle, Adobe, Google, etc.

**Unicode 15.1** (septiembre 2023):
- 149,813 caracteres
- 161 sistemas de escritura
- Desde ASCII hasta emojis 😀

### Code Points de Unicode

Un **code point** se escribe como **U+XXXX** (donde XXXX es hexadecimal):

```
U+0041 = 'A'
U+0061 = 'a'
U+00F1 = 'ñ'
U+20AC = '€'
U+4E2D = '中' (chino)
U+0427 = 'Ч' (cirílico)
U+05D0 = 'א' (hebreo)
U+0E01 = 'ก' (tailandés)
U+1F600 = '😀' (emoji)
```

### Planos de Unicode

Unicode divide los code points en **17 planos**, cada uno con 65,536 code points:

**Plano 0 - BMP (Basic Multilingual Plane):** U+0000 a U+FFFF
- Contiene la mayoría de caracteres de uso común
- Idiomas modernos (latino, cirílico, griego, árabe, hebreo, devanagari, etc.)
- Símbolos matemáticos, flechas, formas geométricas

**Plano 1 - SMP (Supplementary Multilingual Plane):** U+10000 a U+1FFFF
- Escrituras históricas (cuneiforme, jeroglíficos egipcios)
- Notación musical
- **Emojis** 😀 🎉 ❤️

**Planos 2-16:** Caracteres adicionales y uso privado

### Bloques Importantes de Unicode

| Rango | Nombre | Ejemplos |
|-------|--------|----------|
| U+0000-U+007F | ASCII básico | A-Z, a-z, 0-9 |
| U+0080-U+00FF | Latin-1 Suplemento | á, é, í, ó, ú, ñ, ü, ç |
| U+0100-U+017F | Latin Extendido-A | Ā, ē, ī, ō, ū, œ |
| U+0370-U+03FF | Griego | α, β, γ, δ, Ω |
| U+0400-U+04FF | Cirílico | А, Б, В, Г, Д |
| U+0600-U+06FF | Árabe | ا, ب, ت, ث |
| U+4E00-U+9FFF | CJK Unificado | 中, 文, 字 |
| U+1F600-U+1F64F | Emoticonos | 😀, 😂, 😍 |

### Compatibilidad con ASCII

**Diseño inteligente:** Los primeros 128 code points de Unicode (U+0000 a U+007F) son **idénticos a ASCII**.

Esto significa:
- Cualquier archivo ASCII es también válido en Unicode
- Compatibilidad hacia atrás perfecta
- Transición suave desde ASCII

---

## 7. UTF-8: La Codificación Variable Dominante

### El Problema de la Representación

Unicode define **qué número representa cada carácter**, pero no **cómo almacenar ese número en bytes**.

Aquí entran las **codificaciones Unicode** o **UTF (Unicode Transformation Format)**.

### ¿Qué es UTF-8?

**UTF-8** (8-bit Unicode Transformation Format) es una codificación de longitud variable:
- Usa **1 a 4 bytes** por carácter
- Compatible con ASCII (1 byte para códigos 0-127)
- El estándar dominante en Internet (>98% de las webs)

### Funcionamiento de UTF-8

UTF-8 usa diferentes números de bytes según el rango del code point:

| Code Point | Bytes | Patrón de bits |
|------------|-------|----------------|
| U+0000 - U+007F | 1 byte | 0xxxxxxx |
| U+0080 - U+07FF | 2 bytes | 110xxxxx 10xxxxxx |
| U+0800 - U+FFFF | 3 bytes | 1110xxxx 10xxxxxx 10xxxxxx |
| U+10000 - U+10FFFF | 4 bytes | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx |

### Ejemplos de Codificación UTF-8

**Ejemplo 1: 'A' (U+0041)**
```
Code point: U+0041 = 0100 0001
UTF-8: 01000001 (1 byte)
Hexadecimal: 0x41
```

**Ejemplo 2: 'ñ' (U+00F1)**
```
Code point: U+00F1 = 0000 0000 1111 0001
UTF-8: 11000011 10110001 (2 bytes)
Hexadecimal: 0xC3 0xB1
```

**Ejemplo 3: '€' (U+20AC)**
```
Code point: U+20AC = 0010 0000 1010 1100
UTF-8: 11100010 10000010 10101100 (3 bytes)
Hexadecimal: 0xE2 0x82 0xAC
```

**Ejemplo 4: '😀' (U+1F600)**
```
Code point: U+1F600 = 0001 1111 0110 0000 0000
UTF-8: 11110000 10011111 10011000 10000000 (4 bytes)
Hexadecimal: 0xF0 0x9F 0x98 0x80
```

### Ventajas de UTF-8

1. **Compatible con ASCII:** Los archivos ASCII puros son UTF-8 válido
2. **Eficiente para textos occidentales:** 1 byte para caracteres ASCII
3. **Auto-sincronizable:** Se puede detectar el inicio de un carácter
4. **Sin marca de orden de bytes (BOM):** No hay problema de endianness
5. **Detección de errores:** Los patrones de bits permiten validación
6. **Dominante en web:** Es el estándar de facto en Internet

### Desventajas de UTF-8

1. **Variable:** No se puede acceder directamente al n-ésimo carácter
2. **Más bytes para asiáticos:** 3 bytes para caracteres CJK (chino, japonés, coreano)
3. **Procesamiento más complejo:** Requiere decodificación secuencial

---

## 8. UTF-16: Codificación de 2 o 4 Bytes

### ¿Qué es UTF-16?

**UTF-16** usa **2 o 4 bytes** por carácter:
- **2 bytes** (16 bits) para el BMP (U+0000 a U+FFFF)
- **4 bytes** (2 × 16 bits) para caracteres fuera del BMP mediante **pares sustitutos (surrogate pairs)**

### Funcionamiento de UTF-16

**Para BMP (U+0000 - U+FFFF):**
- Codificación directa en 2 bytes

**Para caracteres fuera del BMP (U+10000 - U+10FFFF):**
- Se usa un **par sustituto** de dos unidades de 16 bits:
  - **Sustituto alto (high surrogate):** 0xD800-0xDBFF
  - **Sustituto bajo (low surrogate):** 0xDC00-0xDFFF

### Ejemplos de Codificación UTF-16

**Ejemplo 1: 'A' (U+0041)**
```
UTF-16: 0x0041 (2 bytes)
```

**Ejemplo 2: 'ñ' (U+00F1)**
```
UTF-16: 0x00F1 (2 bytes)
```

**Ejemplo 3: '€' (U+20AC)**
```
UTF-16: 0x20AC (2 bytes)
```

**Ejemplo 4: '😀' (U+1F600)** - Requiere par sustituto
```
Code point: U+1F600
Paso 1: Restar 0x10000 = 0x0F600
Paso 2: Dividir en 10 bits altos y 10 bits bajos
  Alto: 0x003D = 0000111101
  Bajo: 0x0200 = 1000000000
Paso 3: Añadir bases
  Alto: 0xD800 + 0x003D = 0xD83D
  Bajo: 0xDC00 + 0x0200 = 0xDE00
UTF-16: 0xD83D 0xDE00 (4 bytes)
```

### Endianness en UTF-16

UTF-16 tiene problema de **orden de bytes (endianness)**:

- **UTF-16LE (Little Endian):** Byte menos significativo primero
- **UTF-16BE (Big Endian):** Byte más significativo primero

**Ejemplo: 'A' (U+0041)**
- UTF-16BE: 0x00 0x41
- UTF-16LE: 0x41 0x00

### Marca de Orden de Bytes (BOM)

Para resolver la ambigüedad, se usa un **BOM (Byte Order Mark)**:

- **U+FEFF** al inicio del archivo indica el orden de bytes
- UTF-16BE: 0xFE 0xFF
- UTF-16LE: 0xFF 0xFE

Si se lee al revés (U+FFFE), se sabe que el orden es incorrecto.

### Ventajas de UTF-16

1. **Acceso casi directo:** La mayoría de caracteres comunes son 2 bytes
2. **Eficiente para CJK:** 2 bytes vs 3 bytes en UTF-8
3. **Usado internamente:** Windows, Java, JavaScript, C#, Qt

### Desventajas de UTF-16

1. **No compatible con ASCII:** Todos los caracteres necesitan al menos 2 bytes
2. **Problema de endianness:** Necesita BOM o convención
3. **Variable para emojis:** Emojis necesitan 4 bytes (par sustituto)
4. **Desperdicio:** 2 bytes para caracteres ASCII (vs 1 en UTF-8)

---

## 9. UTF-32: Codificación de Tamaño Fijo

### ¿Qué es UTF-32?

**UTF-32** usa **4 bytes fijos** por cada carácter, sin excepciones.

Cada code point de Unicode se representa directamente como un entero de 32 bits.

### Funcionamiento de UTF-32

**Extremadamente simple:**
```
Code point = valor UTF-32 (sin conversión)
```

**Ejemplo: 'A' (U+0041)**
```
UTF-32: 0x00000041 (4 bytes)
```

**Ejemplo: '😀' (U+1F600)**
```
UTF-32: 0x0001F600 (4 bytes)
```

### Endianness en UTF-32

Como UTF-16, UTF-32 también tiene variantes:
- **UTF-32LE (Little Endian)**
- **UTF-32BE (Big Endian)**
- **BOM:** U+FEFF (0x0000FEFF en BE, 0xFFFE0000 en LE)

### Ventajas de UTF-32

1. **Tamaño fijo:** Cada carácter es exactamente 4 bytes
2. **Acceso directo:** Se puede acceder al n-ésimo carácter en O(1)
3. **Simple:** Sin codificación variable, sin pares sustitutos
4. **Rápido:** No requiere decodificación compleja

### Desventajas de UTF-32

1. **Desperdicio masivo de espacio:** 4 bytes incluso para 'A'
2. **4× más grande que ASCII/UTF-8** para texto occidental
3. **Poco usado:** Casi nadie lo usa para almacenamiento o transmisión
4. **Uso:** Solo internamente en algunas librerías para procesamiento

---

## 10. Comparación de Codificaciones Unicode

### Tabla Comparativa

| Texto | UTF-8 | UTF-16LE | UTF-32LE |
|-------|-------|----------|----------|
| "A" | 1 byte | 2 bytes | 4 bytes |
| "Hola" | 4 bytes | 8 bytes | 16 bytes |
| "Hóla" | 5 bytes | 8 bytes | 16 bytes |
| "España" | 7 bytes | 12 bytes | 24 bytes |
| "中文" | 6 bytes | 4 bytes | 8 bytes |
| "😀" | 4 bytes | 4 bytes | 4 bytes |
| "Hello😀" | 10 bytes | 12 bytes | 24 bytes |

### Cuándo Usar Cada Codificación

**UTF-8:**
- ✅ Archivos de texto
- ✅ Páginas web (HTML, CSS, JavaScript)
- ✅ Archivos de configuración (JSON, XML, YAML)
- ✅ Transmisión por red
- ✅ Línea de comandos Unix/Linux
- ✅ **Recomendación general:** Usa UTF-8 por defecto

**UTF-16:**
- ✅ Internamente en Windows (API wide char)
- ✅ Java (String)
- ✅ JavaScript (String)
- ✅ C# (.NET String)
- ✅ Qt (QString)
- ⚠️ Eficiente para texto asiático (CJK)

**UTF-32:**
- ⚠️ Procesamiento interno de caracteres
- ⚠️ Cuando se necesita acceso indexado rápido
- ❌ **Evitar** para almacenamiento o transmisión

---

## 11. Problemas Comunes y Mojibake

### ¿Qué es Mojibake?

**Mojibake** (文字化け) es una palabra japonesa que significa "transformación de caracteres". Se refiere a texto ilegible debido a una **mala interpretación de la codificación**.

### Ejemplos Clásicos de Mojibake

**Ejemplo 1: UTF-8 leído como Windows-1252**
```
Original: "España"
UTF-8 bytes: 45 73 70 61 C3 B1 61
Leído como Win-1252: "EspaÃ±a"
```

**Ejemplo 2: Windows-1252 leído como UTF-8**
```
Original: "€100"
Win-1252 bytes: 80 31 30 30
Leído como UTF-8: "�100" (� = carácter de reemplazo)
```

**Ejemplo 3: UTF-8 leído como ISO-8859-1**
```
Original: "café"
UTF-8 bytes: 63 61 66 C3 A9
Leído como ISO-8859-1: "cafÃ©"
```

### Causas Comunes de Mojibake

1. **Asumir codificación incorrecta:** Leer UTF-8 como si fuera Windows-1252
2. **Mezclar codificaciones:** Escribir parte en UTF-8 y parte en ISO-8859-1
3. **Falta de declaración:** No especificar `<meta charset="UTF-8">` en HTML
4. **Conversión incorrecta:** Convertir entre codificaciones sin conocer la original
5. **Configuración del sistema:** Terminal o editor configurado con codificación diferente

### Cómo Prevenir Mojibake

1. **Usa UTF-8 por defecto** para todo
2. **Declara la codificación explícitamente:**
   - HTML: `<meta charset="UTF-8">`
   - XML: `<?xml version="1.0" encoding="UTF-8"?>`
   - Python: `# -*- coding: utf-8 -*-`
3. **Configura tu editor** para usar UTF-8
4. **Verifica la codificación** al abrir archivos
5. **BOM (Byte Order Mark):** Puede ayudar a identificar UTF-8, pero no siempre es necesario

---

## 12. Resumen y Conclusiones

### Evolución Histórica

```
ASCII 7-bit (1963)
    ↓
ASCII extendido 8-bit (1980s)
    ↓
Code Pages: CP437, CP850, etc.
    ↓
ISO 8859 (Latin-1, Latin-2, etc.)
    ↓
Unicode (1991) + UTF-8, UTF-16, UTF-32
    ↓
UTF-8 dominante (2008-presente)
```

### Conceptos Clave

1. **ASCII:** El origen, 7 bits, 128 caracteres, solo inglés
2. **Code Pages:** Soluciones regionales incompatibles entre sí
3. **ISO 8859:** Intento de estandarización, aún limitado regionalmente
4. **Unicode:** Estándar universal con 149,000+ caracteres
5. **UTF-8:** Codificación variable dominante, compatible con ASCII
6. **UTF-16:** Usada internamente en muchos lenguajes de programación
7. **UTF-32:** Tamaño fijo, poco usada en la práctica

### Recomendaciones Actuales

🎯 **Para nuevos proyectos:**
- **Usa UTF-8 para todo**
- Declara la codificación explícitamente
- Evita code pages antiguos

🎯 **Para mantener código legacy:**
- Identifica qué codificación se usó originalmente
- Migra gradualmente a UTF-8
- Documenta cualquier código no-UTF-8

🎯 **Para desarrollo web:**
- Siempre UTF-8
- `<meta charset="UTF-8">` en todas las páginas
- Configura el servidor para enviar `Content-Type: text/html; charset=UTF-8`

### Curiosidades Finales

- **El emoji más usado** en 2023 fue 😂 (U+1F602 - Face with Tears of Joy)
- **Unicode 15.1** incluye 3,782 emojis
- **UTF-8 fue inventado** por Ken Thompson y Rob Pike en 1992
- **>98% de las páginas web** usan UTF-8 (2024)
- **El code point más alto** posible es U+10FFFF
- **Los emojis** están mayormente en el rango U+1F300-U+1F9FF

---

## Ejercicios Prácticos

1. **Conversión ASCII:** Convierte tu nombre a códigos ASCII (decimal y hexadecimal)

2. **UTF-8 manual:** Codifica manualmente el carácter 'ñ' (U+00F1) en UTF-8

3. **Detección de codificación:** Dado los bytes `C3 B1`, ¿qué carácter es en UTF-8?

4. **Comparación:** Calcula cuántos bytes ocupa "Hola €" en UTF-8, UTF-16 y UTF-32

5. **Investigación:** Busca un ejemplo de mojibake real en tu sistema y explica por qué ocurrió

---

## Referencias y Recursos

- **Unicode Standard:** [unicode.org](https://www.unicode.org)
- **UTF-8 Everywhere:** [utf8everywhere.org](https://utf8everywhere.org)
- **ASCII Table:** [asciitable.com](https://www.asciitable.com)
- **Unicode Character Table:** [unicode-table.com](https://unicode-table.com)
- **RFC 3629:** UTF-8, a transformation format of ISO 10646
- **The Absolute Minimum Every Software Developer Must Know About Unicode** por Joel Spolsky

---

**¡Fin de la Lección 5!**