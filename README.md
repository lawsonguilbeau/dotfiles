# Lawson's Dotfiles

A comprehensive, modular dotfiles configuration optimized for productivity and aesthetics on macOS.

## ✨ Features

### 🚀 Modern CLI Tools
- **Starship/Powerlevel10k**: Beautiful, fast prompts
- **Zoxide**: Smart directory jumping with frecency
- **Eza**: Modern `ls` replacement with icons
- **Ripgrep**: Lightning-fast search
- **Git Delta**: Beautiful git diffs
- **Bat**: Enhanced `cat` with syntax highlighting
- **FZF**: Fuzzy finder with custom themes
- **Lazygit/Lazydocker**: TUI for Git and Docker

### 🎯 Productivity Features
- **Modular Zsh Config**: Organized into logical components
- **Enhanced Tmux**: Custom keybindings and productivity features
- **Smart Navigation**: Prefix-free pane switching
- **Git Integration**: Comprehensive aliases and workflows
- **Project Management**: Automated project creation and organization

### 🎨 Consistent Theming
- **Tokyo Night**: Consistent theme across all tools
- **Nerd Font Icons**: Beautiful icons throughout
- **Custom FZF Theme**: Matching color scheme

## 📦 Installation

### Quick Install (New Machine)
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/dotfiles/main/scripts/install-dotfiles.sh | bash
```

### Manual Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.config
   ```

2. **Install dependencies** (macOS):
   ```bash
   ~/.config/scripts/install-dotfiles.sh
   ```

3. **Create symlinks**:
   ```bash
   ln -sf ~/.config/.zshrc ~/.zshrc
   ln -sf ~/.config/.tmux.conf ~/.tmux.conf
   ln -sf ~/.config/.gitconfig ~/.gitconfig
   ```

4. **Reload your shell**:
   ```bash
   source ~/.zshrc
   ```

## 🗂️ Structure

```
~/.config/
├── .zshrc                 # Main zsh configuration
├── .tmux.conf            # Tmux configuration
├── .gitconfig            # Git configuration
├── starship.toml         # Starship prompt config
├── tmux-cheatsheet.md    # Tmux reference
├── zsh/                  # Modular zsh configs
│   ├── exports.zsh       # Environment variables
│   ├── aliases.zsh       # Command aliases
│   ├── functions.zsh     # Custom functions
│   └── plugins.zsh       # Plugin management
├── scripts/              # Automation scripts
│   ├── sync-dotfiles.sh  # Sync to git
│   ├── backup-dotfiles.sh # Create backups
│   ├── install-dotfiles.sh # Setup new machine
│   └── organize-projects.sh # Project management
└── nvim/                 # Neovim configuration
```

## 🔧 Management Scripts

### Dotfiles Management
```bash
# Sync changes to git repository
dotsync "Added new feature"

# Create timestamped backup
dotbackup

# List existing backups
dotbackup list

# Install on new machine
dotinstall
```

### Project Management
```bash
# Create new projects with templates
newproject my-website web
newproject my-api python
newproject my-app node

# List all projects
listprojects

# Open project in editor
openproject my-website
```

## ⌨️ Key Features

### Zsh Enhancements
- **Modular Configuration**: Easily maintainable separate files
- **Smart Aliases**: Productivity-focused shortcuts
- **Custom Functions**: Utility functions for common tasks
- **Plugin Management**: Oh My Zsh with essential plugins
- **Prompt Switching**: Easy toggle between Starship and P10k

### Tmux Superpowers
- **Prefix-free Navigation**: `Ctrl-h/j/k/l` to navigate panes
- **Smart Window Management**: Windows start at 1, auto-renumber
- **Enhanced Copy Mode**: Vim-style keybindings
- **Pane Synchronization**: Type in multiple panes simultaneously
- **Quick Layouts**: `Alt-1` through `Alt-5` for instant layouts
- **50k History**: Never lose important output

### Git Workflow
- **Delta Integration**: Beautiful diffs with syntax highlighting
- **Comprehensive Aliases**: Streamlined git workflow
- **Smart Defaults**: Sensible git configuration
- **Branch Management**: Easy branch creation and switching

## 🎮 Quick Reference

### Essential Aliases
```bash
# File operations
ls, ll, la          # Better file listing with eza
cat                 # Syntax highlighted with bat
grep                # Fast search with ripgrep

# Git shortcuts
gst, gco, gcb       # Status, checkout, create branch
gps, gpl, gaa       # Push, pull, add all
gcm "message"       # Quick commit with message

# Navigation
z projects          # Jump to projects directory
zi                  # Interactive directory selection
.., ..., ....       # Quick directory navigation

# Development
lz                  # Launch lazygit
ld                  # Launch lazydocker
vim, vi             # Open neovim
ff                  # Fuzzy find files

# Configuration
zshconfig           # Edit main zsh config
tmuxconfig          # Edit tmux config
nvimconfig          # Edit neovim config
tmuxhelp            # View tmux cheatsheet
```

### Tmux Keybindings
```bash
# Session Management
Ctrl-a C-s          # Choose session
Ctrl-a S            # Create new session
Ctrl-a R            # Rename session

# Window Management
Ctrl-a c            # New window (in current directory)
Alt-H/L             # Previous/next window
Ctrl-Alt-h/l        # Move window left/right

# Pane Management
Ctrl-a | / -        # Split horizontal/vertical
Ctrl-h/j/k/l        # Navigate panes (no prefix!)
Ctrl-a h/j/k/l      # Resize panes
Ctrl-a m            # Maximize/restore pane
Ctrl-a y            # Toggle pane synchronization

# Quick Layouts
Alt-1 to Alt-5      # Switch to predefined layouts
```

## 🎨 Customization

### Switching Prompts
```bash
use-starship        # Switch to Starship prompt
use-p10k            # Switch to Powerlevel10k prompt
```

### Editing Configurations
```bash
zshexports          # Edit environment variables
zshaliases          # Edit aliases
starshipconfig      # Edit Starship configuration
gitconfig           # Edit git configuration
```

## 🔄 Backup & Sync

### Automatic Backups
- **Git Integration**: All changes tracked in git
- **Timestamped Backups**: `dotbackup` creates dated archives
- **Cloud Sync**: Push to GitHub for redundancy

### Easy Restoration
```bash
# Restore from backup
tar -xzf ~/dotfiles-backups/dotfiles_20231201_120000.tar.gz

# Or reinstall from git
dotinstall
```

## 🚀 Advanced Features

### Custom Functions
- `mkdir_cd`: Create directory and cd into it
- `extract`: Universal archive extraction
- `backup`: Quick file backup with timestamp
- `gacp`: Git add, commit, and push in one command
- `killp`: Find and kill process by name

### Project Templates
- **Web Projects**: HTML/CSS/JS structure
- **Python Projects**: Package structure with setup.py
- **Node.js Projects**: package.json and basic structure
- **Go Projects**: Module initialization
- **Default**: Basic project with Makefile

## 🐛 Troubleshooting

### Common Issues
1. **Fonts not displaying correctly**: Install a Nerd Font
2. **Colors look wrong**: Check terminal color support
3. **Commands not found**: Source the configuration: `source ~/.zshrc`
4. **Tmux plugins not working**: Install TPM and run `Ctrl-a I`

### Getting Help
```bash
tmuxhelp            # Tmux keybinding reference
dotsync --help      # Sync script help
dotbackup --help    # Backup script help
newproject --help   # Project creation help
```

## 📝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

MIT License - feel free to use and modify as needed.

---

**Enjoy your enhanced development environment!** 🎉
