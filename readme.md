# Benno's Dotfiles

## What's this?

This repository serves as my way to help me setup and maintain my MacBooks. It takes the effort out of installing everything manually. This was forked and adjusted by following the instructions in this wonderful blog post: https://medium.com/@driesvints/getting-started-with-dotfiles-76bf046d035c

## A fresh macOS Setup

Keep in mind that this is my personal tutorial on how I like to go about a fresh install on my macOS devices. You *need to adjust the install script* using your own private repository for things like SSH keys, commercial fonts and private or work related documents and settings! You may also want to adjust some steps to your personal liking.

### Prepare old macOS Installation
1. Ensure TimeMachine is up to date in case anything goes wrong
2. Create a [Mackup](https://github.com/lra/mackup#usage) to iCloud (please use the .mackup.cfg file from this repository for your first Mackup)
3. Backup all SSH keys locally (USB Drive)
4. Ensure iCloud Sync is finished

### Prepare new macOS Setup
1. Clean Install of macOS (restart -> ⌘+R -> erase disk -> reinstall)
2. Optional: [Set Home Folder name](https://support.apple.com/en-us/HT201548) to begin with a capital letter
3. Make the Mackup folder in iCloud available offline
4. Download Xcode from the Mac App Store
5. Open Xcode and accept the license agreement
6. Restore SSH Keys from local backup (USB Drive) to ~/.ssh
7. Restart Mac

### Restore Settings and Applications
1. Clone this repo to ~/.dotfiles (if necessary switch to a beta branch)
2. Important: Adjust Step 5 (Private Repo) under PREPARATION in the `install.sh` file (if necessary add switching to a beta branch)
3. Terminal in ~/.dotfiles: `./install.sh`

### Manual Steps
* Adjust macOS System Settings
* Adjust Finder Sidebar
* Install Safari Plugins
* Deactivate Guest User
* Sort Menu Bar and Dock Icons
* Open `/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app` to finish Adobe CC installation
* Open Pages to be able to install Pages Templates in the next step
* From Private Repository: Follow the TODO folder to set up private stuff

### Keep the dotfiles up to date
* When installing a new app, tool or font, add it to your fork of this repo
* When configuring a new app, make sure to run `mackup backup` to save your preferences
