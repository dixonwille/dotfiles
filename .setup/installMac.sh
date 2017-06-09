#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
_font="${HOME}/.fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/Library/Fonts/$(basename $line)"
done
brew bundle --file="${HOME}/.setup/installMac.sh"
