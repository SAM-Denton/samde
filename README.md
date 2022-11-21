# SÅM's Åwesome Minimal Desktop Environment
<img src="https://gitlab.com/SamDenton/screenshots/-/raw/master/screenshot.jpg">

This is an installation script, it is intended to be ran right after using archinstall with the "xorg" profile. I do not recommend running this script on an existing install of arch. As of right now the script works perfectly fine however this project still a work in progress.

## Installation
```
git clone --depth 1 https://gitlab.com/SamDenton/samde.git
cd samde
./samde.sh
```
## Keybinds

### Window manager keybinds
| Keybind                 | Function                                             |
|_________________________|______________________________________________________|
|Mod + a,s,d,f,g          |  switch tag                                          |
|Mod + shift + a,s,d,f,g  |  move to tag                                         |
|Mod + ctrl + a,s,d,f,g   |  toggle tag view                                     |
|Mod + q                  |  exit program                                        |
|Mod + t                  |  scratchpad                                          |
|Mod + b                  |  toggle bar                                          |
|Mod + z                  |  toggle fullscreen                                   |
|Mod + space              |  toggle floating window                              |
|Mod + backspace          |  toggle sticky window                                |
|Mod + tab                |  view previous tag                                   |
|Mod + ;                  |  make selected window master                         |
|Mod + h,l                |  adjust window split (mfact)                         |
|Mod + j,k                |  switch window focus                                 |
|Mod + n,m                |  switch monitors                                     |
|Mod + shift + n,m        |  move window to monitor                              |
|Mod + comma,period       |  adjust number of clients in master stack            |
|Mod + 1,2,3              |  switch layouts (master-stack,floating,monacle)      |
|Mod + 0                  |  view all tags                                       |
|Mod + -,=                |  adjust gaps                                         |
|Mod + shift + =          |  sets gaps to 0                                      |
|Mod + shift + 0          |  make window visible on all tags                     |
|Mod + F5                 |  reload Xresources colors                            |


## Default Programs

### My builds of suckless software 
- Window manager: [dwm](https://gitlab.com/SamDenton/dwm)
- Terminal emulator : [st](https://gitlab.com/SamDenton/st)
- Launcher/menu : [dmenu](https://gitlab.com/SamDenton/dmenu)
- Status monitor: [slstatus](https://gitlab.com/SamDenton/slstatus)
- Notification daemon : [dnote](https://gitlab.com/SamDenton/dnote)

### Other programs
- Hotkey daemon : sxhkd
- Shell: zsh
- Prompt: starship
- Editor: neovim
- Compositor: picom
- TUI filemanager: lf
- GUI filemanager: thunar
- Image viewer : nsxiv
- Video player : mpv
- Music player : ncmpcpp
- Wallpaper program: xwallpaper
- Screenlocker : slock
