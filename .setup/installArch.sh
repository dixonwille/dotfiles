#!/bin/bash
_font="${HOME}/.fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/.local/share/fonts/$(basename $line)"
done
sudo -v
sudo pacman -Syu atom chromium git gnupg go pinentry vim zsh

