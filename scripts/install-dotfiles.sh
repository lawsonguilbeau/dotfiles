#!/bin/bash

# =============================================================================
# Dotfiles Installation Script
# =============================================================================
# Sets up dotfiles on a new machine
# Usage: ./install-dotfiles.sh

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_REPO="https://github.com/yourusername/dotfiles.git"  # Update this!
DOTFILES_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

# Helper functions
print_step() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux"* ]]; then
        echo "linux"
    else
        echo "unknown"
    fi
}

# Install Homebrew (macOS)
install_homebrew() {
    if ! command_exists brew; then
        print_step "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        print_step "Homebrew already installed"
    fi
}

# Install essential tools
install_tools() {
    local os=$(detect_os)
    
    if [[ "$os" == "macos" ]]; then
        print_step "Installing essential tools via Homebrew..."
        
        # Install essential tools
        local tools=(
            "git"
            "zsh"
            "tmux"
            "neovim"
            "bat"
            "eza"
            "ripgrep"
            "fd"
            "fzf"
            "starship"
            "zoxide"
            "git-delta"
            "lazygit"
            "lazydocker"
        )
        
        for tool in "${tools[@]}"; do
            if ! command_exists "$tool"; then
                print_step "Installing $tool..."
                brew install "$tool"
            else
                print_step "$tool already installed"
            fi
        done
        
    elif [[ "$os" == "linux" ]]; then
        print_step "Installing essential tools via package manager..."
        
        # Detect package manager
        if command_exists apt; then
            sudo apt update
            sudo apt install -y git zsh tmux neovim curl wget
        elif command_exists yum; then
            sudo yum update -y
            sudo yum install -y git zsh tmux neovim curl wget
        elif command_exists pacman; then
            sudo pacman -Syu --noconfirm git zsh tmux neovim curl wget
        else
            print_error "No supported package manager found"
            exit 1
        fi
        
        # Install modern tools from releases
        print_step "Installing modern CLI tools..."
        # Add custom installation logic for bat, eza, ripgrep, etc.
        
    else
        print_error "Unsupported operating system: $os"
        exit 1
    fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        print_step "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        print_step "Oh My Zsh already installed"
    fi
    
    # Install zsh plugins
    local plugin_dir="$HOME/.oh-my-zsh/custom/plugins"
    
    if [[ ! -d "$plugin_dir/zsh-syntax-highlighting" ]]; then
        print_step "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugin_dir/zsh-syntax-highlighting"
    fi
    
    if [[ ! -d "$plugin_dir/zsh-autosuggestions" ]]; then
        print_step "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$plugin_dir/zsh-autosuggestions"
    fi
}

# Install Powerlevel10k
install_powerlevel10k() {
    if [[ ! -d "$HOME/powerlevel10k" ]]; then
        print_step "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/powerlevel10k"
    else
        print_step "Powerlevel10k already installed"
    fi
}

# Install TPM (Tmux Plugin Manager)
install_tpm() {
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        print_step "Installing TPM (Tmux Plugin Manager)..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        print_step "TPM already installed"
    fi
}

# Backup existing dotfiles
backup_existing() {
    print_step "Backing up existing dotfiles..."
    
    local files_to_backup=(
        ".zshrc"
        ".tmux.conf"
        ".gitconfig"
        ".config/nvim"
        ".config/starship.toml"
    )
    
    local backup_needed=false
    
    for file in "${files_to_backup[@]}"; do
        local file_path="$HOME/$file"
        if [[ -e "$file_path" ]]; then
            backup_needed=true
            break
        fi
    done
    
    if [[ "$backup_needed" == "true" ]]; then
        mkdir -p "$BACKUP_DIR"
        
        for file in "${files_to_backup[@]}"; do
            local file_path="$HOME/$file"
            if [[ -e "$file_path" ]]; then
                print_step "Backing up: $file"
                cp -r "$file_path" "$BACKUP_DIR/"
            fi
        done
        
        print_success "Existing dotfiles backed up to: $BACKUP_DIR"
    else
        print_step "No existing dotfiles to backup"
    fi
}

# Clone or update dotfiles repository
setup_dotfiles() {
    if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
        print_step "Cloning dotfiles repository..."
        
        # Remove existing .config if it exists and is not a git repo
        if [[ -d "$DOTFILES_DIR" ]]; then
            rm -rf "$DOTFILES_DIR"
        fi
        
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    else
        print_step "Updating existing dotfiles repository..."
        cd "$DOTFILES_DIR"
        git pull
    fi
}

# Create symlinks
create_symlinks() {
    print_step "Creating symlinks..."
    
    # Symlink important files to home directory
    local symlinks=(
        ".zshrc:$DOTFILES_DIR/.zshrc"
        ".tmux.conf:$DOTFILES_DIR/.tmux.conf"
        ".gitconfig:$DOTFILES_DIR/.gitconfig"
    )
    
    for link in "${symlinks[@]}"; do
        local target_file="${link%%:*}"
        local source_file="${link##*:}"
        local target_path="$HOME/$target_file"
        
        if [[ -e "$target_path" ]]; then
            rm -f "$target_path"
        fi
        
        print_step "Creating symlink: $target_file -> $source_file"
        ln -s "$source_file" "$target_path"
    done
}

# Set zsh as default shell
set_default_shell() {
    if [[ "$SHELL" != "$(which zsh)" ]]; then
        print_step "Setting zsh as default shell..."
        
        # Add zsh to allowed shells if not already there
        if ! grep -q "$(which zsh)" /etc/shells; then
            echo "$(which zsh)" | sudo tee -a /etc/shells
        fi
        
        chsh -s "$(which zsh)"
        print_success "Default shell changed to zsh"
    else
        print_step "Zsh is already the default shell"
    fi
}

# Final setup instructions
show_completion() {
    print_success "Dotfiles installation complete!"
    echo ""
    echo "Next steps:"
    echo "1. Restart your terminal or run: source ~/.zshrc"
    echo "2. Install tmux plugins: tmux run '~/.tmux/plugins/tpm/tpm'"
    echo "3. Configure Powerlevel10k: p10k configure"
    echo "4. Open Neovim and let plugins install"
    echo ""
    echo "Useful commands:"
    echo "  tmuxhelp       - View tmux cheat sheet"
    echo "  use-starship   - Switch to Starship prompt"
    echo "  use-p10k       - Switch to Powerlevel10k prompt"
    echo ""
    
    if [[ -d "$BACKUP_DIR" ]]; then
        echo "Your old dotfiles are backed up in: $BACKUP_DIR"
    fi
}

# Main installation function
main() {
    print_step "Starting dotfiles installation..."
    
    # Check for git
    if ! command_exists git; then
        print_error "Git is required but not installed"
        exit 1
    fi
    
    local os=$(detect_os)
    print_step "Detected OS: $os"
    
    # Install package manager (if needed)
    if [[ "$os" == "macos" ]]; then
        install_homebrew
    fi
    
    # Install essential tools
    install_tools
    
    # Install shell frameworks
    install_oh_my_zsh
    install_powerlevel10k
    install_tpm
    
    # Setup dotfiles
    backup_existing
    setup_dotfiles
    create_symlinks
    
    # Set default shell
    set_default_shell
    
    # Show completion message
    show_completion
}

# Show usage
show_usage() {
    echo "Dotfiles Installation Script"
    echo ""
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  --help, -h    Show this help message"
    echo ""
    echo "This script will:"
    echo "1. Install essential tools (via Homebrew on macOS)"
    echo "2. Install Oh My Zsh and plugins"
    echo "3. Install Powerlevel10k theme"
    echo "4. Install TPM (Tmux Plugin Manager)"
    echo "5. Backup existing dotfiles"
    echo "6. Clone and setup your dotfiles"
    echo "7. Create necessary symlinks"
    echo "8. Set zsh as default shell"
}

# Parse arguments
case "${1:-}" in
    --help|-h)
        show_usage
        exit 0
        ;;
    *)
        main "$@"
        ;;
esac

