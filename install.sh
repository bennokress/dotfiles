#!/bin/sh

echo "Setting up your Mac ..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Asks for the password one time, keeps it until the script stops running
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install CocoaPods
sudo gem install cocoapods

# Install RVM (Ruby Version Manager) and latest stable Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Removing files that may exist and will be symlinked now
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.gitconfig"

# Install Terminal Theme (https://github.com/denysdovhan/spaceship-prompt#oh-my-zsh)
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.dotfiles/themes/spaceship-prompt"
ln -s "$HOME/.dotfiles/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.dotfiles/themes/spaceship.zsh-theme"

# Make the default editor "sublime" work by linking Sublime Text
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/sublime"

# Symlink .gitconfig from dotfiles
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

# Symlink .zshrc from dotfiles
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Create a Sites directory - this is a default directory for macOS user accounts but doesn't come pre-installed
mkdir "$HOME/Sites"

# Symlink the Mackup config file to the home directory
ln -s "$HOME/.dotfiles/.mackup.cfg" "$HOME/.mackup.cfg"

# Set macOS preferences
source .macos

echo "Setup finished, please RESTART IMMEDIATELY!"
