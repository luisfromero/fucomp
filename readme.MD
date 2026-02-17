# Fundamentos de Computadores

Este repositorio es el punto de entrada a la asignatura **Fundamentos de Computadores** de la Escuela de Ingenierías Industriales de la Universidad de Málaga. Aquí encontrarás todos los materiales docentes, aplicaciones interactivas, prácticas y recursos necesarios para el desarrollo de la asignatura.

## Descripción de la Asignatura

Fundamentos de Computadores es una asignatura de primer curso que introduce a los estudiantes en los principios básicos de la arquitectura de computadores, la representación de información, el diseño de circuitos digitales y la programación a bajo nivel. La asignatura combina teoría con prácticas hands-on utilizando herramientas interactivas y hardware real.

### Contenidos Principales

La asignatura se estructura en **6 temas teóricos** que cubren:

- **Tema 1**: Historia de la computación y fundamentos
- **Tema 2**: Representación de la información (sistemas numéricos, punto flotante, códigos alfanuméricos)
- **Tema 3**: Arquitectura del procesador y camino de datos
- **Tema 4**: Memoria y jerarquía de memoria (caché, memoria virtual)
- **Tema 5**: Sistemas de entrada/salida e interrupciones
- **Tema 6**: Rendimiento y optimización de sistemas

Además, incluye **5 prácticas de laboratorio** que permiten aplicar los conocimientos teóricos mediante programación en ensamblador y trabajo con microcontroladores ESP32-C3 (arquitectura RISC-V).

**Los powerpoints de la asignatura están en la carpeta [temas](temas)**.

## ¿Por qué GitHub?

La elección de esta plataforma, frente al campus virtual tradicional, responde a varios criterios pedagógicos y técnicos:

1. **Dinamismo**: Los cambios realizados en los archivos se reflejan automáticamente en la plataforma, garantizando contenidos siempre actualizados.
2. **Modernización**: Los estudiantes se familiarizan con sistemas de control de versiones (Git), herramientas fundamentales en el desarrollo profesional de software.
3. **Facilidad de acceso**: Al ser un proyecto público, no requiere autenticación. Acceso inmediato a todos los contenidos, sin barreras.
4. **Markdown**: Formato moderno y estándar para documentación, compatible con múltiples herramientas (Jupyter, IDEs, IAs generativas, WhatsApp, etc.).
5. **Transparencia**: Todo el sistema de docencia y evaluación es públicamente accesible, fomentando la apertura académica.
6. **Integración con herramientas profesionales**: Conexión directa con VS Code, GitHub Copilot y otras herramientas de desarrollo modernas.

## Estructura del Repositorio

### Aplicaciones Interactivas (`/apps`)

Colección de más de 20 aplicaciones educativas interactivas desarrolladas específicamente para la asignatura. Estas herramientas permiten visualizar y experimentar con conceptos fundamentales:

- **Circuitos digitales**: `puertas/`, `multiplexor/`, `sumadorrestador/`, `biestable/`
- **Procesador**: `simpleCPU/`, `PCyMemInstrucciones/`, `siguientePC/`, `mipssim/`
- **Memoria**: `ram/`, `dram/`, `memdatos/`, `cachecalc/`, `cachecalc2/`, `entrelazada/`, `virtual/`
- **Aritmética**: `complementoa/`, `comaflotante/`, `ieee754/`, `alfanum/`
- **Avanzadas**: `predictor/` (predicción de saltos), `btb/` (Branch Target Buffer), `interrupciones/`, `retrasosCPU/`
- **Registros**: `bancoderegistros/`, `simpleregistro/`
- **Otros**: `quantums/`, `processxp/`, `sharksCovid/`, `sharksCvarios/`

Todas las aplicaciones están disponibles en formato ejecutable (`.exe`) y comprimido (`.zip`) para Windows.

### Lecciones y Materiales Teóricos

- **`Lección 1`**: Historia de la computación, evolución de los computadores
- **`Lección 2`**: Actividades sobre circuitos digitales y arquitectura básica
- **`Lección 3`**: Representación de información (sistemas de numeración, complemento, punto flotante)
- **`Lección 4`**: Codificación de caracteres (UTF-8, BOM)
- **ToDo...**

### Prácticas de Laboratorio

- **`/Practica5`**: Programación en ensamblador RISC-V con ESP32-C3. Implementación de secuencias LED utilizando Memory-Mapped I/O, desplazamientos de bits y control de flujo.

### Notebooks Jupyter (`/jupyter`)

Cuadernos interactivos de Python para:
- Introducción a Python (`intro_python.ipynb`)
- Programación estructurada vs POO
- Representación de información
- Computación cuántica (introducción)

### Recursos Adicionales (`/recursos`)

Materiales complementarios, presentaciones y documentación de referencia sobre RISC-V y otros temas de la asignatura.

## Evaluación

[Este documento](evaluacion.md) describe el sistema completo de evaluación de la asignatura, incluyendo la distribución de pesos entre teoría (70%) y práctica (30%), el sistema de evaluación continua y el funcionamiento del sistema CASIUM de exámenes automáticos.

## Enlaces de Interés

### Plataformas Docentes

* [Campus virtual 2026](https://eii.cv.uma.es/course/view.php?id=5927) - Espacio oficial en la plataforma Moodle
* [Tutorías online](https://meet.google.com/pyt-desz-dzn) - Sala de videoconferencia para tutorías
* [Calendario lectivo grupo A](https://casium.uma.es/calendario?A)
* [Calendario lectivo grupo B](https://casium.uma.es/calendario?B)
* [CASIUM - Herramienta de docencia y evaluación](http://casium.uma.es) - Sistema de exámenes automáticos desarrollado por el equipo docente

### Herramientas de Desarrollo

Para trabajar con los materiales de la asignatura se recomienda:

- **VS Code**: Editor recomendado con integración Git
- **Python 3.x**: Para ejecutar los notebooks Jupyter
- **PlatformIO**: Para las prácticas con ESP32-C3
- **GitHub Desktop**: Cliente Git para gestión de versiones (opcional)

## Recursos de Aprendizaje

### Videotutoriales

* [Instalación de Python en Windows](https://www.youtube.com/watch?v=A85ns1sTnQU/edit) - Guía paso a paso

### Lecturas Recomendadas

**Historia de la Computación**
* [John Von Neumann y la revolución informática - National Geographic](https://www.nationalgeographic.com.es/ciencia/como-john-von-neumann-revoluciono-la-informatica_21580)
* [John Von Neumann - Muy Interesante](https://www.muyinteresante.es/ciencia/59360.html)
* [Las programadoras del ENIAC - BBC](https://www.bbc.com/mundo/noticias-64575963)
* [Mecanismo de Antikythera - National Geographic](https://historia.nationalgeographic.com.es/a/mecanismo-antiquitera-reune-saber-astronomico-y-astrologico-epoca_10476)
* [Historia de ARPANET - BBC](https://www.bbc.com/mundo/noticias-50074166)
* [La otra máquina de Von Neumann](https://www.youtube.com/watch?v=Rpy9Qp7NAaw) - Autómatas celulares

**Inteligencia Artificial**
* [Documento sobre ChatGPT](/img/chatgpt.pdf) - Impacto de las IAs generativas

### Cursos Complementarios

* [Curso de introducción a Python con Jupyter](https://github.com/andelpe/curso-intro-python) - Por Andrés Delgado

## Instalación del Entorno Python

Para trabajar con los notebooks Jupyter incluidos en el repositorio:

```bash
# Instalar Jupyter Notebook
pip install notebook

# Ejecutar Jupyter
python -m notebook
```

El servidor Jupyter se abrirá en el navegador web mostrando el árbol de directorios. Navega hasta la carpeta `/jupyter` para acceder a los cuadernos interactivos.

Alternativamente, puedes usar **Jupyter Lab** (interfaz más moderna):

```bash
pip install jupyterlab
python -m jupyterlab
```

## Notas Importantes

- Todas las aplicaciones en `/apps` están compiladas para Windows. Los archivos fuente no están incluidos en este repositorio público.
- Las prácticas con ESP32-C3 requieren el entorno PlatformIO configurado correctamente.
- Para cualquier duda sobre el contenido o problemas técnicos, utiliza las tutorías online o consulta en el campus virtual.

## Licencia y Uso

Este material docente es de uso académico para los estudiantes de la asignatura Fundamentos de Computadores de la Universidad de Málaga. La redistribución o uso comercial de las aplicaciones y materiales requiere autorización expresa del equipo docente.

---

**Universidad de Málaga** | **Escuela de Ingenierías Industriales** | Curso 2025-2026
