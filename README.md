# 🚀 Dotfiles Personalizados - Arch Linux y Ubuntu

Repositorio de configuración automática para Arch Linux y Ubuntu. Incluye setup completo de shell, terminal, editor y herramientas de visualización.

---

## 📋 Contenido del Repositorio

```
dotfiles/
├── install.sh                          # Script automatizado de instalación
├── zshrc                               # Configuración de Zsh (shell)
├── nanorc                              # Configuración global de Nano
└── config/
    ├── kitty/
    │   └── kitty.conf                 # Configuración de terminal Kitty
    └── fastfetch/
        └── config.jsonc               # Configuración de fastfetch (system info)
```

---

## 🛠️ Componentes Instalados

### 1. **Zsh Shell** 
Intérprete de shell avanzado con plugins y configuraciones personalizadas.

### 2. **Plugins de Zsh**
- `zsh-autosuggestions` - Sugiere comandos automáticamente
- `zsh-syntax-highlighting` - Resaltado de sintaxis en tiempo real
- `zsh` - Integración FZF (búsqueda de archivos)

### 3. **Herramientas Modernas**
- **eza** - Remplazo moderno de `ls` con iconos
- **bat** - Visor de código con sintaxis (reemplaza `cat`)
- **zoxide** - Navegación inteligente de directorios
- **starship** - Prompt personalizado y moderno
- **fastfetch** - Información del sistema al iniciar terminal
- **Nano** - Editor de texto global configurado

### 4. **Terminal Kitty**
Terminal GPU acelerada con tema personalizado y tipografía JetBrains Mono.

---

## 📦 Requisitos Previos

### Para Arch Linux
```bash
# Las herramientas principales suelen estar en los repositorios oficiales
# Instalar pacman si no lo tienes
sudo pacman -S base-devel git
```

### Para Ubuntu
```bash
# Actualizar lista de paquetes
sudo apt update

# Instalar Git (requerido para el script)
sudo apt install -y git
```

---

## ⚡ Instalación Paso a Paso

### Paso 1: Clonar el Repositorio
```bash
# Clona el repositorio en el directorio home
git clone https://github.com/TuUsuario/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Paso 2: Instalar Dependencias Base

#### En **Arch Linux**:
```bash
# Instalar todas las herramientas requeridas
sudo pacman -S zsh zoxide starship fastfetch fzf nano bat eza

# Instalar plugins en rutas del sistema (automático con pacman)
# Si no están disponibles, el script los instalará en ~/.zsh/plugins
```

#### En **Ubuntu**:
```bash
# Actualizar paquetes
sudo apt update

# Instalar herramientas básicas
sudo apt install -y zsh zoxide fastfetch fzf nano

# Instalar bat y eza (disponibles en repos recientes)
sudo apt install -y bat eza

# Si no están disponibles en tu versión de Ubuntu:
# Para eza: Descargar desde https://github.com/eza-community/eza/releases
# Para starship: curl -sS https://starship.rs/install.sh | sh
```

### Paso 3: Ejecutar el Script de Instalación
```bash
# Dar permisos de ejecución
chmod +x ~/dotfiles/install.sh

# Ejecutar el script (pedirá contraseña para configurar Nano globalmente)
~/dotfiles/install.sh
```

**¿Qué hace el script?**
1. ✅ Crea directorios de configuración (~/.config/kitty, ~/.config/fastfetch, etc.)
2. ✅ Crea enlaces simbólicos para zshrc, kitty.conf y fastfetch config
3. ✅ Configura Nano globalmente en /etc/nanorc (requiere sudo)
4. ✅ Instala plugins de Zsh si no están disponibles en el sistema
5. ✅ Detecta tu distribución Linux y sugiere comandos de instalación faltantes

### Paso 4: Recargar la Configuración
```bash
# Opción 1: Cerrar y abrir una nueva terminal

# Opción 2: Recargar configuración en la terminal actual
source ~/.zshrc

# Opción 3: Cambiar shell a Zsh
chsh -s /bin/zsh
# (Requiere reiniciar sesión para tomar efecto)
```

---

## 🎨 Configuraciones Detalladas

### **1. Zsh (.zshrc)**

#### Variables de Entorno
```bash
export TERM=xterm-256color  # Habilita colores 256
```

#### Historial
- 10,000 comandos guardados en `~/.zsh_history`
- Se comparte entre sesiones
- Se añade automáticamente al cerrar sesión

#### Plugins Cargados
```bash
# Autosuggestions: sugerencias de comandos basadas en historial
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting: colorea comandos mientras escribes
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF Integration: búsqueda interactiva
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Zoxide: navegación inteligente (cd mejorado)
eval "$(zoxide init zsh)"

# Starship: prompt personalizado
eval "$(starship init zsh)"
```

#### Alias Personalizados
| Alias | Comando | Descripción |
|-------|---------|------------|
| `cat` | `bat --paging=never` | Ver archivos con colores |
| `ls` | `eza --icons --group-directories-first` | Listar con iconos |
| `ll` | `eza -lh --icons --group-directories-first` | Listar detallado |
| `la` | `eza -a --icons --group-directories-first` | Listar todo incluyendo ocultos |
| `tree` | `eza --tree --icons` | Ver estructura en árbol |
| **`dotsync`** | `cd ~/dotfiles && git add . && git commit -m "🔄 Sincronización rápida" && git push && cd -` | **Sincronizar cambios en dotfiles** |

#### ⭐ Alias Especial: `dotsync`

Este alias es fundamental para mantener sincronizados tus cambios:

**¿Qué hace?**
1. Entra al directorio `~/dotfiles`
2. Añade todos los cambios (`git add .`)
3. Crea un commit con mensaje automático 🔄
4. Empuja los cambios al repositorio remoto (`git push`)
5. Regresa al directorio anterior

**Uso:**
```bash
# Después de modificar cualquier archivo de configuración:
dotsync

# Ejemplo de flujo:
# 1. Editas ~/.config/kitty/kitty.conf
# 2. Los cambios se reflejan automáticamente (por los enlaces simbólicos)
# 3. Ejecutas: dotsync
# 4. ¡Listo! Cambios sincronizados en GitHub
```

#### Personalizaciones de Colores
```bash
# Comando en color azul y negrita
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa,bold'

# Autosuggestions en gris
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
```

---

### **2. Kitty (kitty.conf)**

#### Tipografía
- **Fuente**: JetBrains Mono
- **Tamaño**: 14.5 pt

#### Apariencia
- **Tema**: Basado en paleta personalizada (similar a Tokyonight)
- **Opacidad**: 80% (semi-transparente, requiere compositor)
- **Cursor**: Bloque sólido en color morado (#ad8ee6)
- **Padding**: 8px alrededor del contenido

#### Colores
La paleta incluye:
- **Primarios**: Tonos oscuros y claros (#1a1b26 bg, #a9b1d6 fg)
- **Acentos**: Rojo (#f7768e), Verde (#9ece6a), Azul (#7aa2f7)
- **Especiales**: Soporte para colores 256 y true color

#### Efectos
- Desenfoque de fondo (blur) habilitado en 80% de opacidad

---

### **3. Nano (nanorc)**

#### Características
- **Números de línea**: Habilitados en color cian
- **Indicador de posición**: Muestra ubicación actual
- **Mouse**: Soporte completo
- **Barra de estado**: Verde, visible siempre

#### Edición
- **Auto indentado**: Mantiene la indentación automáticamente
- **Soft wrap**: Las líneas largas se envuelven sin quiebre real
- **Tab size**: 4 espacios
- **Zap**: Elimina espacios en blanco al cortar

#### Sintaxis
- Incluye todos los archivos de coloreado (`/usr/share/nano/*.nanorc`)
- Incluye paquete `nano-syntax-highlighting` para lenguajes adicionales

---

### **4. Fastfetch (config.jsonc)**

Muestra información del sistema al abrir la terminal:

```
[LOGO]  OS              ➜  Arch Linux / Ubuntu
        Host            ➜  Modelo del computador
        Kernel          ➜  Versión del kernel
        Uptime          ➜  Tiempo desde último reinicio
        Packages        ➜  Cantidad de paquetes instalados
        Shell           ➜  Zsh
        Terminal        ➜  Kitty
        Memory          ➜  Uso de RAM
        Colors          ➜  Paleta del tema
```

---

## 🔄 Flujo de Trabajo - Modificar Configuración

### Escenario: Cambiar la configuración de Kitty

```bash
# 1. Editar el archivo (directamente o con tu editor favorito)
nano ~/.config/kitty/kitty.conf

# 2. Los cambios se reflejan automáticamente en nuevas ventanas de Kitty

# 3. Sincronizar cambios al repositorio
dotsync

# 4. ✅ Listo - cambios guardados en la nube
```

### Escenario: Modificar alias en Zsh

```bash
# 1. Editar zshrc
nano ~/.zshrc

# 2. Recargar configuración
source ~/.zshrc

# 3. El nuevo alias está disponible inmediatamente

# 4. Sincronizar
dotsync
```

---

## ⚠️ Notas Importantes

### Dependencias Críticas

| Componente | Arch Linux | Ubuntu | Instalado por |
|-----------|-----------|--------|---------------|
| Zsh | `pacman -S zsh` | `apt install zsh` | Manual o script |
| Git | Incluido en `base-devel` | `apt install git` | Manual o script |
| Nano | `pacman -S nano` | `apt install nano` | Manual o script |
| Kitty | `pacman -S kitty` | `apt install kitty` | Manual |
| Fastfetch | `pacman -S fastfetch` | `apt install fastfetch` | Manual o script |
| Zoxide | `pacman -S zoxide` | `apt install zoxide` | Script |
| Starship | `pacman -S starship` | Descargar | Manual o script |
| Bat | `pacman -S bat` | `apt install bat` | Script |
| Eza | `pacman -S eza` | `apt install eza` | Script |
| FZF | `pacman -S fzf` | `apt install fzf` | Manual o script |

### Rutas Específicas

**Arch Linux**: Los plugins de Zsh están en:
```bash
/usr/share/zsh/plugins/zsh-autosuggestions/
/usr/share/zsh/plugins/zsh-syntax-highlighting/
```

**Ubuntu**: Pueden variar, el script intenta instalar en:
```bash
~/.zsh/plugins/  # (Ruta de usuario como fallback)
```

### FZF en Ubuntu

Si FZF no está disponible en tu versión de Ubuntu:
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Cambiar Shell a Zsh

La instalación no cambia automáticamente el shell por seguridad:
```bash
# Verificar shells disponibles
cat /etc/shells

# Cambiar a Zsh
chsh -s /bin/zsh

# (Requiere cerrar sesión para tomar efecto)
```

### Nano Global

El script intenta configurar Nano globalmente mediante:
```bash
sudo ln -sf ~/dotfiles/nanorc /etc/nanorc
```

Si tienes problemas, puedes hacerlo manualmente:
```bash
sudo nano /etc/nanorc
# Pegar contenido de ~/dotfiles/nanorc
```

---

## 🐛 Solución de Problemas

### "Comando no encontrado" para zoxide, starship, etc.

```bash
# Verificar si está instalado
which starship

# Si no aparece, instalar manualmente:
# Arch
sudo pacman -S starship zoxide bat eza

# Ubuntu
sudo apt install starship zoxide bat eza
```

### Plugins de Zsh no cargan

```bash
# Verificar rutas en zshrc
grep "source" ~/.zshrc

# Instalar manualmente si no existen
mkdir -p ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

# Actualizar rutas en ~/.zshrc si es necesario
```

### Kitty no abre

```bash
# Instalar Kitty
# Arch
sudo pacman -S kitty

# Ubuntu
sudo apt install kitty

# O compilar desde fuente
pip install pillow libxcb xclip xsel wcwidth
```

### FZF no funciona

```bash
# Verificar instalación
which fzf

# Instalar si falta
# Arch
sudo pacman -S fzf

# Ubuntu
sudo apt install fzf

# O descargar manualmente (ver sección Notas Importantes)
```

---

## 📊 Estructura de Enlaces Simbólicos

Después de la instalación, los archivos están enlazados así:

```
~/.zshrc                          → ~/dotfiles/zshrc
~/.config/kitty/kitty.conf        → ~/dotfiles/config/kitty/kitty.conf
~/.config/fastfetch/config.jsonc  → ~/dotfiles/config/fastfetch/config.jsonc
/etc/nanorc                       → ~/dotfiles/nanorc (requiere sudo)
```

**Ventaja**: Los cambios en `~/dotfiles` se reflejan inmediatamente en el sistema.

---

## 🚀 Próximas Mejoras Sugeridas

- [ ] Agregar configuración de Hyprland
- [ ] Configuración de Waybar
- [ ] Customización de Starship
- [ ] Perfil de GTK3/GTK4
- [ ] Setup automático para diferentes shells (Fish, Bash)
- [ ] Script de desinstalación

---

## 📝 Licencia

Estos dotfiles son personales y de uso libre. Siéntete libre de adaptarlos a tus necesidades.

---

## 🤝 Mantener Sincronizado

**Comando rápido para sincronizar cambios:**
```bash
dotsync
```

**Para clonar en otra máquina:**
```bash
git clone https://github.com/TuUsuario/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

---

**Última actualización**: 28 de enero de 2026
**Distribuciones soportadas**: Arch Linux, Ubuntu
