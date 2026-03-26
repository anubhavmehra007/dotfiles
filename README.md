# dotfiles

Personal dotfiles for an Arch-based (CachyOS) Hyprland setup with Catppuccin Mocha theming.

## What's included

| Program | Purpose |
|---------|---------|
| **Hyprland** | Wayland compositor |
| **Waybar** | Status bar |
| **Kitty** | Terminal emulator |
| **Emacs** | Editor (with simpc-mode for C/C++) |
| **Fish** | Shell |
| **MPD + rmpc** | Music player daemon + TUI client |

## Setup

### 1. Install packages

```bash
sudo pacman -S hyprland waybar kitty emacs fish mpd mpc rmpc clang
```

### 2. Install fonts

```bash
sudo pacman -S ttf-ibm-plex ttf-jetbrains-mono-nerd
```

### 3. Clone and deploy

```bash
# Backup existing configs
[ -d ~/.config/hypr ] && mv ~/.config/hypr ~/.config/hypr.bak
[ -d ~/.config/waybar ] && mv ~/.config/waybar ~/.config/waybar.bak
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.bak
[ -d ~/.config/emacs ] && mv ~/.config/emacs ~/.config/emacs.bak
[ -d ~/.config/fish ] && mv ~/.config/fish ~/.config/fish.bak
[ -d ~/.config/mpd ] && mv ~/.config/mpd ~/.config/mpd.bak
[ -d ~/.config/rmpc ] && mv ~/.config/rmpc ~/.config/rmpc.bak
[ -d ~/.config/scripts ] && mv ~/.config/scripts ~/.config/scripts.bak

# Clone
git clone https://github.com/anubhavmehra007/dotfiles.git /tmp/dotfiles

# Copy configs
cp -r /tmp/dotfiles/hypr ~/.config/
cp -r /tmp/dotfiles/waybar ~/.config/
cp -r /tmp/dotfiles/kitty ~/.config/
cp -r /tmp/dotfiles/emacs ~/.config/
cp -r /tmp/dotfiles/fish ~/.config/
cp -r /tmp/dotfiles/mpd ~/.config/
cp -r /tmp/dotfiles/rmpc ~/.config/
cp -r /tmp/dotfiles/scripts ~/.config/
chmod +x ~/.config/scripts/*.sh

# Remove .emacs and .emacs.d so Emacs uses ~/.config/emacs/
rm -f ~/.emacs ~/.emacs.el
rm -rf ~/.emacs.d

# Clean up
rm -rf /tmp/dotfiles
```

### 4. Set up MPD

```bash
mkdir -p ~/Music/mpd_master ~/.config/mpd/playlists
systemctl --user enable --now mpd
```

### 5. Install fish plugin

```bash
# Install fisher (fish plugin manager)
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Install nvm plugin
fish -c "fisher install jorgebucaran/nvm.fish"
```

### 6. Launch

Log out and select Hyprland as your session, or if already in Hyprland:

```bash
# Reload waybar
killall waybar && waybar &

# Emacs packages install automatically on first launch
emacs
```

## Notes

- Emacs requires `XDG_CONFIG_HOME=$HOME/.config` to find its init file (set in `hypr/hyprland.conf`)
- MPD binds to `0.0.0.0:6600` for LAN access -- restrict to `127.0.0.1` if not needed
- Waybar uses IBM Plex Mono with JetBrainsMono Nerd Font as icon fallback
- The FIFO output in MPD is for audio visualizers (cava in rmpc)
