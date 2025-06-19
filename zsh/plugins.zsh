#!/usr/bin/env zsh

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Plugins list
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Prompt configuration - choose between Starship and Powerlevel10k
# Set USE_STARSHIP=true to use Starship, false to use Powerlevel10k
USE_STARSHIP=true

if [[ "$USE_STARSHIP" == "true" ]]; then
    # Initialize Starship prompt
    eval "$(starship init zsh)"
else
    # Powerlevel10k theme
    source ~/powerlevel10k/powerlevel10k.zsh-theme
    
    # Load p10k configuration if it exists
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# FZF integration
eval "$(fzf --zsh)"

# Source fzf-git.sh if it exists
[[ -f ~/fzf-git.sh/fzf-git.sh ]] && source ~/fzf-git.sh/fzf-git.sh

# History options
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Key bindings for history search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

