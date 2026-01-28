#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${BLUE}🚀 Iniciando instalación de Dotfiles personalizada...${NC}"

# 1. Crear carpetas base
echo -e "${GREEN}📂 Creando directorios de configuración...${NC}"
mkdir -p ~/.config/kitty
mkdir -p ~/.config/fastfetch
mkdir -p ~/.zsh/plugins

# 2. Enlaces simbólicos (Usuario)
echo -e "${GREEN}🔗 Creando enlaces simbólicos para el usuario...${NC}"
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

# 3. Configuración GLOBAL de Nano (Requiere sudo)
echo -e "${GREEN}🛡️ Configurando Nano de forma global (/etc/nanorc)...${NC}"
if [ -f ~/dotfiles/nanorc ]; then
    sudo ln -sf ~/dotfiles/nanorc /etc/nanorc
else
    echo "⚠️ Archivo nanorc no encontrado en dotfiles, saltando..."
fi

# 4. Instalación de Plugins de Zsh (Solo si no están en la ruta de sistema de Arch)
if [ ! -d "/usr/share/zsh/plugins/zsh-autosuggestions" ]; then
    echo -e "${GREEN}📥 Descargando plugins de Zsh para este entorno...${NC}"
    [ ! -d ~/.zsh/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
    [ ! -d ~/.zsh/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
fi

# 5. Detectar Sistema y sugerir instalaciones si faltan comandos clave
if command -v pacman &> /dev/null; then
    echo -e "${BLUE}ℹ️ Estás en Arch Linux. Asegúrate de tener: eza, bat, zoxide, starship, fastfetch.${NC}"
elif command -v apt &> /dev/null; then
    echo -e "${BLUE}ℹ️ Estás en Ubuntu. Instalando dependencias básicas...${NC}"
    sudo apt update && sudo apt install -y zoxide bat eza fastfetch
    # Instalación de Starship
