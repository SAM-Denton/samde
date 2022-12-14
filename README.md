# SÅM's Åwesome Minimal Desktop Environment
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/screenshot.jpg">

## Introduction
This is a post Arch Linux installation script, it installs what I call "⸰⸫SÅM⸎DE⸪⸰", my desktop environment that uses my custom builds of [suckless](https://suckless.org/) software: [dwm](https://gitlab.com/SamDenton/dwm), [dmenu](https://gitlab.com/SamDenton/dmenu), [st](https://gitlab.com/SamDenton/st) , [dnote](https://gitlab.com/SamDenton/dnoted) and [slstatus](https://gitlab.com/SamDenton/slstatus).

**This script is intended to be ran right after using archinstall with the "xorg" profile.**

## Screenshots

<details>
<summary><b>[Click to reveal]</b></summary>

### Rices
- Luna
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/screenshot.jpg">
- Rose
- Deus ex

**More rices and screenshots on the way**

</details>

## Features

### Xresources
All my suckless programs have been patched to be able handle settings from Xresources. I barely touch the config files for my suckless builds, I'm able to change settings on the fly without recompiling. I use a custom dmenu script that I've made called samde\_menu to change settings in a matter of seconds. 

### How my X11/Xresources dotfiles work

<details>
<summary><b>[Click to reveal]</b></summary>

I do most of my configuring in [.config/x11](https://gitlab.com/SamDenton/dots/-/blob/master/.config/x11/) and I'm gonna explain how everything is set up.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/x11.jpg">

The "profiles" folder contains different xresources files that contain settings for appropriate font sizes and pixel dimensions for various monitor resolutions. A profile is selected by symlinking the chosen profile to the parent directory and calling the symlink "xresources".

The "colorschemes" folder contains colorschemes in the Xresources format. Use the same process for "profiles" but call the symlink "xcolors" . You can get a bunch of Xresources colorschemes from : [this github repo](https://github.com/janoamaral/Xresources-themes) and [terminal.sexy](https://terminal.sexy)

"wall" is a symlink for the selected wallpaper. I use it to set my wallpaper in my xinitrc and use it for pywal.
</details>

### samde\_menu

Each menu entry does the following:

- Color Scheme : Sets the colorscheme for all my suckless builds.
- Rice Selector : Selects a "rice". The "rices" are just a combination of an Xresources colorscheme, a papirus-folder color and a wallpaper.
- Wallpaper: Opens nsxiv with wallpapers for you to select.
- Pywal : Uses pywal to generate a colorscheme from the current wallpaper and load it into my suckless builds. 
- Folder Colors : Sets the folder color for the papirus icon theme.
- Rounded Corners : Toggles rounded corners in picom.conf
- Monitor Profile : Sets font size and pixel dimensions of my suckless builds for different monitor resolutions.
- Bluetooth : opens [dmenu-bluetooth](https://github.com/Layerex/dmenu-bluetooth)
- Network : opens [networkmanager\_dmenu](https://github.com/firecat53/networkmanager-dmenu)
- Power Menu : Gives options to power off, reboot ,sleep ,logout or lock the screen.

### Tag icons
[Nerdfont](https://www.nerdfonts.com/) icons are used for tags instead of numbers. Each tag icon corresponds to the type of programs I use on that tag.

<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/bars/kasugano.png">

- Tag 1 : Web browser
- Tag 2 : Terminal emulator
- Tag 3 : File manager
- Tag 4 : Productivity
- Tag 5 : Games and 2nd productivity tag

### Automatic tag switching
My most used programs have rules in the config file to automatically spawn to a specified tag. Example: when I launch virt-manager it spawns to the 4th tag and dwm automatically switches to that tag.

### Colorful tags
Tags that are vacant will be greyed out and tags that are occupied will be colored.

### Sticky windows
Sticky windows are windows that will be visible on every tag. Programs can be made sticky by default in "rules" in the config file and you can toggle it off and on with super+backspace.
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/sticky.gif">

## Keybinds

<details>
<summary><b>[Click to reveal]</b></summary>

Yes, these keybindings are pretty odd. I've configured it this way cause I want it to be ergonomic and I want my window manager specific keybindings and the rest of my keybindings separate. I also have a [ZSA Moonlander](https://www.zsa.io/moonlander) split keyboard which also makes the keybindings weird as well.

### Window manager keybinds

| Keybind                     | Function                                  |
|-----------------------------|-------------------------------------------|
| `super + a,s,d,f,g`         |  switch tag                               |
| `super + shift + a,s,d,f,g` |  move to tag                              |
| `super + ctrl + a,s,d,f,g`  |  toggle tag view                          |
| `super + q`                 |  exit program                             |
| `super + t`                 |  scratchpad                               |
| `super + b`                 |  toggle bar                               |
| `super + z`                 |  toggle fullscreen                        |
| `super + space`             |  toggle floating window                   |
| `super + backspace`         |  toggle sticky window                     |
| `super + tab`               |  view previous tag                        |
| `super + ;`                 |  switch master window                     |
| `super + h,l`               |  adjust window split (mfact)              |
| `super + j,k`               |  switch window focus                      |
| `super + n,m`               |  switch monitors                          |
| `super + shift + n,m`       |  move window to monitor                   |
| `super + comma,period`      |  adjust number of master windows          |
| `super + 1,2,3`             |  switch layouts (master,floating,monacle) |
| `super + 0`                 |  view all tags                            |
| `super + -,=`               |  adjust gaps                              |
| `super + shift + =`         |  sets gaps to 0                           |
| `super + shift + 0`         |  make window visible on all tags          |
| `super + F5`                |  reload Xresources colors                 |

### Sxhkd keybinds
| Keybind                       | Function                 |
|-------------------------------|--------------------------|
| `super + enter`               | st                       |
| `super + shift + enter`       | st with tmux             |
| `super + w`                   | librewolf or brave       |
| `super + e`                   | thunar                   |
| `super + shift + e`           | lf                       |
| `super + r`                   | dmenu\_run               |
| `super + shift + r`           | samde\_menu              |
| `super + y`                   | virt-manager             |
| `super + u`                   | gimp                     |
| `super + Escape`              | power menu               |
| `super + shift + q`           | xkill                    |
| `super + control + q`         | reload dwm               |
| `super + delete`              | slock                    |
| `super + o`                   | dmenu\_open              |
| `super + p`                   | reload sxhkd             |
| `super + shift + t`           | show current track       |
| `super + c`                   | picom toggle             |
| `audio {mute,lower,raise}`    | adjust volume            |
| `shift + audio {lower,raise}` | adjust mpd volume        |
| `audio {prev,play,next}`      | mpc prev,toggle,next     |
| `shift + audio {prev,next}`   | mpc seek(rewind,foward)  |
| `brightness {down,up}`        | adjust brightness        |

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
```
git clone --depth 1 https://gitlab.com/SamDenton/samde.git
cd samde
./samde.sh
```

## Credit
This was mainly inspired by [LARBS](https://larbs.xyz/) and [chadwm](https://github.com/siduck/chadwm)

I'd also like to thank suckless, and the FOSS community!
