# 🔧 Preparación del Entorno para Práctica 5

> Guía de instalación y configuración del entorno de desarrollo para la Práctica 5 con ESP32-C3

---

## 📝 Introducción

Esta guía te ayudará a configurar tu ordenador personal para trabajar con microcontroladores ESP32-C3 usando RISC-V. El entorno está basado en **Visual Studio Code**, un editor de texto ligero y potente que, mediante extensiones, se convierte en un completo entorno de desarrollo.

---

## 🖥️ 1. Visual Studio Code

### ¿Qué es VSCode?

**Visual Studio Code (VSCode)** es, en esencia, un **editor de texto plano** moderno y ligero. A diferencia de los IDEs pesados, VSCode:
- ✅ Arranca rápidamente
- ✅ Consume pocos recursos
- ✅ Es altamente personalizable mediante extensiones
- ✅ Es gratuito y multiplataforma (Windows, Linux, macOS)

**Importante**: VSCode por sí solo es solo un editor. Las funcionalidades avanzadas (compilación, depuración, etc.) se añaden mediante extensiones.

### Instalación

1. **Descargar**: Visita [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. **Ejecutar**: Instala el archivo descargado
3. **Opciones recomendadas durante la instalación**:
   - ✅ Agregar "Abrir con Code" al menú contextual
   - ✅ Agregar a PATH (para usar `code` desde terminal)
   - ✅ Registrar Code como editor predeterminado para tipos de archivo compatibles

4. **Primer inicio**: Al abrir VSCode por primera vez, puedes elegir el idioma (español disponible)

---

## 🔌 2. Extensiones Necesarias

### PlatformIO IDE (OBLIGATORIO)

**PlatformIO** es la extensión que convierte VSCode en un IDE completo para desarrollo embebido.

#### Instalación:
1. Abre VSCode
2. Ve a la vista de Extensiones (Ctrl+Shift+X o clic en el icono de cuadrados)
3. Busca: `PlatformIO IDE`
4. Haz clic en **Install**
5. **Espera**: La primera instalación puede tardar varios minutos (descarga compiladores, herramientas, etc.)
6. **Reinicia** VSCode cuando se complete

#### ¿Qué proporciona?
- Gestión automática de compiladores y herramientas
- Soporte para múltiples placas (ESP32, Arduino, STM32, etc.)
- Compilación y carga de firmware
- Monitor serie integrado
- Gestión de librerías

---

## 🎯 3. Extensiones Recomendadas

Estas extensiones mejoran significativamente la experiencia de desarrollo:

### C/C++ (Microsoft)
- **Nombre**: `C/C++`
- **Publisher**: Microsoft
- **Función**: IntelliSense, depuración y navegación de código C/C++
- **Por qué**: Mejor autocompletado y detección de errores

### RISC-V Support
- **Nombre**: `RISC-V Support`
- **Buscar**: `riscv` o `RISC-V`
- **Función**: Resaltado de sintaxis para ensamblador RISC-V
- **Por qué**: Esencial para los archivos `.S` de la práctica

### Error Lens
- **Nombre**: `Error Lens`
- **Publisher**: Alexander
- **Función**: Muestra errores y warnings directamente en la línea de código
- **Por qué**: Detecta problemas inmediatamente sin necesidad de ir al panel de problemas

### Hex Editor
- **Nombre**: `Hex Editor`
- **Publisher**: Microsoft
- **Función**: Editor hexadecimal para archivos binarios
- **Por qué**: Útil para inspeccionar archivos compilados (.bin, .elf)

#### Instalación rápida:
1. Abre la paleta de comandos (Ctrl+Shift+P)
2. Escribe: `Extensions: Install Extensions`
3. Busca cada extensión e instálala

---

## 🤖 4. Asistentes de IA (OPCIONAL pero MUY RECOMENDADO)

### GitHub Copilot
- **Acceso gratuito para estudiantes**: [GitHub Student Developer Pack](https://education.github.com/pack)
- **Función**: Autocompletado inteligente de código
- **Cómo activarlo**: 
  1. Verifica tu correo UMA en GitHub Education
  2. Instala la extensión `GitHub Copilot`
  3. Inicia sesión con tu cuenta de GitHub

### Google Gemini Code Assist
- **Acceso**: Disponible para cuentas educativas (@uma.es)
- **Función**: Explicación de código, generación de documentación
- **Alternativas**: Copilot Chat, ChatGPT para programación

**Consejo**: Estos asistentes son excelentes para:
- Entender código existente
- Generar código repetitivo
- Aprender buenas prácticas
- Depurar errores

---

## 📁 5. Estructura de Directorios Recomendada

### Opción 1: Estructura Simple
```
C:\Users\TuUsuario\Documentos\fucomp\
├── Practica5\
│   ├── src\
│   ├── include\
│   ├── lib\
│   └── platformio.ini
├── apuntes\
└── recursos\
```

### Opción 2: Con OneDrive UMA (Recomendado)
```
C:\Users\TuUsuario\OneDrive - Universidad de Málaga\
├── fucomp\
│   ├── Practica5\
│   ├── apuntes\
│   └── recursos\
```

**Ventajas de usar OneDrive UMA**:
- ✅ Copia de seguridad automática
- ✅ Sincronización entre dispositivos
- ✅ 1TB de almacenamiento gratuito
- ✅ Historial de versiones

### Opción 3: Unidad Separada (Para mayor organización)
```
D:\proyectos\fucomp\
├── Practica5\
│   ├── src\
│   ├── include\
│   ├── lib\
│   └── platformio.ini
├── apuntes\
└── recursos\
```

**Ventajas de usar unidad separada**:
- ✅ Separación física del sistema operativo
- ✅ Mayor velocidad si es SSD dedicado
- ✅ Más espacio disponible
- ✅ Organización clara de proyectos

### ⚠️ IMPORTANTE: Evitar rutas con espacios o caracteres especiales
❌ **MAL**: `C:\Mis Documentos\Prácticas de FC\Práctica 5\`  
✅ **BIEN**: `C:\Users\usuario\fucomp\Practica5\`

**Razón**: Los compiladores y herramientas pueden tener problemas con espacios en las rutas.

---

## 🔍 6. Verificación de la Instalación

### Comprobar PlatformIO:
1. Abre VSCode
2. Deberías ver el icono de PlatformIO en la barra lateral (cabeza de hormiga/alien)
3. Haz clic en "PlatformIO Home"
4. Si se abre correctamente, ¡todo está bien!

### Compilar el proyecto de prueba:
1. Abre la carpeta `Practica5` en VSCode (File > Open Folder)
2. Espera a que PlatformIO inicialice el proyecto
3. En la barra inferior, haz clic en el icono ✓ (Build)
4. Debe compilar sin errores (pueden aparecer warnings)

---

## 🐛 7. Problemas Comunes

### PlatformIO no aparece
- **Solución**: Reinicia VSCode completamente (cerrar todas las ventanas)
- Si persiste: Desinstala y reinstala la extensión

### Error: "Python no encontrado"
- **Solución**: PlatformIO instala su propio Python. Reinicia VSCode

### Compilación muy lenta la primera vez
- **Normal**: PlatformIO descarga el SDK de ESP32 (puede tardar 10-30 min)
- Asegúrate de tener buena conexión a Internet

### La placa no se detecta
- **Instalar drivers**: Para ESP32-C3 puede ser necesario [CH340/CH341 drivers](https://sparks.gogo.co.nz/ch340.html)
- **Comprobar cable USB**: Algunos cables solo sirven para cargar, no para datos

---

## 📚 8. Recursos Adicionales

### Documentación oficial:
- [PlatformIO Docs](https://docs.platformio.org/)
- [ESP32-C3 Technical Reference](https://www.espressif.com/sites/default/files/documentation/esp32-c3_technical_reference_manual_en.pdf)
- [RISC-V Spec](https://riscv.org/technical/specifications/)

### Tutoriales:
- [Getting Started with PlatformIO](https://docs.platformio.org/en/latest/integration/ide/vscode.html)
- [ESP32 con PlatformIO](https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/)

---

## ✅ Lista de Verificación

Antes de empezar la práctica, asegúrate de tener:

- [ ] VSCode instalado y funcionando
- [ ] PlatformIO instalado (icono visible en barra lateral)
- [ ] Extensiones recomendadas instaladas
- [ ] Proyecto Practica5 abre correctamente
- [ ] Primera compilación exitosa
- [ ] Placa ESP32-C3 detectada (si ya la tienes)
- [ ] Cable USB de datos (no solo carga)
- [ ] Drivers instalados (si es necesario en tu SO)

---

## 💡 Consejos Finales

1. **Paciencia**: La primera configuración siempre es la más lenta
2. **Actualiza**: Mantén PlatformIO y las extensiones actualizadas
3. **Atajos de teclado**: Aprende los básicos (Ctrl+Shift+P para paleta de comandos)
4. **Pregunta**: Si algo no funciona, consulta con compañeros o profesores
5. **Backup**: Haz commits frecuentes en Git (incluso localmente)

---

## 📞 Soporte

Si tienes problemas durante la instalación:
1. Revisa la sección de "Problemas Comunes"
2. Busca en el foro de la asignatura
3. Consulta en tutorías

---

*¡Buena suerte con la práctica!* 🚀

*Última actualización: Febrero 2026*
