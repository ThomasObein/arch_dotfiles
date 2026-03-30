#!/bin/bash

DOTFILES_DIR=$(pwd)

echo "Begining installation..."

# 1. System update
sudo pacman -Syu --noconfirm

# 2. Install yay
if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed base-devel git --noconfirm
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm && cd $DOTFILES_DIR
fi

# 3. Installing packages
echo "Installing packages..."
pacman -S --needed --noconfirm - < pkglist.txt

# 4. Création des liens symboliques (Symlinks)
echo "Linking configuration files..."
mkdir -p ~/.config

# Linking each directory
for dir in .config/*; do
    ln -sfn "$DOTFILES_DIR/$dir" "$HOME/.config/$(basename "$dir")"
done

# starship configuration
ls -sf "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml

# /home root files
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc

# 5. pixie-sddm
echo "Configuring sddm..."
sudo mkdir -p /usr/share/sddm/themes/
sudo cp -r "$DOTFILES_DIR/pixie-sddm" /usr/share/sddm/themes/pixie
echo -e "[Theme]\nCurrent=pixie" | sudo tee /etc/sddm.conf

echo "Done. You should reboot your computer."
