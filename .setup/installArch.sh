#!/bin/bash
_font="${HOME}/.fonts"
mkdir -p "${HOME}/.local/share/fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/.local/share/fonts/$(basename $line)"
done
sudo -v
sudo pacman -Syu atom autocutsel chromium feh git gnupg go i3-wm i3-status i3lock jack2 pinentry terminator qjackctl vim xf86-input-wacom zsh
apm install file-icons go-plus language-vue
chsh -s /bin/zsh
sudo -v
sudo ln -sf /usr/bin/pinentry /usr/local/bin/pinentry
