#!/bin/bash

echo "🔄 Backing up essential VS Code settings..."

# Output folder (relative to where script is run)
BACKUP_DIR="./vscode-backup"
mkdir -p "$BACKUP_DIR/snippets"

# Detect User settings directory
if [ -d "$HOME/.config/Code/User" ]; then
  VSCODE_USER_DIR="$HOME/.config/Code/User"
elif [ -d "$HOME/Library/Application Support/Code/User" ]; then
  VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
elif [ -n "$APPDATA" ] && [ -d "$APPDATA/Code/User" ]; then
  VSCODE_USER_DIR="$APPDATA/Code/User"
else
  echo "❌ Could not find VS Code settings directory."
  exit 1
fi

# Copy essential files
cp "$VSCODE_USER_DIR/settings.json" "$BACKUP_DIR/" 2>/dev/null
cp "$VSCODE_USER_DIR/keybindings.json" "$BACKUP_DIR/" 2>/dev/null
cp -r "$VSCODE_USER_DIR/snippets/" "$BACKUP_DIR/snippets/" 2>/dev/null

# Export extensions list
code --list-extensions | tee "$BACKUP_DIR/extensions.txt" > /dev/null

echo "✅ Backup complete! Files saved to: $BACKUP_DIR"
