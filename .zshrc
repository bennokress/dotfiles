
# -------------------------------------------------------------------------------- #
# ---------------------------- Exports configuration ----------------------------- #
# -------------------------------------------------------------------------------- # 

# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# You may need to manually set your language environment
export LC_ALL=de_DE.UTF-8
export LANG=de_DE.UTF-8

# SSH Key Path Configuration
export SSH_KEY_PATH="~/.ssh/id_ed25519"

# Make Sublime the default editor
export EDITOR=sublime

# Search synced local manuals first
export MANPATH="$DOTFILES/man:$MANPATH"

# -------------------------------------------------------------------------------- #
# ---------------------------- Spaceship Theme Config ---------------------------- #
# -------------------------------------------------------------------------------- #

# GIT
SPACESHIP_GIT_SYMBOL="ᚶ "

# SPACESHIP PROMPT
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_JOBS_SHOW=false

# -------------------------------------------------------------------------------- #
# ---------------------------------- Oh My ZSH ----------------------------------- #
# -------------------------------------------------------------------------------- #

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH Terminal Theme
ZSH_THEME="spaceship" # -> Installed in dotfiles' install.sh

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Oh My ZSH Plugins (Don't add too many)
plugins=(git brew zsh-nvm zsh-autocompletion zsh-syntax-highlighting)

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------------------- #
# ------------------------------- The Fuck Config -------------------------------- #
# -------------------------------------------------------------------------------- #

# The Fuck Configuration
eval $(thefuck --alias)
