# --- ENTORNO Y TECLADO ---
export TERM=xterm-256color
# Arreglar tecla Supr (Delete) en Arch
bindkey "^[[3~" delete-char

# --- ZSH COMPLETION ---
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# --- 1. INICIO VISUAL ---
# Solo ejecutar fastfetch si la sesión es interactiva
[[ $- == *i* ]] && fastfetch

# --- 2. CONFIGURACIÓN DEL HISTORIAL ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory

# --- 3. CARGAR PLUGINS (Rutas exactas de Arch Linux) ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# --- 4. ALIAS Y ESTILOS ---
alias cat='bat --paging=never'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias tree='eza --tree --icons'

# Colores de plugins
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa,bold'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- 5. INICIALIZACIONES (Al final para evitar conflictos) ---
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
