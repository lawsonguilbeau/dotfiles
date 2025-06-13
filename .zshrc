#!/usr/bin/env zsh

# ============================================================================
# Lawson's ZSH Configuration
# ============================================================================
# A modular zsh configuration for productivity and aesthetics
#
# Structure:
#   ~/.config/zsh/exports.zsh   - Environment variables and exports
#   ~/.config/zsh/aliases.zsh   - Command aliases and shortcuts
#   ~/.config/zsh/functions.zsh - Custom functions
#   ~/.config/zsh/plugins.zsh   - Plugin management and configuration
# ============================================================================

# Source modular configuration files
for config in ~/.config/zsh/{exports,aliases,functions,plugins}.zsh; do
    [ -r "$config" ] && source "$config"
done

# Unset the config variable
unset config

# Note: Homebrew completions and compinit are handled in main ~/.zshrc
