#!/bin/bash

utils=(dwm dmenu st slstatus dnote)
folders=(.local .config .cache/zsh .cache/mpd)

# Check for folders and creates them if absent
for i in "${folders[@]}"; do [ -d $HOME/$i ] || mkdir -p $HOME/$i; done

# Enable Color, ParallelDownloads, ILoveCandy and adds the number of cpu threads in makepkg.conf
sudo sed -i "/Color/s/^#//;/Parallel/s/^#//;/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sudo sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf

# Install programs in pkg.txt
sudo pacman -Syu --noconfirm
sudo pacman --noconfirm --needed -S - < pkgs.txt || error "Failed to install packages"

# Make zsh the default shell
sudo usermod -s /bin/zsh $USER
echo "export ZDOTDIR=\"\$HOME\"/.config/zsh" | sudo tee -a /etc/zsh/zshenv
touch $HOME/.cache/zsh/history

# Clone dotfiles and put them in .config
git clone --depth 1 --separate-git-dir=$HOME/.config/.dots https://gitlab.com/samdenton/dots.git tmpdots
rsync --recursive --verbose --exclude '.git' tmpdots/ $HOME/
rm -rf tmpdots
/usr/bin/git --git-dir=$HOME/.config/.dots --work-tree=$HOME config --local status.showUntrackedFiles no
ln -sf $HOME/.config/x11/profiles/1080p.Xresources $HOME/.config/x11/xresources
ln -sf $HOME/.config/x11/colorschemes/Luna.Xresources $HOME/.config/x11/xcolors

git clone --depth 1 https://gitlab.com/samdenton/wallpapers.git $HOME/.local/share/wallpapers
ln -sf $HOME/.local/share/wallpapers/Luna.png $HOME/.config/x11/wall

# Clone suckless utilities and compile
for i in "${utils[@]}"
do 
    git clone --depth 1 https://gitlab.com/samdenton/$i.git $HOME/.local/src/$i
    sudo make install -C $HOME/.local/src/$i
done

# Install the yay AUR helper
git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
yay -S devour nsxiv librewolf-bin

# Install papirus icon theme and folder colors
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
$HOME/.local/bin/papirus-folders -C indigo

# Install GTK themes
git clone --depth 1 https://gitlab.com/samdenton/themes.git $HOME/.local/share/themes

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c "PlugInstall|q|q"

# Enable firewall
sudo systemctl enable ufw
sudo ufw default deny
sudo ufw enable

# Install FT-Labs picom
sudo pacman -S meson cmake libev uthash
git clone --depth 1 https://github.com/FT-Labs/picom && cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
cp build/src/picom $HOME/.local/bin
cd .. && rm -rf picom/

# Asks if this is being installed in a virtual machine and disabling picom the answer is yes.
# Picom doesn't seem to work in VMs anymore, even with vsync disabled.
printf "\033c"
echo
while true ; do
        read -p "Are you installing this in a virtual machine? (y/n): " answer
    case $answer in
        
        y) sed -i '/picom/s/^/#/g' $HOME/.config/x11/xinitrc
           echo "Disabled picom. Picom doesn't seem to work in virtual machines"
           break;;

        n) break;;

        *) echo "Enter y or n";;
esac
done

printf "The script is done. logout or reboot to apply all changes.\n"
