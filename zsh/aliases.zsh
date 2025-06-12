#!/usr/bin/env zsh

# Better command aliases
alias lz="lazygit"
alias ld="lazydocker"
alias ls="eza --icons"
alias ll="eza -la --icons"
alias la="eza -a --icons"
alias tree="eza --tree --icons"
alias cat="bat"
alias grep="rg"
alias vi="nvim"
alias vim="nvim"
alias ff="fzf --preview='bat --color=always {}'"

# Git aliases for productivity
alias gst="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gps="git push"
alias gpl="git pull"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git log --oneline"
alias gb="git branch"
alias gm="git merge"
alias gr="git remote"
alias gf="git fetch"

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# System shortcuts
alias reload="source ~/.zshrc"
alias zshconfig="$EDITOR ~/.config/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Quick access to config files
alias nvimconfig="$EDITOR ~/.config/nvim/"
alias tmuxconfig="$EDITOR ~/.config/.tmux.conf"
alias tmuxhelp="bat ~/.config/tmux-cheatsheet.md"
alias zshexports="$EDITOR ~/.config/zsh/exports.zsh"
alias zshaliases="$EDITOR ~/.config/zsh/aliases.zsh"
alias starshipconfig="$EDITOR ~/.config/starship.toml"
alias gitconfig="$EDITOR ~/.config/.gitconfig"

# Prompt switching
alias use-starship="sed -i '' 's/USE_STARSHIP=false/USE_STARSHIP=true/' ~/.config/zsh/plugins.zsh && exec zsh"
alias use-p10k="sed -i '' 's/USE_STARSHIP=true/USE_STARSHIP=false/' ~/.config/zsh/plugins.zsh && exec zsh"

# Modern tool aliases
alias z="zoxide"
alias zi="zoxide query -i"
alias zq="zoxide query"

# Dotfiles management
alias dotsync="~/.config/scripts/sync-dotfiles.sh"
alias dotbackup="~/.config/scripts/backup-dotfiles.sh"
alias dotinstall="~/.config/scripts/install-dotfiles.sh"

# Project management
alias newproject="~/.config/scripts/organize-projects.sh create"
alias listprojects="~/.config/scripts/organize-projects.sh list"
alias openproject="~/.config/scripts/organize-projects.sh open"

