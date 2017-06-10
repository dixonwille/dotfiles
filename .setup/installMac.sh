#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
_font="${HOME}/.fonts"
find $_font -type f -name "*.ttf" | while read line; do
	ln -s $line "${HOME}/Library/Fonts/$(basename $line)"
done
function wallpaper() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock 
}
wallpaper "${HOME}/Images/EinsteinWP.jpg"
brew bundle --file="${HOME}/.setup/Brewfile"
apm install file-icons go-plus language-vue
sudo -v
sudo ln -sf /usr/local/bin/pinentry-mac /usr/local/bin/pinentry
