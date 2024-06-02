# Dotfiles
These are my personal dotfiles. I mostly use Arch and dabble in Nixos. Anything here is designed specifically to work on my machine, though I tend to attempt to make it work on 'any' configuration since mine changes so much. This repo is designed in such a way to work with GNU Stow

## Overview of my setup
- WM: Hyprland
- Shell: zsh
- Terminal: Kitty
- Bar: ags (Aylur's GTK Shell)
- Notifications: Mako
- Launcher: Rofi 
- Editor: neovim

## Dependencies
The below dependencies assume an Arch environment and thus I will use the name of the projects based on their main-repo or aur name. I don't personally differentiate between the aur and main repos, so I don't have them separated. This is also an incomplete list, this will allow the dots to "run." My Neovim has more dependencies than I dare list, between formatters and language servers.

```
aylurs-gtk-shell-git
grimblast-git
hyprland-git
kity
mako
neovim-git
obsidian-bin
ranger
rofi
sassc
swayosd-percentage-display-git
thunar
tmux
vivaldi
wl-clipboard
zsh
```
## Remove my awful dotfiles
If for whatever reason you don't know how to remove symlinks created by stow, you can use the follow command inside this repo to remove symlinks. This command assumes you used stow to create all of them, so you may need to modify it to specify the ones you make.
```bash
stow -D -t ~/ *
```

## Installation
### Using Stow without arguments
To use Stow without arguments you need to have this repo in your home folder, for example into a .dotfiles subdirectory
```bash 
cd ~
git clone https://github.com/timothycates/dotfiles .dotfiles
```
Once that's done you can just cd into your folder and use GNU Stow to manage the symlinks to the proper directories. For example to get my Alacritty config
```bash
cd .dotfiles
stow Alacritty
```
If you're interested in just taking my entire setup you can run
```bash
stow */
```

### Using Stow with arguments
Passing `d` and `t` to Stow will allow us to have our repository anywhere on the system. I prefer this method as I tend to have all my GitHub projects in
```bash
~/Documents/repos
```
First clone and cd into this repository wherever it suits you
```bash
cd ~/Documents/git
git clone https://github.com/timothycates/dotfiles dotfiles
cd dotfiles
```
Now we just need to pass in `t` so that Stow knows where to start the symlinks at.
```bash
stow -t ~/ Alacritty
```
For a quick reference `-t` determines where to put the symlinks and `-d` determines where to get them. For more information I recommend checking the man page on Stow.

## Todo

ags is insanely powerful, and I love what it brings to the table. Using it has been a joy, so I plan to adjust my setup to achieve these goals.

- [ ] Replace Mako with ags
- [ ] Replace Rofi with ags
- [ ] Create network-manager widget
- [ ] Create audio widget
- [ ] Create OSD 
- [ ] Create Power Menu

