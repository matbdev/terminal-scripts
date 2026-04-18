# Terminal Configuration (Dotfiles)

This folder stores the configuration for a productive development environment on Windows using WSL2. The goal is to allow a quick and automated setup on a new machine.

*(Tip: Take a screenshot of your terminal and replace the image link above!)*

### Components

* **Terminal:** Windows Terminal
* **Shell:** Zsh
* **Framework:** Oh My Zsh
* **Prompt:** Powerlevel10k
* **Plugins:**
    * `git` (native to OMZ)
    * `zsh-autosuggestions`
    * `zsh-syntax-highlighting`
    * `zsh-completions`

### Project Files

- `.p10k.zsh`: Powerlevel10k configuration file.
- `.zshrc`: Custom Zsh configurations and aliases.
- `install.sh`: Master installation script.
- `update-windows-terminal.sh`: Modifies local Windows Terminal setups automatically.
- `windows-terminal/`: Contains the base JSON settings for the terminal.

---

## 🚀 Fresh Installation

Follow these steps to set up an identical environment from scratch.

### 1. Prerequisites (Manual Steps)

Before running the scripts, a few items must be installed manually.

#### a. Install WSL2 and Ubuntu

Follow the [official Microsoft guide](https://docs.microsoft.com/en-us/windows/wsl/install) to install WSL2 and **Ubuntu**.

#### b. Install Windows Terminal

Install **Windows Terminal** via the [Microsoft Store](https://aka.ms/terminal).

#### c. Install the Font (ESSENTIAL)

For the Powerlevel10k icons to work properly, you **must** install a "Nerd Font". The recommended one is `MesloLGS NF`.

1.  Download the four font files:
    * [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    * [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    * [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    * [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
2.  On Windows, select the four files, right-click, and choose **Install for all users**.

### 2. Automated Installation

The `install.sh` script handles almost everything else.

1.  **Clone the main repository:**
    ```bash
    git clone https://github.com/matbdev/util-terminal-scripts.git ~/util-terminal-scripts
    ```

2.  **Navigate to the config folder and execute the scripts:**
    ```bash
    cd ~/util-terminal-scripts/config
    chmod +x install.sh
    chmod +x update-windows-terminal.sh
    ./install.sh
    ./update-windows-terminal.sh
    ```
    This script will install Oh My Zsh, the Powerlevel10k theme, all custom plugins, link your configuration files (`.zshrc`, `.p10k.zsh`), and automatically update your Windows Terminal settings.

### 3. Final Configuration (Manual Steps)

1.  **Configure the Windows Terminal Font:**
    * Open **Windows Terminal**, go to **Settings** (`Ctrl` + `,`).
    * In your Ubuntu profile, under the **Appearance** tab, select the `MesloLGS NF` font.
    * Save changes.

2.  **Set Zsh as the default shell:**
    ```bash
    chsh -s $(which zsh)
    ```

3.  **RESTART THE TERMINAL!** Close all windows and open them again. Your new environment is ready!

---

## 🔧 Maintenance and Customization

* **Change the prompt UI:** Run the `p10k configure` command. This will update your `.p10k.zsh` file.
* **Add/Remove plugins:**
    1.  Find the plugin on GitHub and clone it to the `~/.oh-my-zsh/custom/plugins/` folder.
    2.  Add the plugin name to the `plugins=(...)` list in your `~/.zshrc` file.