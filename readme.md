# Benno's Dotfiles

## What Is This?

This repository serves as my way to help me setup and maintain my MacBooks. It takes the effort out of installing everything manually. This was forked and adjusted by following the instructions in this wonderful blog post: https://medium.com/@driesvints/getting-started-with-dotfiles-76bf046d035c

## A Fresh macOS Setup

### Prepare old macOS Installation
1. Ensure an up to date TimeMachine Backup in case anything goes wrong
2. Create (and possibly modify) a [Mackup](https://github.com/lra/mackup#usage) to iCloud
3. Backup all SSH keys securely (~/.ssh -> USB drive)
4. [Backup all custom fonts](https://github.com/alichtman/shallow-backup) -> USB drive
5. Ensure iCloud is up to date
6. Ensure the file .macos in this repo is up to date and still compatible

### Prepare new macOS Installation
1. Install fresh macOS (restart -> ⌘+R -> erase -> reinstall)
2. Optional: [Set Home Folder name](https://support.apple.com/en-us/HT201548) to begin with a capital letter
3. Install Xcode from the App Store
4. Open Xcode and accept license agreement
5. Terminal -> `xcode-select --install`
6. Copy all SSH keys to ~/.ssh
7. Terminal -> `chmod -R 600 ~/.ssh` (owner can read + write)
8. Modify the file /etc/shells: add `/usr/local/bin/zsh` to the end

### Restore Settings and Applications
1. Clone this repo to ~/.dotfiles
2. Terminal in ~/.dotfiles: `./install.sh`
3. [Set default ruby](https://rvm.io/rubies/default)
4. Terminal: `mackup restore` (needs fully synced Mackup folder in iCloud)
5. Restart the Mac

### Manual Steps
* Adjust Finder Sidebar
* Install Safari Plugins
* Deactivate Guest User
* Activate Aerial Screensaver
* Sort Menu Bar Icons

### Keep the dotfiles up to date
* When installing a new app, tool or font, try to install it with Homebrew (Cask) and add it to your Brewfile
* When configuring a new app make sure to run `mackup backup` to save your preferences
* When changing an macOS setting, try setting it through the .macos file
