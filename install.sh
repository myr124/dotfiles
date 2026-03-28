#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing packages..."
if ! command -v paru &>/dev/null; then
    echo "paru not found. Install it first: https://github.com/Morganamilo/paru"
    exit 1
fi
paru -S --needed $(grep -v '^#' "$DOTFILES/packages.txt" | grep -v '^$')

echo "==> Linking configs..."
link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  $dst -> $src"
}

link "$DOTFILES/config/hypr/hyprland.conf"       "$HOME/.config/hypr/hyprland.conf"
link "$DOTFILES/config/wal/postrun"               "$HOME/.config/wal/postrun"
link "$DOTFILES/config/fish/config.fish"          "$HOME/.config/fish/config.fish"
link "$DOTFILES/config/kitty/kitty.conf"          "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES/config/fuzzel/fuzzel.ini"         "$HOME/.config/fuzzel/fuzzel.ini"
# fuzzel_theme.ini is a pywal symlink, not a dotfile
ln -sf "$HOME/.cache/wal/colors-fuzzel.ini" "$HOME/.config/fuzzel/fuzzel_theme.ini"
link "$DOTFILES/config/wlogout/layout"            "$HOME/.config/wlogout/layout"
link "$DOTFILES/config/wlogout/style.css"         "$HOME/.config/wlogout/style.css"
link "$DOTFILES/config/starship.toml"             "$HOME/.config/starship.toml"
link "$DOTFILES/config/hypr/scripts/setwallpaper" "$HOME/.config/hypr/scripts/setwallpaper"

# waybar theme.css is a pywal symlink
ln -sf "$HOME/.cache/wal/colors-waybar.css" "$HOME/.config/waybar/theme.css"

echo "==> Making wal postrun executable..."
chmod +x "$HOME/.config/wal/postrun"

echo "==> Setting up SDDM silent theme..."
sudo cp "$DOTFILES/sddm/silent-default.conf" /usr/share/sddm/themes/silent/configs/default.conf
sudo tee /etc/sddm.conf > /dev/null <<EOF
[Autologin]
Session=hyprland

[Theme]
Current=silent

[General]
InputMethod=qtvirtualkeyboard

[General]
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard
EOF

echo "==> Setting GTK and icon theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "==> Applying papirus folder colors..."
papirus-folders -C grey --theme Papirus-Dark

echo "==> Done! Run 'wal -i ~/wallpapers/wallpaper.jpg' to generate colors."
