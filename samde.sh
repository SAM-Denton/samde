#!/bin/sh

utils=(dwm dmenu st slstatus dnote)
folders=(.local .config .cache .cache/zsh .cache/mpd)

# Checking for folders and creating them if they're absent
for i in "${folders[@]}"; do [ -d $HOME/$i ] || mkdir $HOME/$i; done

# Enabling multilib, ILoveCandy and adding the number of cpu threads in makepkg.conf
sudo sed -i "93,94s/#//g;33s/#//g;37s/#//g" /etc/pacman.conf
sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sudo sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf

# Installing programs in pkg.txt
sudo pacman -Syu --noconfirm
sudo pacman --noconfirm --needed -S - < pkgs.txt || error "Failed to install packages"

# Making zsh the default shell
sudo usermod -s /bin/zsh $USER
echo "export ZDOTDIR=\"\$HOME\"/.config/zsh" | sudo tee -a /etc/zsh/zshenv
touch $HOME/.cache/zsh/history

# Cloning dotfiles and putting them in .config
git clone --depth 1 --separate-git-dir=$HOME/.config/dots https://gitlab.com/samdenton/dots.git tmpdots
rsync --recursive --verbose --exclude '.git' tmpdots/ $HOME/
rm -rf tmpdots
/usr/bin/git --git-dir=$HOME/.config/dots --work-tree=$HOME config --local status.showUntrackedFiles no
ln -sf $HOME/.config/x11/profiles/Default.Xresources $HOME/.config/x11/xresources
ln -sf $HOME/.config/x11/themes/Kasugano.Xresources $HOME/.config/x11/xcolors

git clone --depth 1 https://gitlab.com/samdenton/wallpapers.git $HOME/.local/share/wallpapers
ln -sf $HOME/.local/share/wallpapers/wallhaven-pkmj69-HD.png $HOME/.config/x11/wall

# Cloning my suckless utilities and compiling
for i in "${utils[@]}"
do 
    git clone --depth 1 https://gitlab.com/samdenton/$i.git $HOME/.local/src/$i
    sudo make clean install -C $HOME/.local/src/$i
done

# Installing the yay aur helper
git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin

# Installing papirus icon theme and folder colors
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh
papirus-folders -C indigo

# Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c "PlugInstall|q|q"

printf "\033c The script is done. logout or reboot to apply all the changes\n"
