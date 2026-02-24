# Actividad inicial (ciclo de instrucción)

Consulta este [archivo](actividad1.MD).

# Historia de la Informática: De los Transistores a la Computación Cuántica

## Índice
1. [Primera Generación: Transistores (1947-1958)](#primera-generación-transistores-1947-1958)
2. [Segunda Generación: Circuitos Integrados (1959-1964)](#segunda-generación-circuitos-integrados-1959-1964)
3. [Tercera Generación: Microprocesadores (1965-1980)](#tercera-generación-microprocesadores-1965-1980)
4. [La Ley de Moore](#la-ley-de-moore)
5. [Cuarta Generación: RISC y Optimización (1980-2000)](#cuarta-generación-risc-y-optimización-1980-2000)
6. [El Nacimiento de Internet](#el-nacimiento-de-internet)
7. [Quinta Generación: Era Multinúcleo (2000-2010)](#quinta-generación-era-multinúcleo-2000-2010)
8. [Sexta Generación: GPUs y Computación Paralela Masiva (2006-presente)](#sexta-generación-gpus-y-computación-paralela-masiva-2006-presente)
9. [Séptima Generación: Inteligencia Artificial (2010-presente)](#séptima-generación-inteligencia-artificial-2010-presente)
10. [El Futuro: Computación Cuántica](#el-futuro-computación-cuántica)
11. [Evolución de Potencia y Memoria: Datos Curiosos](#evolución-de-potencia-y-memoria-datos-curiosos)

---

## Primera Generación: Transistores (1947-1958)

### El Invento que Cambió Todo

El **transistor** fue inventado en 1947 en los laboratorios Bell por **John Bardeen, Walter Brattain y William Shockley**, quienes recibieron el Premio Nobel de Física en 1956 por este logro.

### ¿Por qué fue revolucionario?

Comparado con las válvulas de vacío de ENIAC:
- **Tamaño**: 100 veces más pequeño
- **Consumo energético**: 1/10 del consumo
- **Fiabilidad**: Duración de años en lugar de horas
- **Velocidad de conmutación**: 10 veces más rápido
- **Calor generado**: Mínimo comparado con las válvulas

### Ordenadores Destacados

- **TRADIC** (1954): Primer ordenador completamente transistorizado
- **IBM 7090** (1959): Primer ordenador transistorizado de gran éxito comercial
- **PDP-1** (1960): Costaba "solo" $120,000 (vs millones de dólares de ordenadores anteriores)

**Dato curioso**: ENIAC tenía 17,468 válvulas de vacío y pesaba 27 toneladas. El TRADIC, con transistores, pesaba solo 140 kg.

---

## Segunda Generación: Circuitos Integrados (1959-1964)

### La Miniaturización Continúa

En 1958, **Jack Kilby** de Texas Instruments y **Robert Noyce** de Fairchild Semiconductor inventaron independientemente el **circuito integrado (IC)**.

### Ventajas del Circuito Integrado

- **Múltiples transistores en un chip**: De unos pocos a cientos
- **Mayor fiabilidad**: Menos conexiones = menos fallos
- **Menor coste**: Producción en masa
- **Mayor velocidad**: Distancias más cortas entre componentes

### Hitos Importantes

- **1961**: Primera patente de circuito integrado
- **1964**: IBM System/360 - Primera familia de ordenadores compatible
- **1965**: Gordon Moore publica su famosa "Ley"

**Dato curioso**: El primer circuito integrado de Jack Kilby contenía solo 1 transistor, 3 resistencias y 1 condensador. Hoy, un chip moderno puede tener más de 50 mil millones de transistores.

---

## Tercera Generación: Microprocesadores (1965-1980)

### El Nacimiento del Microprocesador

El **Intel 4004**, lanzado en **1971**, fue el primer microprocesador comercial del mundo.

#### Especificaciones del Intel 4004:
- **Transistores**: 2,300
- **Velocidad**: 740 KHz
- **Proceso**: 10 µm (micrómetros)
- **Bits**: 4 bits
- **Precio**: $200

### Evolución de los Primeros Microprocesadores

| Año  | Procesador    | Transistores | Velocidad | Bits |
|------|---------------|--------------|-----------|------|
| 1971 | Intel 4004    | 2,300        | 740 KHz   | 4    |
| 1972 | Intel 8008    | 3,500        | 800 KHz   | 8    |
| 1974 | Intel 8080    | 6,000        | 2 MHz     | 8    |
| 1978 | Intel 8086    | 29,000       | 5 MHz     | 16   |
| 1979 | Intel 8088    | 29,000       | 5 MHz     | 16   |
| 1982 | Intel 80286   | 134,000      | 6 MHz     | 16   |

### Ordenadores Personales

- **1975**: Altair 8800 (primer PC kit)
- **1977**: Apple II, Commodore PET, TRS-80
- **1981**: IBM PC (con Intel 8088)
- **1984**: Macintosh de Apple

**Dato curioso**: El Apollo Guidance Computer que llevó al hombre a la Luna en 1969 tenía solo 2 MHz de velocidad y 4 KB de RAM. Un cargador de móvil moderno tiene más potencia de cómputo.

---

## La Ley de Moore

### ¿Qué dice la Ley de Moore?

En 1965, **Gordon Moore** (cofundador de Intel) predijo que:

> "El número de transistores en un circuito integrado se duplicará aproximadamente cada dos años"

### Implicaciones

Esta ley no solo predijo el crecimiento de transistores, sino también:
- **Duplicación de rendimiento** cada ~18-24 meses
- **Reducción de costes** por transistor
- **Aumento de eficiencia energética**

### Ejemplos de la Ley de Moore en Acción

| Año  | Procesador        | Transistores    | Proceso    |
|------|-------------------|-----------------|------------|
| 1971 | Intel 4004        | 2,300           | 10 µm      |
| 1978 | Intel 8086        | 29,000          | 3 µm       |
| 1985 | Intel 80386       | 275,000         | 1.5 µm     |
| 1993 | Intel Pentium     | 3,100,000       | 800 nm     |
| 2000 | Intel Pentium 4   | 42,000,000      | 180 nm     |
| 2006 | Intel Core 2 Duo  | 291,000,000     | 65 nm      |
| 2010 | Intel Core i7     | 1,170,000,000   | 32 nm      |
| 2017 | Intel Core i9     | 7,200,000,000   | 14 nm      |
| 2023 | Apple M3          | 25,000,000,000  | 3 nm       |
| 2026 | Apple M4 Pro      | 40,000,000,000  | 2 nm       |
| 2026 | Intel Arrow Lake  | 32,000,000,000  | 1.8 nm     |
| 2026 | TSMC N2 (2nm)     | 45,000,000,000+ | 2 nm       |

**Nota**: La Ley de Moore ha comenzado a desacelerar en los últimos años debido a límites físicos fundamentales. Sin embargo, en 2026 hemos visto la llegada de la tecnología de 2nm y sub-2nm, con transistores más pequeños que algunos virus.

---

## Cuarta Generación: RISC y Optimización (1980-2000)

### RISC vs CISC

#### CISC (Complex Instruction Set Computing)
- **Instrucciones complejas**: Una instrucción puede hacer múltiples operaciones
- **Ejemplo**: Intel x86
- **Ventaja**: Menos instrucciones en el código
- **Desventaja**: Instrucciones más lentas

#### RISC (Reduced Instruction Set Computing)
- **Instrucciones simples**: Cada instrucción hace una operación básica
- **Inventado**: 1980 por David Patterson (Berkeley) y John Hennessy (Stanford)
- **Ventaja**: Ejecución más rápida de instrucciones
- **Ejemplo**: ARM, MIPS, PowerPC

### Innovaciones de esta Época

1. **Pipeline**: Ejecución de múltiples instrucciones simultáneamente en diferentes etapas
2. **Caché**: Memoria rápida cerca del procesador
   - L1 Cache: ~KB, 1-2 ciclos
   - L2 Cache: ~MB, 10-20 ciclos
   - L3 Cache: ~MB-decenas MB, 40-75 ciclos
3. **Superescalar**: Múltiples unidades de ejecución
4. **Predicción de saltos**: Adivinar qué ruta tomará el programa

### Procesadores Destacados

- **1985**: Intel 80386 (primer x86 de 32 bits)
- **1993**: Intel Pentium (arquitectura superescalar)
- **1995**: Intel Pentium Pro (ejecución fuera de orden)
- **ARM6** (1991): Base de los procesadores móviles modernos

**Dato curioso**: El procesador Intel Pentium de 1993 podía ejecutar hasta 2 instrucciones por ciclo, mientras que los procesadores modernos pueden ejecutar 4-6 instrucciones por ciclo.

---

## El Nacimiento de Internet

### Los Orígenes: ARPANET

- **1969**: ARPANET conecta 4 universidades estadounidenses
- **1971**: Primera implementación de email
- **1973**: Protocolo TCP/IP diseñado por Vint Cerf y Bob Kahn
- **1983**: ARPANET adopta TCP/IP (nacimiento oficial de Internet)

### La World Wide Web

- **1989**: Tim Berners-Lee inventa la World Wide Web en el CERN
- **1991**: Primer sitio web publicado
- **1993**: Navegador Mosaic hace la web accesible al público
- **1995**: Explosión comercial de Internet

### Crecimiento de Internet

| Año  | Usuarios de Internet | % Población Mundial |
|------|---------------------|---------------------|
| 1995 | 16 millones         | 0.4%                |
| 2000 | 361 millones        | 5.8%                |
| 2005 | 1,018 millones      | 15.7%               |
| 2010 | 1,971 millones      | 28.7%               |
| 2015 | 3,185 millones      | 43.4%               |
| 2020 | 4,574 millones      | 59.5%               |
| 2025 | ~5,500 millones     | ~67%                |

**Dato curioso**: En 1995, una conexión dial-up de 56 Kbps era considerada rápida. Hoy, las conexiones de fibra óptica pueden alcanzar 10 Gbps, ¡178,571 veces más rápido!

---

## Quinta Generación: Era Multinúcleo (2000-2010)

### El Fin de la Escalada de Frecuencia

Alrededor de 2004, las frecuencias de reloj dejaron de crecer debido a:
- **Problema de calor**: Más frecuencia = más calor
- **Límites de potencia**: Consumo energético insostenible
- **Fugas de corriente**: A menor tamaño, más fugas

### La Solución: Múltiples Núcleos

En lugar de hacer un núcleo más rápido, se pusieron varios núcleos en un chip.

| Año  | Procesador            | Núcleos | Frecuencia |
|------|-----------------------|---------|------------|
| 2005 | Intel Pentium D       | 2       | 2.8 GHz    |
| 2006 | Intel Core 2 Duo      | 2       | 2.4 GHz    |
| 2008 | Intel Core 2 Quad     | 4       | 2.4 GHz    |
| 2010 | Intel Core i7-980X    | 6       | 3.33 GHz   |
| 2017 | AMD Ryzen Threadripper| 16      | 3.4 GHz    |
| 2019 | AMD Ryzen Threadripper| 64      | 2.9 GHz    |
| 2023 | AMD Ryzen Threadripper| 96      | 3.7 GHz    |
| 2026 | AMD EPYC Turin        | 192     | 3.5 GHz    |
| 2026 | Intel Xeon 6 "Granite"| 144     | 3.2 GHz    |

**Récord 2026**: El AMD EPYC "Turin" alcanza **192 núcleos** en un solo socket, duplicando la capacidad de procesamiento paralelo de hace solo 3 años.

### Proyección: El Camino hacia los 512-1024 Cores

Basado en las tendencias actuales y roadmaps de fabricantes:

| Año Proyectado | Cores Esperados | Generación               | Notas                          |
|----------------|-----------------|--------------------------|--------------------------------|
| 2026           | 192             | AMD EPYC Turin           | ✅ Actual                      |
| 2027-2028      | 256-320         | AMD EPYC "Venice"        | Proyectado                     |
| 2029-2030      | 384-512         | Próxima generación       | Tecnología 1nm o inferior      |
| 2032-2034      | 768-1024        | Futura generación        | Posible cambio arquitectónico  |

**Factores que acelerarían la llegada:**
- ✅ Chiplets 3D más eficientes (ya en desarrollo)
- ✅ Mejoras en interconexiones (CXL, UCIe)
- ✅ Refrigeración avanzada
- ⏳ Nuevos materiales (grafeno, nanotubos de carbono)

**Desafíos para alcanzar 1024 cores:**
1. **Consumo energético**: Un chip de 1024 cores podría necesitar 500-1000W
2. **Coherencia de caché**: Mantener sincronización entre tantos cores
3. **Interconexión**: Ancho de banda y latencia entre cores
4. **Software**: Pocas aplicaciones pueden paralelizar tanto
5. **Coste de fabricación**: Complejidad y rendimiento del proceso

**Alternativas ya existentes:**
- Procesadores de muchos cores simples (como GPUs: 10,000+ cores)
- Sistemas multi-socket (4x192 = 768 cores disponibles hoy)
- Aceleradores especializados (TPUs, IPUs)

**Predicción**: Los **512 cores** llegarán probablemente entre **2029-2030**, mientras que **1024 cores en CPU de propósito general** podrían alcanzarse entre **2032-2034**, asumiendo que la Ley de Moore continúe aunque desacelerada.

### Desafío: Programación Paralela

Los programas debían ser reescritos para aprovechar múltiples núcleos:
- **Threading**: División de tareas en hilos
- **Programación concurrente**: Sincronización y coordinación
- **Amdahl's Law**: Límite teórico de aceleración paralela

**Dato curioso**: El superordenador más potente del mundo en 2023, Frontier, tiene 9,248,256 núcleos de CPU y puede realizar 1.194 exaFLOPS (1,194,000,000,000,000,000 operaciones por segundo).

---

## Sexta Generación: GPUs y Computación Paralela Masiva (2006-presente)

### ¿Qué es una GPU?

**GPU (Graphics Processing Unit)**: Originalmente diseñada para renderizar gráficos 3D, pero perfecta para cálculos paralelos masivos.

### CPU vs GPU

| Característica | CPU                    | GPU                      |
|----------------|------------------------|--------------------------|
| Núcleos        | 4-128 (típicamente)    | 1,000-10,000+            |
| Frecuencia     | 2-5 GHz                | 1-2 GHz                  |
| Arquitectura   | Pocos núcleos potentes | Muchos núcleos simples   |
| Ideal para     | Tareas secuenciales    | Tareas paralelas masivas |

### CUDA y GPGPU

- **2006**: NVIDIA lanza CUDA (Compute Unified Device Architecture)
- **GPGPU**: General-Purpose computing on GPU
- Aplicaciones: IA, machine learning, simulación científica, minería de criptomonedas

### GPUs Destacadas

| Año  | GPU                  | Núcleos CUDA | Rendimiento   |
|------|----------------------|--------------|---------------|
| 2006 | NVIDIA GeForce 8800  | 128          | 345 GFLOPS    |
| 2012 | NVIDIA GTX 680       | 1,536        | 3.1 TFLOPS    |
| 2018 | NVIDIA RTX 2080 Ti   | 4,352        | 13.4 TFLOPS   |
| 2020 | NVIDIA A100          | 6,912        | 156 TFLOPS    |
| 2023 | NVIDIA H100          | 16,896       | 378 TFLOPS    |
| 2026 | NVIDIA B100          | 24,576       | 600+ TFLOPS   |
| 2026 | AMD Instinct MI400   | 28,672       | 550 TFLOPS    |

**Dato curioso**: La GPU NVIDIA H100 puede realizar en 1 segundo lo que la primera GPU comercial tardaría más de 3 años en completar.

### Récords de Transistores en 2026

Los chips más grandes del mundo en 2026 por número de transistores:

| Chip                          | Tipo              | Transistores        | Aplicación          |
|-------------------------------|-------------------|---------------------|---------------------|
| **Cerebras CS-3 WSE-3**       | Acelerador IA     | **4 billones**      | Entrenamiento IA    |
| **Apple M4 Ultra**            | SoC               | **200 mil millones**| Workstations        |
| **NVIDIA B100**               | GPU datacenter    | **180 mil millones**| IA y HPC            |
| **AMD Instinct MI400**        | GPU datacenter    | **170 mil millones**| Computación científica |
| **Intel Falcon Shores**       | GPU datacenter    | **165 mil millones**| IA y simulación     |
| **AMD EPYC Turin**            | CPU servidor      | **150 mil millones**| Servidores          |

**Récord absoluto**: El **Cerebras Wafer-Scale Engine 3 (WSE-3)** mantiene el récord con **4 billones de transistores** (4,000,000,000,000), ocupando un wafer completo de silicio de 21cm x 21cm. Este chip es 60 veces más grande que la GPU más grande de NVIDIA.

#### Características del Cerebras WSE-3:
- **Superficie**: ~46,225 mm² (un wafer completo)
- **Transistores**: 4 billones
- **Cores**: 900,000 núcleos de IA
- **Memoria on-chip**: 44 GB de SRAM
- **Ancho de banda interno**: 21 Petabytes/segundo
- **Proceso**: 5nm TSMC
- **Potencia**: ~23 kW (requiere refrigeración líquida especializada)

**Comparación impactante**: El WSE-3 tiene más transistores que:
- 100 GPUs H100 combinadas
- 500 procesadores Apple M4 Pro juntos
- Todos los chips fabricados en el mundo en 1995 sumados

---

## Séptima Generación: Inteligencia Artificial (2010-presente)

### El Renacimiento de la IA

Tres factores clave permitieron el auge moderno de la IA:
1. **Datos masivos**: Internet generó cantidades ingentes de datos
2. **Potencia de cómputo**: GPUs permitieron entrenar redes neuronales grandes
3. **Algoritmos mejorados**: Deep Learning y redes neuronales profundas

### Hitos de la IA

| Año  | Evento                                    | Importancia                    |
|------|-------------------------------------------|--------------------------------|
| 2012 | AlexNet gana ImageNet                     | Inicio del Deep Learning boom  |
| 2016 | AlphaGo vence al campeón de Go            | IA supera humanos en juego complejo |
| 2017 | Transformers (arquitectura)               | Base de ChatGPT y LLMs         |
| 2018 | BERT (Google)                             | Comprensión del lenguaje natural |
| 2020 | GPT-3 (OpenAI)                            | 175 mil millones de parámetros |
| 2022 | ChatGPT lanzado                           | IA conversacional mainstream   |
| 2023 | GPT-4                                     | Multimodal (texto e imágenes)  |

### Hardware Especializado para IA

- **TPUs** (Tensor Processing Units) de Google
- **NPUs** (Neural Processing Units) en smartphones
- **Chips de Apple Silicon**: Neural Engine
- **Intel Gaudi**: Aceleradores de IA

### Modelos Gigantes

| Modelo      | Año  | Parámetros          | Entrenamiento (GPU-horas) |
|-------------|------|---------------------|---------------------------|
| GPT-2       | 2019 | 1.5 mil millones    | ~5,000                    |
| GPT-3       | 2020 | 175 mil millones    | ~3,640,000                |
| GPT-4       | 2023 | ~1 billón (estimado)| ~Millones                 |
| PaLM        | 2022 | 540 mil millones    | ~2,500,000                |

**Dato curioso**: Entrenar GPT-3 desde cero costaría aproximadamente 4.6 millones de dólares solo en cómputo en la nube.

---

## El Futuro: Computación Cuántica

### ¿Qué es un Ordenador Cuántico?

Los ordenadores clásicos usan **bits** (0 o 1). Los ordenadores cuánticos usan **qubits** que pueden estar en:
- Estado 0
- Estado 1
- **Superposición**: Ambos estados simultáneamente

### Propiedades Cuánticas Clave

1. **Superposición**: Un qubit puede ser 0 y 1 a la vez
2. **Entrelazamiento**: Qubits conectados cuánticamente
3. **Interferencia cuántica**: Amplificar respuestas correctas

### Potencia Exponencial

- **2 qubits**: 4 estados simultáneos
- **3 qubits**: 8 estados simultáneos
- **n qubits**: 2^n estados simultáneos
- **300 qubits**: Más estados que átomos en el universo observable

### Ordenadores Cuánticos Actuales

| Año  | Sistema              | Empresa | Qubits | Tipo              |
|------|----------------------|---------|--------|-------------------|
| 2019 | Sycamore             | Google  | 53     | Superconductor    |
| 2021 | Zuchongzhi           | China   | 66     | Superconductor    |
| 2022 | Osprey               | IBM     | 433    | Superconductor    |
| 2023 | Condor               | IBM     | 1,121  | Superconductor    |
| 2024 | Willow               | Google  | 105    | Superconductor    |

### Supremacía Cuántica

- **2019**: Google afirma lograr la "supremacía cuántica"
  - Sycamore resolvió en 200 segundos lo que a un superordenador le tomaría 10,000 años
  - (Nota: IBM disputó esta afirmación)

### Aplicaciones Potenciales

- **Criptografía**: Romper cifrados actuales (y crear nuevos seguros cuánticamente)
- **Descubrimiento de fármacos**: Simulación molecular
- **Optimización**: Logística, finanzas, tráfico
- **Inteligencia Artificial**: Algoritmos de ML cuánticos
- **Simulación cuántica**: Física de materiales

### Desafíos Actuales

1. **Decoherencia**: Los qubits pierden su estado cuántico rápidamente
2. **Corrección de errores**: Se necesitan muchos qubits físicos por qubit lógico
3. **Temperatura**: Operan cerca del cero absoluto (-273°C)
4. **Escalabilidad**: Difícil aumentar el número de qubits

**Dato curioso**: Los ordenadores cuánticos actuales operan a 0.015 Kelvin, ¡más frío que el espacio exterior!

---

## Evolución de Potencia y Memoria: Datos Curiosos

### Crecimiento de la Potencia de Cómputo

| Sistema                | Año  | Rendimiento         | Precio          |
|------------------------|------|---------------------|-----------------|
| ENIAC                  | 1945 | 5,000 ops/seg       | $6,000,000 (hoy)|
| IBM 650                | 1954 | 1,500 ops/seg       | $500,000        |
| IBM 7094               | 1962 | 250,000 ops/seg     | $2,000,000      |
| VAX-11/780             | 1977 | 1 MIPS              | $120,000        |
| Intel 486DX2           | 1992 | 54 MIPS             | $500            |
| Pentium 4              | 2000 | 9,000 MIPS          | $300            |
| Core i7-8700K          | 2017 | 300,000 MIPS        | $350            |
| Apple M2 Ultra         | 2023 | ~2,000,000 MIPS     | $4,000          |
| Apple M4 Pro           | 2026 | ~3,500,000 MIPS     | $2,200          |
| Intel Core Ultra 9     | 2026 | ~2,800,000 MIPS     | $650            |

### Evolución de la Memoria RAM

| Año  | Tecnología        | Capacidad Típica | Coste/MB      |
|------|-------------------|------------------|---------------|
| 1970 | Core magnético    | 4 KB             | $1,000        |
| 1980 | DRAM              | 64 KB            | $100          |
| 1990 | DRAM              | 1 MB             | $50           |
| 2000 | SDRAM             | 128 MB           | $1            |
| 2010 | DDR3              | 4 GB             | $0.01         |
| 2020 | DDR4              | 16 GB            | $0.002        |
| 2025 | DDR5              | 64 GB            | $0.001        |

**Reducción de coste**: De $1,000 por MB en 1970 a $0.001 en 2025 = ¡1,000,000 veces más barato!

### Almacenamiento

| Año  | Tecnología | Capacidad | Coste/GB | Tamaño Físico      |
|------|-----------|-----------|----------|--------------------|
| 1956 | IBM 305   | 5 MB      | $200,000 | Armario entero     |
| 1980 | HDD       | 5 MB      | $3,000   | Tamaño de lavadora |
| 1991 | HDD       | 100 MB    | $1,000   | 3.5 pulgadas       |
| 2000 | HDD       | 20 GB     | $10      | 3.5 pulgadas       |
| 2010 | HDD       | 1 TB      | $0.10    | 3.5 pulgadas       |
| 2020 | SSD       | 1 TB      | $0.10    | Tamaño de chicle   |
| 2025 | SSD       | 8 TB      | $0.03    | Tamaño de chicle   |

### Velocidad de Transferencia

| Año  | Tecnología       | Velocidad          |
|------|------------------|--------------------|
| 1980 | Disquete 5.25"   | 250 Kbps           |
| 1990 | HDD IDE          | 16 Mbps            |
| 2000 | USB 2.0          | 480 Mbps           |
| 2010 | SATA III         | 6 Gbps             |
| 2020 | NVMe Gen4        | 64 Gbps            |
| 2025 | PCIe 5.0 NVMe    | 128 Gbps           |

### Comparaciones Impactantes

**Si el Boeing 747 hubiera mejorado como los ordenadores desde 1971:**
- Velocidad: 1,240,000 km/h (vs 988 km/h)
- Coste del billete: $0.01 (vs $1,000+)
- Consumo de combustible: 4 litros por 10,000 km

**Potencia de cómputo:**
- iPhone 15 Pro (2023) ≈ 100,000 veces más potente que todas las computadoras de la misión Apollo 11 juntas
- PlayStation 5 > todos los superordenadores del mundo combinados en 1995

**Precio por operación:**
- En 1961: $1 por 1,000 operaciones
- En 2023: $1 por 10,000,000,000,000,000 operaciones

### Avances en 2026: La Era de los 2nm

En 2026, la industria de semiconductores ha alcanzado un hito histórico con la producción en masa de chips de **2nm y sub-2nm**:

#### Procesadores Destacados de 2026

**Apple M4 Series (2nm)**
- **Proceso**: TSMC N2 (2 nanómetros)
- **M4 Pro**: 40 mil millones de transistores
- **M4 Ultra**: 200 mil millones de transistores (récord para SoC de consumo)
- **Eficiencia**: 30% menos consumo vs generación anterior
- **Rendimiento**: +20% en single-core, +35% en multi-core
- **Aplicación**: MacBook Pro, Mac Studio, iPad Pro
- **Nota**: El M4 Ultra usa dos chips M4 Max conectados con tecnología UltraFusion

**Intel Arrow Lake (1.8nm)**
- **Proceso**: Intel 18A (1.8 nanómetros)
- **Transistores**: ~32 mil millones
- **Arquitectura**: Híbrida con P-cores y E-cores mejorados
- **Tecnología RibbonFET**: Primeros transistores GAA (Gate-All-Around) en producción masiva
- **PowerVia**: Entrega de energía por la parte trasera del chip

**AMD Zen 6 "Morpheus" (2nm)**
- **Proceso**: TSMC N2
- **Núcleos**: Hasta 128 núcleos en versión Threadripper
- **Caché**: 3D V-Cache de 4ª generación
- **Mejora**: +25% rendimiento por vatio vs Zen 5

**Qualcomm Snapdragon 8 Gen 4 (2nm)**
- **Proceso**: TSMC N2
- **Aplicación**: Smartphones y tablets premium
- **NPU**: 75 TOPS para IA en dispositivo
- **Modem**: Soporte 6G experimental

#### Innovaciones Tecnológicas de 2026

1. **Transistores GAA (Gate-All-Around)**
   - Reemplazan a los FinFET tradicionales
   - Mejor control del canal
   - Reducción de fugas de corriente en 40%

2. **Backside Power Delivery**
   - Energía entregada por la parte trasera del chip
   - Mejora en densidad y eficiencia
   - Reduce interferencias

3. **Chiplets 3D Avanzados**
   - Apilamiento vertical con conexiones TSV (Through-Silicon Via)
   - Comunicación ultra-rápida entre dies
   - Permite mezclar procesos (2nm + 3nm)

4. **Fotolitografía EUV de Alta NA**
   - Luz ultravioleta extrema con mayor apertura numérica
   - Permite características más pequeñas
   - Clave para alcanzar sub-2nm

#### Desafíos Superados y Pendientes

**Superados en 2026:**
- ✅ Producción en masa de 2nm
- ✅ Transistores GAA funcionales
- ✅ Gestión térmica en alta densidad
- ✅ Rendimiento energético mejorado

**Pendientes:**
- ⏳ Escalado más allá de 1nm (límites atómicos)
- ⏳ Coste por transistor deja de bajar
- ⏳ Complejidad de fabricación aumenta exponencialmente
- ⏳ Alternativas post-silicio (grafeno, nanotubos de carbono)

**Récords mundiales de 2026:**
- **Más transistores en un chip**: Cerebras WSE-3 con 4 billones
- **Más cores CPU en consumo**: AMD Ryzen Threadripper con 96 cores
- **Más cores CPU en servidor**: AMD EPYC Turin con 192 cores
- **SoC más grande**: Apple M4 Ultra con 200 mil millones de transistores
- **GPU más potente**: NVIDIA B100 con 600+ TFLOPS

**Dato curioso de 2026**: Un procesador de 2nm tiene transistores con dimensiones de aproximadamente 10 átomos de silicio de ancho. Para comparar, un cabello humano es ~40,000 veces más grueso que un transistor de 2nm. Si un transistor de 2nm fuera del tamaño de una hormiga, un cabello humano sería una torre de 40 metros de altura.

#### Comparación de Densidad de Transistores

| Tecnología | Año  | Transistores/mm² | Mejora vs Anterior |
|------------|------|------------------|--------------------|
| 10 nm      | 2017 | ~100 millones    | -                  |
| 7 nm       | 2018 | ~200 millones    | 2x                 |
| 5 nm       | 2020 | ~300 millones    | 1.5x               |
| 3 nm       | 2022 | ~500 millones    | 1.67x              |
| 2 nm       | 2026 | ~750 millones    | 1.5x               |
| 1.8 nm     | 2026 | ~850 millones    | 1.13x              |

**El límite físico**: Los expertos predicen que el silicio alcanzará su límite físico entre 1nm y 0.5nm (alrededor de 2027-2029), momento en el cual será necesario cambiar a nuevos materiales o paradigmas de computación completamente diferentes.

---

## Reflexión Final

En solo 81 años, hemos pasado de:
- **ENIAC** (1945): 27 toneladas, 17,468 válvulas, 5,000 operaciones/segundo
- **Tu smartphone** (2026): 180 gramos, 40 mil millones de transistores, 8,000,000,000,000 operaciones/segundo

La evolución continúa acelerándose. La computación cuántica, la IA y nuevas tecnologías que aún no podemos imaginar darán forma al futuro de la informática en las próximas décadas.

Como dijo Gordon Moore: *"Si el sector del automóvil hubiera avanzado como el de los semiconductores, hoy un Rolls Royce costaría 3 dólares y haría un millón de kilómetros con un litro de gasolina."*

---

## Referencias y Recursos Adicionales

- Computer History Museum: https://computerhistory.org/
- Intel - Moore's Law: https://www.intel.com/content/www/us/en/history/museum-gordon-moore-law.html
- IBM Archives: https://www.ibm.com/ibm/history/
- Timeline of Computer History: https://www.computerhistory.org/timeline/
- Quantum Computing Report: https://quantumcomputingreport.com/
