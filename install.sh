#!/bin/bash

echo """

 _   ___      _        _             _            
| | / (_)    | |      | |           | |           
| |/ / _  ___| | _____| |_ __ _ _ __| |_ ___ _ __ 
|    \| |/ __| |/ / __| __/ _\` | '__| __/ _ \ '__|
| |\  \ | (__|   <\__ \ || (_| | |  | ||  __/ |   
\_| \_/_|\___|_|\_\___/\__\__,_|_|   \__\___|_|   
    
"""
echo "Bootstrapping Mac setup ..."
echo "Checking default shell ... "

if [[ $SHELL == *"zsh"* ]]; then
  echo "zsh already set as default shell, continuing."
else
  # make zsh default
  echo "$SHELL set as default shell, setting zsh as default shell."
  chsh -s $(which zsh)
  echo "Please logout and rerun script after logout."
fi

# install xcode cli utilities, needed for brew
xcode-select --install

# fetch brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install all the stuff
brew bundle install
