# Arch Hyprland Dotfiles

This repository contains the configuration files for a minimalist Arch Linux environment, optimized for Docker workflows and a persistent terminal experience.

## Core Components

* **Window Manager**: Hyprland
* **Status Bar**: Waybar (with custom RAM and Docker modules)
* **Application Launcher**: Rofi
* **Terminal**: Alacritty
* **Multiplexer**: Tmux (launched by default via shell)
* **Prompt**: Starship (Minimalist style)
* **Display Manager**: SDDM (Customized Pixie theme)
* **Font**: JetBrainsMono Nerd Font

## Repository Structure

* `.config/hypr`: Keybinds, monitors, and window rules
* `.config/waybar`: Layout and CSS style for the top bar
* `.config/alacritty`: Transparency, padding, and Tokyo Night colors
* `.config/rofi`: Launcher theme and configuration
* `.config/starship.toml`: Clean and minimalist prompt configuration
* `.tmux.conf`: Custom status bar (Cyan) and session management
* `sddm/`: Modified Pixie theme with fixed color extraction and French date
* `pkglist.txt`: List of official pacman packages
* `install.sh`: Automated deployment script

## Installation

### 1. Prerequisites
This setup is specifically built for Arch Linux. Ensure you have git installed before starting.

### 2. Deployment
Clone the repository and run the installation script. It will install the required packages and create symbolic links for your configuration.

```bash
git clone https://github.com/ThomasObein/arch_dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 3. SDDM Theme Setup
Since SDDM requires root permissions and specific paths, the theme must be copied to the system directory:
```bash
sudo mkdir -p /usr/share/sddm/themes/
sudo cp -r ~/dotfiles/sddm/pixie /usr/share/sddm/themes/
echo -e "[Theme]\nCurrent=pixie" | sudo tee /etc/sddm.conf.d/theme.conf
```

## Keybindings (azerty controls)
* mod + Enter: Open Alacritty (Tmux starts automatically)
* mod + Space: Toggle split orientation (Horizontal/Vertical)
* mod + D: Launch Rofi application menu
* mod + SHIFT + A: Close active window
* mod + M: Exit Hyprland
* mod + T: Toggle floating modev
* mod + F : Fullscreen mode
* mod + W : wallpaper picker
* mod + SHIFT + E : logout menu
