#!/usr/bin/env zsh

# FZF completion functions
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Utility functions
mkdir_cd() {
    mkdir -p "$1" && cd "$1"
}

# Find and kill process by name
killp() {
    local pid
    pid=$(ps -ef | grep "$1" | grep -v grep | awk '{print $2}')
    if [ -n "$pid" ]; then
        echo "Killing process $1 with PID $pid"
        kill "$pid"
    else
        echo "Process $1 not found"
    fi
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create backup of file
backup() {
    cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
}

# Git functions
git_current_branch() {
    git branch --show-current 2>/dev/null
}

# Quick git add, commit, and push
gacp() {
    git add .
    git commit -m "$1"
    git push
}

