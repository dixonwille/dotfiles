#!/bin/bash
_font="${HOME}/.fonts"
mkdir -p "${HOME}/.local/share/fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/.local/share/fonts/$(basename $line)"
done
sudo -v
sudo pacman -Syu atom chromium git gnupg go pinentry rxvt-unicode vim zsh
apm install file-icons go-plus language-vue
sudo -v
sudo ln -sf /usr/bin/pinentry /usr/local/bin/pinentry
