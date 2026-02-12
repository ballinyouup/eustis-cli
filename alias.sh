#!/bin/bash

PATH_TO_CLI=$1

# Detect current shell
CURRENT_SHELL=$(basename "$SHELL")

# Function to add or update alias in a shell config file
add_or_update_alias() {
    local file=$1
    if [ -f "$file" ]; then
        # Remove existing eustis alias if present
        sed -i '' '/alias eustis=/d' "$file" 2>/dev/null || sed -i '/alias eustis=/d' "$file"
        # Add new alias
        echo "alias eustis='python $PATH_TO_CLI/main.py'" >> "$file"
    fi
}

# Add alias only to the detected shell's config file
case "$CURRENT_SHELL" in
    zsh)
        add_or_update_alias ~/.zshrc
        ;;
    bash)
        add_or_update_alias ~/.bashrc
        ;;
    *)
        # Fallback: try both if shell is unknown
        add_or_update_alias ~/.zshrc
        add_or_update_alias ~/.bashrc
        ;;
esac
