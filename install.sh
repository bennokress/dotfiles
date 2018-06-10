#!/bin/sh

echo "Setting up your Mac ..."

##################################################################################################################################
#                                                          Preparation                                                           #
##################################################################################################################################

# 1 - Setting some colors for the prompts
CLEARCOLOR="\033[0m"
ALERTCOLOR="\033[0;31m"
SUCCESSCOLOR="\033[0;32m"

# 2 - Giving some instructions for manual installation
printf "%b" "${ALERTCOLOR}Please open the Mac App Store and install Xcode!\n" # Needed for mas + marathon
printf "%b" "${CLEARCOLOR}After Xcode is installed press return (or ctrl + c to cancel this setup).\n"
read input
printf "%b" "${ALERTCOLOR}Now open Xcode and accept the license agreement!\n" # Needed for Homebrew and others
printf "%b" "${CLEARCOLOR}Come back afterwards and press return (or ctrl + c to cancel this setup).\n"
read input
printf "%b" "${ALERTCOLOR}Lastly go to System Preferences --> iCloud and deactivate \"Optimize Mac Storage\"!\n"
printf "%b" "${CLEARCOLOR}You can reactivate it after the setup process.\n"
printf "%b" "${CLEARCOLOR}Wait for the Mackup folder to be downloaded and press return (or ctrl + c to cancel this setup).\n"
read input

# 3 - Prepare the Setup process
xcode-select --install
mkdir -p "$HOME/Library/Application Support/Google/Chrome" # Fixes the 1Password Chrome Extension

# 4 - Setup private stuff (from private repo) - ADJUST TO YOUR OWN NEEDS OR DELETE
git clone git@github.com:bennokress/private_dotfiles.git "$HOME/.private_dotfiles"
$HOME/.private_dotfiles/install.sh

##################################################################################################################################
#                                                            Homebrew                                                            #
##################################################################################################################################

# 1 - Install (if not yet done)
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 2 - Update
brew update

# 3 - Install from Brewfile
brew tap homebrew/bundle
brew bundle

# Asks for the password one time, keeps it until the script stops running
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##################################################################################################################################
#                                                              Ruby                                                              #
##################################################################################################################################

# 1 - Install RVM (Ruby Version Manager) and latest stable Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# 2 - Install CocoaPods via Ruby
sudo gem install cocoapods

##################################################################################################################################
#                                                              ZSH                                                               #
##################################################################################################################################

# 1 - Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 2 - Install Third Party Module Support for Prezto (needed for the Spaceship Theme)
cd "$HOME/.zprezto"
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

# 3 - Install Terminal Theme via Prezto (-> https://github.com/denysdovhan/spaceship-prompt#prezto)
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.dotfiles/themes/spaceship-prompt"
ln -s "$HOME/.dotfiles/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.dotfiles/themes/spaceship.zsh-theme"

# 4 - Symlink ZSH related dotfiles
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.zshenv"
rm -rf "$HOME/.zprofile"
rm -rf "$HOME/.zpreztorc"
rm -rf "$HOME/.zlogout"
rm -rf "$HOME/.zlogin"
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/.zshenv" "$HOME/.zshenv"
ln -s "$HOME/.dotfiles/.zprofile" "$HOME/.zprofile"
ln -s "$HOME/.dotfiles/.zpreztorc" "$HOME/.zpreztorc"
ln -s "$HOME/.dotfiles/.zlogout" "$HOME/.zlogout"
ln -s "$HOME/.dotfiles/.zlogin" "$HOME/.zlogin"

# 5 - Make ZSH the default shell environment
chsh -s /bin/zsh

# 6 - Create a "sublime" shortcut for Terminal (-> allows Sublime to be the default editor in Terminal)
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/sublime"

##################################################################################################################################
#                                                              Git                                                               #
##################################################################################################################################

# 1 - Symlink .gitconfig from dotfiles
rm -rf "$HOME/.gitconfig"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

##################################################################################################################################
#                                                             Mackup                                                             #
##################################################################################################################################

# 1 - Symlink the Mackup config file to the home directory
ln -s "$HOME/.dotfiles/.mackup.cfg" "$HOME/.mackup.cfg"

# 2 - Restore Mackup
mackup restore

##################################################################################################################################

printf "%b" "${SUCCESSCOLOR}Please restart now, to finish the setup process!\n"
osascript -e 'tell app "loginwindow" to «event aevtrrst»' # Show restart dialog
