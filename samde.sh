#!/bin/sh

# Checking if .config, .cache and .local is present and creating them if it's not.

[ -d $HOME/.local ] || mkdir $HOME/.local
[ -d $HOME/.config ] || mkdir $HOME/.config
[ -d $HOME/.cache ] || mkdir $HOME/.cache

# Enabling multilib, parallel downloads, color and the "Pacman" progress bar. 

sudo sed -i "93,94s/#//g;33s/#//g;37s/#//g" /etc/pacman.conf
sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

# Putting the number of threads of the system's CPU in makepkg.conf. 

sudo sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf

# Intalling base packages

sudo pacman --noconfirm --needed -Syu - < base.txt || error "Failed to install packages"

# Cloning and installing the yay AUR helper

git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin

# Change default shell to zsh, setting zsh to load user config files from .config and creating zsh history

sudo usermod -s /bin/zsh $USER
echo "export ZDOTDIR=\"\$HOME\"/.config/zsh" | sudo tee -a /etc/zsh/zshenv
mkdir $HOME/.cache/zsh
touch $HOME/.cache/zsh/history

# Installing dotfiles

git clone --separate-git-dir=$HOME/.config/dots https://gitlab.com/samdenton/dots.git tmpdots
rsync --recursive --verbose --exclude '.git' tmpdots/ $HOME/
rm -rf tmpdots
alias dot='/usr/bin/git --git-dir=$HOME/.config/dots --work-tree=$HOME'
dot config --local status.showUntrackedFiles no

# Cloning my suckless utils and compiling

git clone https://gitlab.com/samdenton/dwm.git $HOME/.local/src/dwm
sudo make clean install -C $HOME/.local/src/dwm

git clone https://gitlab.com/samdenton/dmenu.git $HOME/.local/src/dmenu
sudo make clean install -C $HOME/.local/src/dmenu

git clone https://gitlab.com/samdenton/st.git $HOME/.local/src/st
sudo make clean install -C $HOME/.local/src/st

git clone https://gitlab.com/samdenton/slstatus.git $HOME/.local/src/slstatus
sudo make clean install -C $HOME/.local/src/slstatus

# Installing AUR packages

yay -S lf-bin librewolf-bin papirus-folders-git

sudo papirus-folders -C indigo


echo
echo
echo 
echo
echo "The script is done. logout or reboot to apply all the changes"
echo
echo 
echo

