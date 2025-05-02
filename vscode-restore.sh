#!/bin/bash

echo "🔄 Restoring VS Code settings..."

# Backup directory (relative to script location)
BACKUP_DIR="./vscode-backup"

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

# Copy essential files if they exist in backup
[ -f "$BACKUP_DIR/settings.json" ] && cp "$BACKUP_DIR/settings.json" "$VSCODE_USER_DIR/"
[ -f "$BACKUP_DIR/keybindings.json" ] && cp "$BACKUP_DIR/keybindings.json" "$VSCODE_USER_DIR/"
[ -d "$BACKUP_DIR/snippets" ] && cp -r "$BACKUP_DIR/snippets/" "$VSCODE_USER_DIR/"

# Restore extensions
if [ -f "$BACKUP_DIR/extensions.txt" ]; then
  echo "📦 Reinstalling extensions..."
  cat "$BACKUP_DIR/extensions.txt" | xargs -n 1 code --install-extension
else
  echo "⚠️ extensions.txt not found. Skipping extension install."
fi

echo "✅ Restore complete!"
