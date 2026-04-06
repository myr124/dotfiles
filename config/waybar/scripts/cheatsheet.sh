#!/usr/bin/env bash
# Display Hyprland keybind cheatsheet in terminal

clear
cat <<'EOF'
  ╔══════════════════════════════════════════════════╗
  ║           HYPRLAND  KEYBINDINGS                  ║
  ╚══════════════════════════════════════════════════╝

  APPS
  ─────────────────────────────────────────────────
  SUPER + RETURN         Terminal
  SUPER + E              File Manager
  SUPER + A              App Launcher
  SUPER + SHIFT + S      Screenshot (region)

  WINDOWS
  ─────────────────────────────────────────────────
  SUPER + Q              Kill active window
  SUPER + V              Toggle floating
  SUPER + P              Pseudo tile (dwindle)
  SUPER + J              Toggle split (dwindle)
  SUPER + ←/→/↑/↓       Move focus

  WORKSPACES
  ─────────────────────────────────────────────────
  SUPER + [1-10]         Switch to workspace
  SUPER + SHIFT + [1-10] Move window to workspace
  SUPER + Scroll         Cycle workspaces

  MOUSE
  ─────────────────────────────────────────────────
  SUPER + LMB            Move window
  SUPER + RMB            Resize window

  MEDIA
  ─────────────────────────────────────────────────
  XF86AudioRaise/Lower   Volume +/- 5%
  XF86AudioMute          Mute toggle
  XF86Brightness Up/Down Brightness +/- 5%
  XF86AudioNext/Prev     Next / Previous track
  XF86AudioPlay/Pause    Play / Pause

  ─────────────────────────────────────────────────
  Press q to close
EOF

read -n1 -s
