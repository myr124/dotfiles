# dotfiles

Personal Hyprland dotfiles for CachyOS/Arch Linux.

## Setup

### Prerequisites

Install [paru](https://github.com/Morganamilo/paru), then run:

```bash
git clone https://github.com/myr124/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:
- Install all packages via paru
- Symlink configs to the right locations
- Set up SDDM with the Silent theme
- Apply GTK and icon themes
- Set Papirus-Dark folder colors

After install, set your wallpaper:

```bash
setwallpaper ~/path/to/wallpaper.jpg
```

---

## Stack

| Role | Tool |
|------|------|
| Compositor | [Hyprland](https://hyprland.org) |
| Bar | [Waybar](https://github.com/Alexays/Waybar) |
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| Shell | [Fish](https://fishshell.com) + [Starship](https://starship.rs) |
| App Launcher | [Fuzzel](https://codeberg.org/dnkl/fuzzel) |
| Notifications | [Mako](https://github.com/emersion/mako) |
| Theming | [pywal16](https://github.com/eylles/pywal16) |
| GTK Theme | [adw-gtk-theme](https://github.com/lassekongo83/adw-gtk3) |
| Icons | [Papirus-Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
| Cursor | Breeze Snow |
| Display Manager | [SDDM](https://github.com/sddm/sddm) + [SilentSDDM](https://github.com/uiriansan/SilentSDDM) |
| File Manager | Nautilus |
| Wallpaper | [awww](https://github.com/LGFae/swww) |
| Night Light | [hyprsunset](https://github.com/hyprwm/hyprsunset) |

---

## Theming

Colors are generated from your wallpaper using pywal16. Running `setwallpaper` will:

1. Set the desktop wallpaper via awww
2. Generate a color scheme with pywal
3. Patch the background color to neutral (removes pywal's teal saturation bias)
4. Re-export all templates (terminal, waybar, fuzzel, etc.)
5. Regenerate GTK CSS and reload GTK apps
6. Reload mako notification colors
7. Sync the wallpaper to SDDM

---

## Waybar

- **Left** — User, workspaces, active window
- **Center** — Idle inhibitor, clock
- **Right** — Media, network, bluetooth, updates, night light, brightness, battery, keybindings, power, audio

Click the `󰌌` icon for a keybindings cheatsheet.

---

## Structure

```
dotfiles/
├── install.sh
├── packages.txt
├── config/
│   ├── hypr/
│   │   ├── hyprland.conf
│   │   └── scripts/
│   │       └── setwallpaper
│   ├── wal/
│   │   └── postrun
│   ├── waybar/
│   ├── fish/
│   ├── kitty/
│   ├── fuzzel/
│   ├── mako/
│   ├── wlogout/
│   └── starship.toml
└── sddm/
    └── silent-default.conf
```
