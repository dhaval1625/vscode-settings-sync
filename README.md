# VS Code Settings Sync 🧩

Easily back up and restore your personal Visual Studio Code setup — including settings, keybindings, snippets, and extensions.

## 🔧 Features

- Backup essential VS Code config to a local folder
- Restore settings and extensions on any machine
- Lightweight and GitHub-friendly (no heavy cache or state files)
- Ideal for developers switching machines or GitHub profiles

## 📁 What Gets Backed Up

- `settings.json`
- `keybindings.json`
- All custom snippets (`snippets/`)
- Installed extensions (`extensions.txt`)

## 🚀 Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/YOUR_USERNAME/vscode-settings-sync.git
cd vscode-settings-sync
```

### 2. Backup Your Current Setup
./vscode-backup.sh

### 3. Restore Setup on Another Machine
./vscode-restore.sh

## 📌 Notes
- Make sure code CLI is available. Run Shell Command: Install 'code' command in PATH from the command palette in VS Code.
- Tested on macOS, Linux, and Windows with Git Bash.