#!/bin/bash

# =============================================================================
# Project Directory Organization Script
# =============================================================================
# Creates and manages a standardized project directory structure
# Usage: ./organize-projects.sh [command] [project-name]

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PROJECTS_ROOT="$HOME/Projects"
TEMPLATES_DIR="$HOME/.config/project-templates"

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

# Create project directory structure
create_project() {
    local project_name="$1"
    local project_type="${2:-default}"
    
    if [[ -z "$project_name" ]]; then
        print_error "Project name is required"
        exit 1
    fi
    
    local project_path="$PROJECTS_ROOT/$project_name"
    
    if [[ -d "$project_path" ]]; then
        print_warning "Project directory already exists: $project_path"
        return 1
    fi
    
    print_step "Creating project: $project_name"
    mkdir -p "$project_path"
    
    # Create standard directories
    local dirs=(
        "src"
        "docs"
        "tests"
        "scripts"
        "assets"
        ".github"
    )
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$project_path/$dir"
    done
    
    # Create standard files
    cat > "$project_path/README.md" << EOF
# $project_name

## Description
A brief description of your project.

## Installation
\`\`\`bash
# Installation instructions
\`\`\`

## Usage
\`\`\`bash
# Usage examples
\`\`\`

## Contributing
Instructions for contributing to this project.

## License
License information.
EOF
    
    cat > "$project_path/.gitignore" << EOF
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Dependencies
node_modules/
vendor/

# Build outputs
build/
dist/
out/
target/

# Environment files
.env
.env.local
.env.*.local

# Cache
.cache/
.parcel-cache/

# Temporary files
tmp/
temp/
EOF
    
    # Project-specific setup
    case "$project_type" in
        "web")
            create_web_project "$project_path"
            ;;
        "python")
            create_python_project "$project_path"
            ;;
        "node")
            create_node_project "$project_path"
            ;;
        "go")
            create_go_project "$project_path"
            ;;
        *)
            create_default_project "$project_path"
            ;;
    esac
    
    # Initialize git repository
    cd "$project_path"
    git init
    git add .
    git commit -m "Initial commit: Project structure"
    
    print_success "Project created: $project_path"
    print_step "Navigate to project: cd $project_path"
}

# Create web project specific files
create_web_project() {
    local project_path="$1"
    
    mkdir -p "$project_path/src/components"
    mkdir -p "$project_path/src/styles"
    mkdir -p "$project_path/public"
    
    cat > "$project_path/src/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$(basename "$project_path")</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <h1>Welcome to $(basename "$project_path")</h1>
    <script src="js/main.js"></script>
</body>
</html>
EOF
    
    mkdir -p "$project_path/src/js"
    touch "$project_path/src/js/main.js"
    touch "$project_path/src/styles/main.css"
}

# Create Python project specific files
create_python_project() {
    local project_path="$1"
    local project_name=$(basename "$project_path")
    
    mkdir -p "$project_path/$project_name"
    
    cat > "$project_path/requirements.txt" << EOF
# Add your Python dependencies here
EOF
    
    cat > "$project_path/setup.py" << EOF
from setuptools import setup, find_packages

setup(
    name="$project_name",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        # Add dependencies here
    ],
)
EOF
    
    touch "$project_path/$project_name/__init__.py"
    touch "$project_path/$project_name/main.py"
}

# Create Node.js project specific files
create_node_project() {
    local project_path="$1"
    local project_name=$(basename "$project_path")
    
    cat > "$project_path/package.json" << EOF
{
  "name": "$project_name",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "dev": "nodemon index.js",
    "test": "jest"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
EOF
    
    touch "$project_path/index.js"
}

# Create Go project specific files
create_go_project() {
    local project_path="$1"
    local project_name=$(basename "$project_path")
    
    cat > "$project_path/go.mod" << EOF
module $project_name

go 1.21
EOF
    
    cat > "$project_path/main.go" << EOF
package main

import "fmt"

func main() {
    fmt.Println("Hello, $project_name!")
}
EOF
}

# Create default project
create_default_project() {
    local project_path="$1"
    
    cat > "$project_path/Makefile" << EOF
.PHONY: help build test clean

help:
	@echo "Available commands:"
	@echo "  build  - Build the project"
	@echo "  test   - Run tests"
	@echo "  clean  - Clean build artifacts"

build:
	@echo "Building project..."

test:
	@echo "Running tests..."

clean:
	@echo "Cleaning up..."
EOF
}

# List projects
list_projects() {
    if [[ ! -d "$PROJECTS_ROOT" ]]; then
        print_warning "Projects directory doesn't exist: $PROJECTS_ROOT"
        return 1
    fi
    
    print_step "Projects in $PROJECTS_ROOT:"
    
    find "$PROJECTS_ROOT" -maxdepth 1 -type d -not -path "$PROJECTS_ROOT" | \
        sort | \
        while read -r project; do
            local project_name=$(basename "$project")
            local git_info=""
            
            if [[ -d "$project/.git" ]]; then
                cd "$project"
                local branch=$(git branch --show-current 2>/dev/null || echo "unknown")
                local last_commit=$(git log -1 --format="%cr" 2>/dev/null || echo "no commits")
                git_info=" (git: $branch, $last_commit)"
            fi
            
            echo "  📁 $project_name$git_info"
        done
}

# Open project in editor
open_project() {
    local project_name="$1"
    
    if [[ -z "$project_name" ]]; then
        print_error "Project name is required"
        exit 1
    fi
    
    local project_path="$PROJECTS_ROOT/$project_name"
    
    if [[ ! -d "$project_path" ]]; then
        print_error "Project not found: $project_path"
        exit 1
    fi
    
    print_step "Opening project: $project_name"
    
    # Open in preferred editor
    if command -v code >/dev/null 2>&1; then
        code "$project_path"
    elif command -v nvim >/dev/null 2>&1; then
        cd "$project_path"
        nvim .
    else
        cd "$project_path"
        print_step "Navigated to: $project_path"
    fi
}

# Show usage
show_usage() {
    echo "Project Directory Organization Script"
    echo ""
    echo "Usage: $0 [command] [options]"
    echo ""
    echo "Commands:"
    echo "  create [name] [type]  Create a new project"
    echo "  list                  List existing projects"
    echo "  open [name]           Open project in editor"
    echo "  help                  Show this help message"
    echo ""
    echo "Project types:"
    echo "  default               Basic project structure"
    echo "  web                   Web development project"
    echo "  python                Python project"
    echo "  node                  Node.js project"
    echo "  go                    Go project"
    echo ""
    echo "Examples:"
    echo "  $0 create my-website web"
    echo "  $0 create my-api python"
    echo "  $0 list"
    echo "  $0 open my-website"
}

# Main script
main() {
    # Ensure projects directory exists
    mkdir -p "$PROJECTS_ROOT"
    
    local command="${1:-help}"
    
    case "$command" in
        "create")
            create_project "$2" "$3"
            ;;
        "list")
            list_projects
            ;;
        "open")
            open_project "$2"
            ;;
        "help"|"--help"|"-h")
            show_usage
            ;;
        *)
            print_error "Unknown command: $command"
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"

