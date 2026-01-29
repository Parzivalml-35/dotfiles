# --- 3. CARGAR PLUGINS (Compatibilidad Arch/Ubuntu/Local) ---

# Función para cargar plugins desde rutas comunes
load_plugin() {
    local paths=("$1" "$2")
    for p in $paths; do
        if [ -f "$p" ]; then
            source "$p"
            return 0
        fi
    done
}

# Cargar Syntax Highlighting
load_plugin "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
            "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Cargar Autosuggestions
load_plugin "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
            "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Cargar FZF (Solo si el archivo existe)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh