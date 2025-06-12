#!/bin/bash

# =============================================================================
# Dotfiles Backup Script
# =============================================================================
# Creates timestamped backups of dotfiles
# Usage: ./backup-dotfiles.sh [backup-location]

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_DIR="$HOME/.config"
DEFAULT_BACKUP_DIR="$HOME/dotfiles-backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

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

# Get backup directory
get_backup_dir() {
    if [ $# -eq 0 ]; then
        echo "$DEFAULT_BACKUP_DIR"
    else
        echo "$1"
    fi
}

# Create backup
create_backup() {
    local backup_base_dir=$(get_backup_dir "$@")
    local backup_dir="$backup_base_dir/dotfiles_$TIMESTAMP"
    
    print_step "Creating backup directory: $backup_dir"
    mkdir -p "$backup_dir"
    
    print_step "Backing up dotfiles..."
    
    # Copy important dotfiles
    local files_to_backup=(
        ".zshrc"
        ".tmux.conf"
        ".gitconfig"
        "starship.toml"
        "tmux-cheatsheet.md"
        "zsh/"
        "nvim/"
        "scripts/"
    )
    
    for file in "${files_to_backup[@]}"; do
        local source_path="$DOTFILES_DIR/$file"
        if [ -e "$source_path" ]; then
            print_step "Backing up: $file"
            cp -r "$source_path" "$backup_dir/"
        else
            print_warning "File not found: $file"
        fi
    done
    
    # Create backup info file
    cat > "$backup_dir/backup_info.txt" << EOF
Dotfiles Backup Information
===========================
Backup Date: $(date)
Hostname: $(hostname)
User: $(whoami)
Source Directory: $DOTFILES_DIR
Backup Directory: $backup_dir

Git Information:
$(cd "$DOTFILES_DIR" && git log -1 --oneline 2>/dev/null || echo "Not a git repository")

System Information:
$(uname -a)

Installed Tools:
$(which zsh nvim tmux git 2>/dev/null || echo "Some tools not found")
EOF
    
    # Create archive
    local archive_name="dotfiles_$TIMESTAMP.tar.gz"
    local archive_path="$backup_base_dir/$archive_name"
    
    print_step "Creating archive: $archive_name"
    cd "$backup_base_dir"
    tar -czf "$archive_name" "dotfiles_$TIMESTAMP"
    
    # Calculate archive size
    local archive_size=$(du -h "$archive_path" | cut -f1)
    
    print_success "Backup created successfully!"
    print_step "Archive: $archive_path ($archive_size)"
    print_step "Directory: $backup_dir"
    
    # Clean up directory backup (keep only archive)
    read -p "Remove uncompressed backup directory? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$backup_dir"
        print_step "Uncompressed backup directory removed"
    fi
}

# List existing backups
list_backups() {
    local backup_base_dir=$(get_backup_dir "$@")
    
    if [ ! -d "$backup_base_dir" ]; then
        print_warning "No backup directory found: $backup_base_dir"
        return
    fi
    
    print_step "Existing backups in $backup_base_dir:"
    
    # List tar.gz files
    find "$backup_base_dir" -name "dotfiles_*.tar.gz" -exec ls -lh {} \; 2>/dev/null | \
        awk '{print $9, "(" $5 ", " $6 " " $7 " " $8 ")"}' | \
        sort -r
    
    # Count backups
    local backup_count=$(find "$backup_base_dir" -name "dotfiles_*.tar.gz" 2>/dev/null | wc -l)
    print_step "Total backups: $backup_count"
}

# Show usage
show_usage() {
    echo "Usage: $0 [command] [backup-location]"
    echo ""
    echo "Commands:"
    echo "  backup [location]  Create a new backup (default)"
    echo "  list [location]    List existing backups"
    echo "  help              Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                           # Create backup in default location"
    echo "  $0 backup ~/my-backups       # Create backup in custom location"
    echo "  $0 list                      # List backups in default location"
}

# Main script
main() {
    local command="backup"
    
    if [ $# -gt 0 ]; then
        case "$1" in
            backup)
                command="backup"
                shift
                ;;
            list)
                command="list"
                shift
                ;;
            help|--help|-h)
                show_usage
                exit 0
                ;;
            *)
                # Assume it's a backup location
                command="backup"
                ;;
        esac
    fi
    
    case "$command" in
        backup)
            create_backup "$@"
            ;;
        list)
            list_backups "$@"
            ;;
        *)
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"

