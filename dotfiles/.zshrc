# ==========================================
# Renato Development Environment
# ==========================================

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Completion
autoload -Uz compinit
compinit

# Zsh Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Custom configuration
[ -f "$HOME/.config/renato-dev/aliases.sh" ] && \
    source "$HOME/.config/renato-dev/aliases.sh"

[ -f "$HOME/.config/renato-dev/functions.sh" ] && \
    source "$HOME/.config/renato-dev/functions.sh"

[ -f "$HOME/.config/renato-dev/exports.sh" ] && \
    source "$HOME/.config/renato-dev/exports.sh"


# ==========================================
# NVM - Node Version Manager
# ==========================================

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

[ -s "$NVM_DIR/bash_completion" ] && \
    source "$NVM_DIR/bash_completion"
