#!/bin/bash

# =============================================================================
# Dotfiles Sync Script
# =============================================================================
# Syncs dotfiles to git repository with automatic commit and push
# Usage: ./sync-dotfiles.sh [commit-message]

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_DIR="$HOME/.config"
REMOTE_NAME="origin"
DEFAULT_BRANCH="main"

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

# Check if we're in a git repository
check_git_repo() {
    if ! git -C "$DOTFILES_DIR" rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Not a git repository: $DOTFILES_DIR"
        exit 1
    fi
}

# Get commit message
get_commit_message() {
    if [ $# -eq 0 ]; then
        echo "Update dotfiles $(date '+%Y-%m-%d %H:%M:%S')"
    else
        echo "$*"
    fi
}

# Check for uncommitted changes
check_status() {
    cd "$DOTFILES_DIR"
    
    if ! git diff --quiet || ! git diff --cached --quiet; then
        print_step "Found uncommitted changes"
        git status --porcelain
        return 0
    else
        print_warning "No changes to commit"
        return 1
    fi
}

# Show what will be committed
show_changes() {
    cd "$DOTFILES_DIR"
    
    print_step "Changes to be committed:"
    git diff --name-status HEAD
    
    echo
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Sync cancelled by user"
        exit 0
    fi
}

# Main sync function
sync_dotfiles() {
    cd "$DOTFILES_DIR"
    
    local commit_message=$(get_commit_message "$@")
    
    print_step "Syncing dotfiles..."
    
    # Add all changes
    print_step "Adding changes..."
    git add .
    
    # Commit changes
    print_step "Committing changes..."
    git commit -m "$commit_message"
    
    # Push to remote
    print_step "Pushing to remote..."
    if git push "$REMOTE_NAME" "$DEFAULT_BRANCH"; then
        print_success "Dotfiles synced successfully!"
        print_step "Latest commit: $(git log -1 --oneline)"
    else
        print_error "Failed to push to remote"
        exit 1
    fi
}

# Main script
main() {
    print_step "Starting dotfiles sync..."
    
    check_git_repo
    
    if check_status; then
        show_changes
        sync_dotfiles "$@"
    fi
    
    print_success "Dotfiles sync complete!"
}

# Run main function with all arguments
main "$@"

