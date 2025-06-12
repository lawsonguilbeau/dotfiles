#!/usr/bin/env zsh

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Tool-specific configurations
export BAT_THEME=tokyonight_night
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/config"

# History configuration
export HISTFILE="$HOME/.zhistory"
export SAVEHIST=10000
export HISTSIZE=10000

# Path additions
export PATH="$PATH:/Users/lawsonguilbeau/.spicetify"
export PATH="$PATH:$HOME/.config/scripts"

# FZF theme configuration
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# FZF commands
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Initialize zoxide (smart cd replacement)
eval "$(zoxide init zsh)"

