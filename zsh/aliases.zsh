#!/usr/bin/env zsh

# Better command aliases
alias lz="lazygit"
alias ls="colorls"
alias ll="colorls -la"
alias tree="colorls --tree"
alias cat="bat"
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
alias zshexports="$EDITOR ~/.config/zsh/exports.zsh"
alias zshaliases="$EDITOR ~/.config/zsh/aliases.zsh"

