# Util Terminal Scripts

A comprehensive collection of dotfiles, shell scripts, and terminal configurations to supercharge development environments—primarily on Windows Subsystem for Linux (WSL).

## Directory Structure & Paths

This repository is divided into two main categories:

### 1. `config/` (Terminal Configuration)
Automated environment setup for an optimal Zsh + WSL2 experience.

**Files:**
- `config/install.sh`: Master installation script for Oh My Zsh, Powerlevel10k, and plugins.
- `config/update-windows-terminal.sh`: Automatically syncs Windows Terminal settings.
- `config/.p10k.zsh`: Powerlevel10k theme configuration file.
- `config/.zshrc`: Custom Zsh configurations and aliases.
- `config/windows-terminal/`: Contains the `settings.json` base configuration for Windows Terminal.

*See [`config/README.md`](./config/README.md) for detailed installation instructions.*

### 2. `utils/` (Utility Scripts)
A collection of handy terminal scripts for everyday use.

**Scripts:**
- `utils/dbopen`: Opens the current Git repo in your Databricks workspace.
- `utils/file_organizator`: Organizes files in your Downloads directory by extension.
- `utils/git_save`: A helper file to stage, commit, and push in a single command.
- `utils/mx`: Locates and opens the `.mpr` (Mendix Project) file in Mendix Studio Pro.
- `utils/pbi`: Recursively finds and opens the `.pbip` (Power BI) file.

*See [`utils/README.md`](./utils/README.md) for setup and usage.*

---

**Setup Tip**: Add the `utils/` folder to your `$PATH` in `.bashrc` or `.zshrc` to access these utility commands globally!
