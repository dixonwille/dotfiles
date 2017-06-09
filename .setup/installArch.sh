#!/bin/bash
_font="${HOME}/.fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/.local/share/fonts/$(basename $line)"
done
sudo -v
sudo pacman -Syu atom chromium git gnupg go pinentry rxvt-unicode vim zsh
apm install file-icons go-plus language-vue
ln -sf /usr/bin/pinentry /usr/local/bin/pinentry
