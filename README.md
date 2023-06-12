# SÅM's Åwesome Minimal Desktop Environment
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/luna.jpg">

## Introduction
This is an Arch Linux post installation script that installs a desktop environment that uses of custom builds of [suckless](https://suckless.org) software: [dwm](https://gitlab.com/SamDenton/dwm), [dmenu](https://gitlab.com/SamDenton/dmenu), [st](https://gitlab.com/SamDenton/st) , [dnote](https://gitlab.com/SamDenton/dnote) [slstatus](https://gitlab.com/SamDenton/slstatus) and [slock](https://gitlab.com/SamDenton/slock). The vision for this project is to be functional, easy to configure and aesthetically pleasing.

## Features

### Dmenu-samde
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/menu.png">

This is a dmenu script that can be used to change various system settings, press super+shift+r to run it. Most of the settings are done through [Xresources](https://gitlab.com/SamDenton/dots/-/tree/master/.config/samde).

Here's some information on the options:
- **Theme selector**: The "themes" are also known as "rices".
- **Color scheme**: If you want more [colorschemes](https://gitlab.com/SamDenton/dots/-/tree/master/.config/samde/colorschemes) you can go to: [this github repo](https://github.com/janoamaral/Xresources-themes) and [terminal.sexy](https://terminal.sexy).
- **Toggles**: Toggle options for the suckless builds and picom.
- **Font**: This will list all the fonts that are installed. "System Font" changes the dwm bar, dmenu and dnote.
- **Folder Colors**: This changes the color of the folders for the papirus icon theme.
- **Monitor Profile**: The ["monitor profiles"](https://gitlab.com/SamDenton/dots/-/tree/master/.config/samde/profiles) are settings for the UI size for various monitor sizes and resolutions.
- **Pywal**: Uses [pywal](https://github.com/dylanaraps/pywal) to generate a colorscheme from the current wallpaper.
- **Reload Desktop**: Merges Xresources and reloads all the suckless programs.

### Tag icons
[Nerdfont](https://www.nerdfonts.com/) icons are used for tags instead of numbers. Dwm is configured to have my most used programs automatically open and switch to the appropriate tag. Also vacant tags are greyed out and occupied tags are colored.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/tags.gif">

- **Tag 1**: Web browser
- **Tag 2**: Terminal emulator
- **Tag 3**: File manager
- **Tag 4**: Productivity
- **Tag 5**: Games and 2nd productivity tag

### Border colors
Each program can use one of the 6 bright colors from the selected colorscheme as its border color. The colors are set in the rules array in dwm's [config](https://gitlab.com/SamDenton/dwm/-/blob/master/config.def.h). The way that I have it set up is that the border colors are the same as the tag icon color.

### Sticky windows
Sticky windows are windows that are visible on every tag. Programs can be made sticky by default in "rules" in the [dwm config file](https://gitlab.com/SamDenton/dwm/-/blob/master/config.def.h) and you can toggle it off and on with super+backspace.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/sticky.gif">

### Scratchpad
The scratchpad keybind is super+t, you can adjust the default size by changing the amount of columns and rows of st. You need to merge Xresources and kill the scratchpad window for the change to take effect.

## Default Programs

### My builds of suckless software 
- **Window manager**: [dwm](https://gitlab.com/SamDenton/dwm)
- **Terminal emulator**: [st](https://gitlab.com/SamDenton/st)
- **Launcher/menu program**: [dmenu](https://gitlab.com/SamDenton/dmenu)
- **Status monitor**: [slstatus](https://gitlab.com/SamDenton/slstatus)
- **Notification utility**: [dnote](https://gitlab.com/SamDenton/dnote)
- **Screen locker**: [slock](https://gitlab.com/SamDenton/slock)

### Other programs
- **Shell**: zsh
- **Prompt**: starship
- **Editor**: neovim
- **Compositor**: [picom (FT-Labs fork)](https://github.com/FT-Labs/picom)
- **TUI file manager**: lf
- **GUI file manager**: thunar
- **Web browser**: librewolf
- **Image viewer**: nsxiv
- **Video player**: mpv
- **Music player**: ncmpcpp (with mpd+mpc)
- **Wallpaper program**: xwallpaper

## Keybinds

The keys are arranged so that the window manager keys are (mostly) on the home and bottom row and the keys to launch programs are on the top row.

### Window manager keybinds
| Keybind                     | Action                                |
|-----------------------------|---------------------------------------|
| `super + a,s,d,f,g`         | switch tag                            |
| `super + shift + a,s,d,f,g` | move to tag                           |
| `super + ctrl + a,s,d,f,g`  | toggle tag view                       |
| `super + q`                 | exit program                          |
| `super + t`                 | scratchpad                            |
| `super + b`                 | toggle bar                            |
| `super + z`                 | toggle fullscreen                     |
| `super + space`             | toggle floating window                |
| `super + backspace`         | toggle sticky window                  |
| `super + tab`               | view previous tag                     |
| `super + j,k`               | switch window focus                   |
| `super + h,l`               | switch monitors                       |
| `super + shift + h,l`       | move window to monitor                |
| `super + shift + j,k`       | resize floating window                |
| `super + ctrl + h,j,k,l`    | move floating window                  |
| `super + alt + h,j,k,l`     | move floating window to corner        |
| `super + n,period`          | adjust window split (mfact)           |
| `super + m,comma`           | adjust number of master windows       |
| `super + ;`                 | switch master window                  |
| `super + 1,2,3`             | switch layouts (master,float,monacle) |
| `super + -,=`               | adjust gaps                           |
| `super + shift + =`         | sets gaps to 0                        |
| `super + 0`                 | view all tags                         |
| `super + shift + 0`         | make window visible on all tags       |
| `super + F5`                | reload Xresources colors              |

### Other keybinds
| Keybind                       | Action                  |
|-------------------------------|-------------------------|
| `super + enter`               | st                      |
| `super + shift + enter`       | st with tmux            |
| `super + w`                   | librewolf or brave      |
| `super + e`                   | thunar                  |
| `super + shift + e`           | lf                      |
| `super + control + e`         | dmenu-open              |
| `super + r`                   | dmenu\_run              |
| `super + shift + r`           | dmenu-samde             |
| `super + y,u,i,o,p`           | program launch script   |
| `super + Escape`              | power\_menu             |
| `super + shift + q`           | xkill                   |
| `super + control + q`         | dmenu\_kill             |
| `super + control + alt + q`   | restart dwm             |
| `super + delete`              | slock                   |
| `super + c`                   | picom toggle            |
| `super + control + b`         | dmenu-bluetooth         |
| `super + control + t`         | theme-selector          |
| `super + control + c`         | colorscheme-selector    |
| `audio {mute,lower,raise}`    | adjust volume           |
| `shift + audio {lower,raise}` | adjust mpd volume       |
| `audio {prev,play,next}`      | mpc prev,toggle,next    |
| `super + shift + audio play`  | show current track(mpd) |
| `shift + audio {prev,next}`   | mpc seek(rewind,foward) |
| `brightness {down,up}`        | adjust brightness       |

## Installation
This script is intended to be ran after using archinstall with the "xorg" profile.

**Run this script as a regular user(not root).**
```
git clone --depth 1 https://gitlab.com/SamDenton/samde.git
cd samde
./samde.sh
```

## Credit
This was mainly inspired by [LARBS](https://larbs.xyz/), [DTOS](https://gitlab.com/dtos/dtos) and [chadwm](https://github.com/siduck/chadwm).

I would like to give big thank you to suckless and all the people who've made patches for the suckless programs.

Thank you to the creators of [dmenu-bluetooth](https://github.com/Layerex/dmenu-bluetooth) and [lfub](https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/lfub).

Also last but not least I would like to thank the FOSS community. This project is essentially a collection of software and ideas from the FOSS community and this project would not even exist without it.
