<div align="center">

# My NixOS dots
### It will end up like this!:  
  
<img src="https://github.com/nexxtdragon/dotfiles/blob/main/screenshot.png?raw=true" height="400">
</div>

## Instructions:
1. Put configuration.nix in /etc/nixos
2. Put home.nix in ~/.config/home-manager (if this directory doesn't exist, create one) **!! might be not working, so i also put classic configs in this repo**
3. Run ```nixos-rebuild switch``` and ```home-manager build```
4. Change the wallpaper
5. Done! If something is off, you can also install my configs in the classic way!

## Additional:
- Add the **unstable** channel: ```sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos```, ```sudo nix-channel --update```
- Remove ```unstable.amnezia-vpn``` from the package list if you encounter errors about it

<br>

<div align="center">

# Alternative - If you're not on NixOS, or home.nix won't work, you can install my configs manually! See the repo for dotfiles
</div>


## GNOME Settings:

### Extensions:
- Blur my Shell
- Compiz windows effect
- Dash to Dock
- Lockscreen Extension
- Logo Menu
- Media Label and Controls (Mpris Label)
- System monitor

### Tweaks:
- Font - JetBrains Mono NL Semi-Bold
- Cursor - Nordic-cursors
- Icons - Tela-circle-dark
- Titlebar Buttons - Minimize and close only
- Center new windows - on

### Settings:
- All defaults, just enable dark mode and change the wallpaper
