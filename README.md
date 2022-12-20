# SÅM's Åwesome Minimal Desktop Environment
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/luna.jpg">

## Introduction
This is an Arch Linux post installation script, it installs what I call "⸰⸫SÅM⸎DE⸪⸰", my desktop environment that uses my custom builds of [suckless](https://suckless.org/) software: [dwm](https://gitlab.com/SamDenton/dwm), [dmenu](https://gitlab.com/SamDenton/dmenu), [st](https://gitlab.com/SamDenton/st) , [dnote](https://gitlab.com/SamDenton/dnoted) and [slstatus](https://gitlab.com/SamDenton/slstatus). The script also installs my dotfiles, my default programs, the "yay" aur helper and modifies pacman.conf and makepkg.conf.

## Features

### Xresources
All of my suckless builds have been patched to be able handle settings from Xresources. This allows settings to be changed on the fly without recompiling. All my suckless builds are mostly configured in an [Xresources file](https://gitlab.com/SamDenton/dots/-/blob/master/.config/x11/profiles/1080p.Xresources). See the "How my X11/Xresources dotfiles work" section below for more info.

### Terminal colorschemes for theming
All my suckless builds use terminal colorschemes loaded from an Xresources file for theming. Around 20 colorschemes are included in my [dotfiles](https://gitlab.com/SamDenton/dots/-/tree/master/.config/x11/colorschemes) however if you want more you can get a bunch of Xresources colorschemes from : [this github repo](https://github.com/janoamaral/Xresources-themes) and [terminal.sexy](https://terminal.sexy). Put the colorschemes you want in .config/x11/colorschemes and use samde\_menu to apply them.

### samde\_menu

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/menu.png">

This is a dmenu script used to change various system settings. Press super+shift+r to run it.

Each option does the following:

- Color Scheme : Gives a list of colorschemes to pick from.
- Rice Selector : Selects a "rice". The "rices" are just a combination of an Xresources colorscheme, a papirus-folder color and a wallpaper.
- Pywal : Uses pywal to generate a colorscheme from the current wallpaper and load it into my suckless builds. 
- Folder Colors : Sets the folder color for the papirus icon theme.
- Rounded Corners : Toggles rounded corners in picom.conf.
- Monitor Profile : Gives a list of monitor profiles to pick from.
- Bluetooth : opens [dmenu-bluetooth](https://github.com/Layerex/dmenu-bluetooth)
- Network : opens [networkmanager\_dmenu](https://github.com/firecat53/networkmanager-dmenu)
- Reload Desktop : Reloads Xresources and all my suckless builds.
- Power Menu : Gives options to power off, reboot ,sleep ,logout or lock the screen.

### Tag icons
[Nerdfont](https://www.nerdfonts.com/) icons are used for tags instead of numbers. My build of dwm is configured to have my most used programs automatically open and switch to the appropriate tag.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/bars/kasugano.png">

- Tag 1 : Web browser
- Tag 2 : Terminal emulator
- Tag 3 : File manager
- Tag 4 : Productivity
- Tag 5 : Games and 2nd productivity tag

### Colorful tags
Tags that are vacant will be greyed out and tags that are occupied will be colored.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/tags.gif">

### Sticky windows
Sticky windows are windows that are visible on every tag. Programs can be made sticky by default in "rules" in the [dwm config file](https://gitlab.com/SamDenton/dwm/-/blob/master/config.def.h) and you can toggle it off and on with super+backspace.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/sticky.gif">

### Scratchpad
The scratchpad keybind is super+t, you can adjust the size by changing the amount of columns and rows of st. You need to merge Xresources and kill the scratchpad window for the change to take effect.

### Top or centered dmenu
My dmenu build supports both top and centered options. When on top it will match the padding of the dwm bar and have no border and when centered it will have a border.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/dmenu.jpg">

## Keybinds

<details>
<summary><b>[Click to reveal]</b></summary>

Yes, these keybindings are pretty odd, the reason it's like that is for ergonomics and to seperate my window manager keybinds from my sxhkd keybinds. The top row of the keyboard is (mostly) used for launching programs and the home and bottom row is (mostly) used for window manager functions. 

### Window manager keybinds
| Keybind                      | Function                                    |
|------------------------------|---------------------------------------------|
| `super + a,s,d,f,g`          |  switch tag                                 |
| `super + shift + a,s,d,f,g`  |  move to tag                                |
| `super + ctrl + a,s,d,f,g`   |  toggle tag view                            |
| `super + q`                  |  exit program                               |
| `super + t`                  |  scratchpad                                 |
| `super + b`                  |  toggle bar                                 |
| `super + z`                  |  toggle fullscreen                          |
| `super + space`              |  toggle floating window                     |
| `super + backspace`          |  toggle sticky window                       |
| `super + tab`                |  view previous tag                          |
| `super + j,k`                |  switch window focus                        |
| `super + h,l`                |  switch monitors                            |
| `super + shift + h,l`        |  move window to monitor                     |
| `super + arrow keys`         |  move floating window                       |
| `super + shift + arrow keys` |  move floating window to corner             |
| `super + alt + arrow keys`   |  adjust width or height of floating window  |
| `super + ctrl + up,down`     |  adjust width and height of floating window |
| `super + n,period`           |  adjust window split (mfact)                |
| `super + m,comma`            |  adjust number of master windows            |
| `super + ;`                  |  switch master window                       |
| `super + 1,2,3`              |  switch layouts (master,floating,monacle)   |
| `super + -,=`                |  adjust gaps                                |
| `super + shift + =`          |  sets gaps to 0                             |
| `super + 0`                  |  view all tags                              |
| `super + shift + 0`          |  make window visible on all tags            |
| `super + F5`                 |  reload Xresources colors                   |

### Sxhkd keybinds
| Keybind                       | Function                |
|-------------------------------|-------------------------|
| `super + enter`               | st with tmux            |
| `super + shift + enter`       | st                      |
| `super + w`                   | librewolf or brave      |
| `super + e`                   | thunar                  |
| `super + shift + e`           | lf                      |
| `super + r`                   | dmenu\_run              |
| `super + shift + r`           | samde\_menu             |
| `super + y`                   | virt-manager            |
| `super + u`                   | gimp                    |
| `super + Escape`              | power menu              |
| `super + shift + q`           | xkill                   |
| `super + control + q`         | reload dwm              |
| `super + delete`              | slock                   |
| `super + o`                   | dmenu\_open             |
| `super + p`                   | reload sxhkd            |
| `super + shift + t`           | show current track      |
| `super + c`                   | picom toggle            |
| `audio {mute,lower,raise}`    | adjust volume           |
| `shift + audio {lower,raise}` | adjust mpd volume       |
| `audio {prev,play,next}`      | mpc prev,toggle,next    |
| `shift + audio {prev,next}`   | mpc seek(rewind,foward) |
| `brightness {down,up}`        | adjust brightness       |

</details>

## How my X11/Xresources dotfiles work

<details>
<summary><b>[Click to reveal]</b></summary>

The config files are in [.config/x11](https://gitlab.com/SamDenton/dots/-/blob/master/.config/x11/).

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/x11.jpg">

### Monitor profiles
The "profiles" folder contains different xresources files that contain settings for appropriate font sizes and pixel dimensions for various monitor resolutions. A profile is selected by symlinking the chosen profile to the x11 directory and calling the symlink "xresources", samde\_menu automates this process.

### Colorschemes
The "colorschemes" folder contains colorschemes in the Xresources format. The same process used for "profiles" is used but the symlink is called "xcolors".

### Wall
"wall" is a symlink for the selected wallpaper. I use it to set my wallpaper in my xinitrc and use it for pywal.
</details>

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
- Hotkey daemon : sxhkd
- Shell: zsh
- Prompt: starship
- Editor: neovim
- Compositor: picom
- TUI file manager: lf
- GUI file manager: thunar
- Image viewer : nsxiv
- Video player : mpv
- Music player : ncmpcpp (with mpd+mpc)
- Wallpaper program: xwallpaper
- Screen locker : slock

</details>

## Installation
**Run this script as a regular user.**
```
git clone --depth 1 https://gitlab.com/SamDenton/samde.git
cd samde
./samde.sh
```
## Screenshots

<details>
<summary><b>[Click to reveal]</b></summary>

### Rices
- Luna

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/luna.jpg">

- Rose

**More rices and screenshots on the way**

</details>

## Credit
This was mainly inspired by [LARBS](https://larbs.xyz/) and [chadwm](https://github.com/siduck/chadwm)

I would like to give big thank you to suckless and all the people who've made patches for the suckless programs.

Also last but not least I would like to thank the FOSS community. This would have not been possible to make with proprietary software.
