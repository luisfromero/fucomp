# Requerimientos para Práctica 5 - ESP32-C3 con Ensamblador RISC-V

## Software Necesario

### 1. Visual Studio Code
- **Versión**: 1.85 o superior
- **Descarga**: https://code.visualstudio.com/
- **Instalación**: Ejecutar instalador y seguir asistente

### 2. Python
- **Versión**: 3.8 o superior (recomendado 3.12)
- **Descarga**: https://www.python.org/downloads/
- **Importante durante instalación**:
  - ✅ Marcar "Add Python to PATH"
  - ✅ Marcar "Install pip"
- **Verificación**: Abrir PowerShell y ejecutar:
  ```powershell
  python --version
  pip --version
  ```

### 3. PlatformIO IDE (Extensión de VS Code)
- **Instalación**:
  1. Abrir VS Code
  2. Ir a extensiones (Ctrl+Shift+X)
  3. Buscar "PlatformIO IDE"
  4. Instalar la extensión oficial (por PlatformIO)
  5. Reiniciar VS Code
- **Tiempo de instalación**: 5-10 minutos (descarga herramientas automáticamente)

### 4. Git (Opcional pero recomendado)
- **Versión**: 2.30 o superior
- **Descarga**: https://git-scm.com/download/win
- **Uso**: Para clonar repositorios y control de versiones

## Herramientas Instaladas Automáticamente por PlatformIO

PlatformIO descarga e instala automáticamente las siguientes herramientas la primera vez que se compila el proyecto:

- **ESP-IDF Framework** (v5.4.0)
- **Toolchain RISC-V32** (compilador para ESP32-C3)
- **esptool.py** (para subir firmware a la placa)
- **CMake** (sistema de compilación)
- **Ninja** (generador de archivos de compilación)

**Ubicación**: `C:\Users\<usuario>\.platformio\`

## Hardware Necesario

### Placa de Desarrollo
- **Modelo**: Seeed Studio XIAO ESP32-C3
- **Características**:
  - Microcontrolador: ESP32-C3 (RISC-V 32-bit)
  - Frecuencia: 160 MHz
  - RAM: 400 KB SRAM
  - Flash: 4 MB
  - WiFi y Bluetooth 5.0

### Expansion Board (Opcional)
- **Seeed Studio XIAO Expansion Board**
- Incluye buzzer en pin A3 (GPIO 5)
- Facilita las pruebas sin soldaduras

### Cable USB
- USB Tipo-C para conectar la placa al PC

## Configuración del Proyecto

### 1. Estructura de Archivos
```
practica5/
├── platformio.ini              # Configuración del proyecto
├── src/
│   ├── main.c                  # Código principal en C
│   ├── secuenciaX.S             # Código en ensamblador RISC-V
│   └── CMakeLists.txt          # Configuración de compilación
└── sdkconfig.seeed_xiao_esp32c3 # Configuración del ESP32-C3
```

### 2. Archivo platformio.ini
```ini
[env:seeed_xiao_esp32c3]
platform = espressif32
board = seeed_xiao_esp32c3
framework = espidf
```

### 3. Compilación y Despliegue

#### Compilar el Proyecto
**Opción A**: Usar botón de VS Code
- Clic en el ícono ✓ (checkmark) en la barra inferior

**Opción B**: Desde la terminal
```powershell
platformio run
```

#### Subir a la Placa
**Opción A**: Usar botón de VS Code
- Clic en el ícono → (flecha) en la barra inferior

**Opción B**: Desde la terminal
```powershell
platformio run --target upload
```

#### Monitor Serie (Ver salida del programa)
```powershell
platformio device monitor
```

## Preparación para Laboratorios de Alumnos

### Pre-instalación Recomendada

Para agilizar el trabajo en clase, se recomienda tener pre-instalado:

1. **VS Code** (instalación centralizada)
2. **Python 3.12** con pip
3. **PlatformIO IDE** (extensión)
4. **Caché de PlatformIO**:
   - Compilar una vez el proyecto en un equipo
   - Copiar la carpeta `C:\Users\<usuario>\.platformio\` a los demás equipos
   - Esto evita descargar ~2GB por equipo

### Verificación de Instalación

Script de PowerShell para verificar requisitos:

```powershell
# Verificar Python
python --version
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Python no instalado" -ForegroundColor Red }

# Verificar pip
pip --version
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: pip no instalado" -ForegroundColor Red }

# Verificar PlatformIO
platformio --version
if ($LASTEXITCODE -eq 0) { 
    Write-Host "OK: PlatformIO instalado" -ForegroundColor Green 
} else {
    Write-Host "OK: PlatformIO instalado como extensión de VS Code" -ForegroundColor Yellow
}

# Verificar VS Code
code --version
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: VS Code no instalado" -ForegroundColor Red }
```

### Tiempo Estimado de Instalación

- **Con internet rápida**: 15-20 minutos por equipo
- **Con caché pre-instalada**: 2-3 minutos por equipo
- **Primera compilación**: 3-5 minutos

## Solución de Problemas Comunes

### Error: "pio: El término no se reconoce"
**Solución**: Usar el comando completo:
```powershell
& "$env:USERPROFILE\.platformio\penv\Scripts\platformio.exe" run
```
O usar los botones de PlatformIO en VS Code.

### Error: "No se encuentra el puerto COM"
**Solución**: 
1. Instalar drivers USB-Serial (CP2102 o CH340)
2. Verificar en "Administrador de dispositivos"
3. Presionar el botón RESET en la placa mientras se sube

### Error: Flash memory size mismatch
**Advertencia**: Se puede ignorar. La placa tiene 4MB pero PlatformIO detecta 2MB por defecto.

### La placa no responde
**Solución**:
1. Mantener presionado el botón BOOT
2. Conectar el cable USB
3. Soltar el botón BOOT
4. Intentar subir nuevamente

## Recursos Adicionales

- **Documentación PlatformIO**: https://docs.platformio.org/
- **ESP-IDF Programming Guide**: https://docs.espressif.com/projects/esp-idf/
- **RISC-V Assembly Reference**: https://riscv.org/technical/specifications/
- **Seeed XIAO ESP32-C3**: https://wiki.seeedstudio.com/XIAO_ESP32C3_Getting_Started/

## Notas para el Instructor

- **IMPORTANTE**: El archivo `CMakeLists.txt` en la raíz con `include($ENV{IDF_PATH}/tools/cmake/project.cmake)` **SÍ es necesario**. PlatformIO configura automáticamente la variable `IDF_PATH` antes de compilar.
- El archivo `src/CMakeLists.txt` es usado por ESP-IDF para configurar archivos .S (ensamblador)
- No intentar compilar con `cmake` directamente - usar solo PlatformIO
- Verificar que todos los equipos tienen acceso a internet o preparar instalación offline
- Considerar tener placas de repuesto por posibles daños
