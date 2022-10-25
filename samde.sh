#!/bin/sh

utils=(dwm dmenu st slstatus dnote)
folders=(.local .config .cache .cache/zsh)

for i in "${folders[@]}"; do [ -d $HOME/$i ] || mkdir $HOME/$i; done

sudo sed -i "93,94s/#//g;33s/#//g;37s/#//g" /etc/pacman.conf
sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sudo sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf

sudo pacman -Syu --noconfirm
sudo pacman --noconfirm --needed -S - < core.txt || error "Failed to install packages"
sudo pacman --noconfirm --needed -S - < pkgs.txt || error "Failed to install packages"

sudo usermod -s /bin/zsh $USER
echo "export ZDOTDIR=\"\$HOME\"/.config/zsh" | sudo tee -a /etc/zsh/zshenv
touch $HOME/.cache/zsh/history

git clone --depth 1 --separate-git-dir=$HOME/.config/dots https://gitlab.com/samdenton/dots.git tmpdots
rsync --recursive --verbose --exclude '.git' tmpdots/ $HOME/
rm -rf tmpdots
/usr/bin/git --git-dir=$HOME/.config/dots --work-tree=$HOME config --local status.showUntrackedFiles no

for i in "${utils[@]}"
do 
    git clone --depth 1 https://gitlab.com/samdenton/$i.git $HOME/.local/src/$i
    sudo make clean install -C $HOME/.local/src/$i
done


git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
yay -S lf-bin papirus-folders-git
sudo papirus-folders -C indigo

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c "PlugInstall|q|q"

printf "\033c The script is done. logout or reboot to apply all the changes"

