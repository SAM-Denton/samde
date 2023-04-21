# SÅM's Åwesome Minimal Desktop Environment
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/luna.jpg">

## Introduction
This is an Arch Linux post installation script that installs my desktop environment that is comprised of custom builds of [suckless](https://suckless.org/) software: [dwm](https://gitlab.com/SamDenton/dwm), [dmenu](https://gitlab.com/SamDenton/dmenu), [st](https://gitlab.com/SamDenton/st) , [dnote](https://gitlab.com/SamDenton/dnote) and [slstatus](https://gitlab.com/SamDenton/slstatus). The script also installs my dotfiles and the programs I use.

## Features

### Xresources
All of my suckless builds support [Xresources](https://gitlab.com/SamDenton/dots/-/blob/master/.config/x11/profiles/1080p.Xresources). This allows settings to be changed on the fly without recompiling.

### Effortless theming
You can use my dmenu-samde script to change colorscheme of my suckless builds in a matter of seconds. The colorschemes are loaded from a single Xresources file rather than having to set the colors in multiple config files. A good amount of colorschemes are included in the [x11/colorschemes](https://gitlab.com/SamDenton/dots/-/tree/master/.config/x11/colorschemes) folder from my dotfiles, however if you want more you can get a bunch of colorschemes from : [this github repo](https://github.com/janoamaral/Xresources-themes) and [terminal.sexy](https://terminal.sexy). 

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/colorscheme.gif">

### dmenu-samde

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/menu.png">

This is a dmenu script used to change various system settings. Press super+shift+r to run it.

I'll explain some of the options that I think need an explanation:

- Suckless Toggles : toggle options in my suckless builds , such as gaps, bar padding, etc.
- Font : Gives a list of fonts to pick from. "System Font" changes the dwm bar, dmenu and dnote.
- Pywal : Uses pywal to generate a colorscheme from the current wallpaper and load it into my suckless builds. 
- Folder Colors : Sets the folder color for the papirus icon theme.
- Rounded Corners : Toggles rounded corners in picom.conf.
- Monitor Profile : Changes the size of ui elements for various screen sizes and resolutions.
- Reload Desktop : Merges Xresources and reloads all my suckless programs.

### Tag icons
[Nerdfont](https://www.nerdfonts.com/) icons are used for tags instead of numbers. My build of dwm is configured to have my most used programs automatically open and switch to the appropriate tag. Also vacant tags are greyed out and occupied tags are colored.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/tags.gif">

- Tag 1 : Web browser
- Tag 2 : Terminal emulator
- Tag 3 : File manager
- Tag 4 : Productivity
- Tag 5 : Games and 2nd productivity tag

### Sticky windows
Sticky windows are windows that are visible on every tag. Programs can be made sticky by default in "rules" in the [dwm config file](https://gitlab.com/SamDenton/dwm/-/blob/master/config.def.h) and you can toggle it off and on with super+backspace.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/sticky.gif">

### Scratchpad
The scratchpad keybind is super+t, you can adjust the default size by changing the amount of columns and rows of st. You need to merge Xresources and kill the scratchpad window for the change to take effect.

### Top or centered dmenu
My dmenu build supports both top and centered options. When on top it matches the padding of the dwm bar and has no border and when centered it has a border.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/dmenu.jpg">

## Keybinds
<details>
<summary><b>[Click to reveal]</b></summary>


Yes, these keybindings are pretty odd, I have my tag keys bound to "asdfg" for ergonomics and because I switch tags often. The top row of the keyboard is (mostly) used for launching programs and the home and bottom row is (mostly) used for window manager functions. Like most people I've changed the mod key for dwm to be the super key (aka windows key). 

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
| `super + r`                   | dmenu\_run              |
| `super + shift + r`           | dmenu-samde             |
| `super + y,u,i,o,p`           | program launch script   |
| `super + Escape`              | power\_menu             |
| `super + shift + q`           | xkill                   |
| `super + control + q`         | reload dwm              |
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


## Default Programs

<details>
<summary><b>[Click to reveal]</b></summary>

### My builds of suckless software 
- Window manager: [dwm](https://gitlab.com/SamDenton/dwm)
- Terminal emulator : [st](https://gitlab.com/SamDenton/st)
- Launcher/menu program : [dmenu](https://gitlab.com/SamDenton/dmenu)
- Status monitor: [slstatus](https://gitlab.com/SamDenton/slstatus)
- Notification utility : [dnote](https://gitlab.com/SamDenton/dnote)

### Other programs
- Shell: zsh
- Prompt: starship
- Editor: neovim
- Compositor: picom
- TUI file manager: lf
- GUI file manager: thunar
- Web browser: librewolf
- Image viewer: nsxiv
- Video player: mpv
- Music player: ncmpcpp (with mpd+mpc)
- Wallpaper program: xwallpaper
- Screen locker: slock

</details>

## Installation
This script is intended to be ran in a fresh install of Arch linux with no display manager(gui login screen). I use this script after using archinstall with the "xorg" profile selected.

**Run this script as a regular user.**
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
