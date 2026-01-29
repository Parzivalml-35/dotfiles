# --- 1. ENTORNO Y TECLADO ---
export TERM=xterm-256color
# Arreglar tecla Supr (Delete) en Arch
bindkey "^[[3~" delete-char

# --- 2. ZSH COMPLETION ---
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# --- 3. INICIO VISUAL ---
# Solo ejecutar fastfetch si la sesión es interactiva
[[ $- == *i* ]] && fastfetch

# --- 4. CONFIGURACIÓN DEL HISTORIAL ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory

# --- 5. CARGAR PLUGINS (Función Inteligente) ---
load_plugin() {
    if [ -f "$1" ]; then
        source "$1"
    elif [ -f "$2" ]; then
        source "$2"
    fi
}

# Syntax Highlighting
load_plugin "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
            "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Autosuggestions
load_plugin "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
            "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# FZF (Solo si existe)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# --- 6. ALIAS Y ESTILOS ---
alias cat='bat --paging=never'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias tree='eza --tree --icons'
alias dotsync='cd ~/dotfiles && git add . && git commit -m "🔄 Sincronización rápida" && git push && cd -'

# Colores de plugins y sugerencias
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa,bold'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- 7. INICIALIZACIONES (Vital para el Tema) ---
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
