
##################################################################################################################################
#                                                            Aliases                                                             #
##################################################################################################################################

# Shortcuts
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias edit='sublime'
alias gitconfig="open ~/.gitconfig"
alias less='less -FSRXc'
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
# alias sourceZSH ="source ~/.zshrc" # --> FIXME: Error when starting the Terminal
alias sshServer="ssh admin@kress.myqnapcloud.com -p 2992 -i ~/.ssh/id_server_rsa"
alias zshconfig="open ~/.zshrc"

# Functions
cl() { cd "$@"; ls; }
mcd () { mkdir -p "$1" && cd "$1"; }
ql () { qlmanage -p "$*" >& /dev/null; }
swap() { mv $1 $1._tmp; mv $2 $1; mv $1._tmp $2; }
trash() { command mv "$@" ~/.Trash ; }
weather() { curl -4 wttr.in/${1:-kissing} }

# Update Function
updateDotfiles() {
    ORIGINAL_DIRECTORY="$(pwd)"
    # Dotfiles
    cd ~/.dotfiles
    git stash push -m "Stashed by CLI Update Function"
    git fetch --all
    git checkout -B master
    # Private Dotfiles
    cd ~/.private_dotfiles
    git stash push -m "Stashed by CLI Update Function"
    git fetch --all
    git checkout -B master
    # Go back to previous working directory
    cd $ORIGINAL_DIRECTORY
}

updateHomebrew() {
    ORIGINAL_DIRECTORY="$(pwd)"
    cd ~/.dotfiles
    # brew bundle # --> may lead to problems when formulae have been deleted in monthly branch, but not on master --> those would get reinstalled!
    brew update
    brew upgrade --cleanup
    brew doctor
    cd $ORIGINAL_DIRECTORY
}

updatePython() {
    pip3 install --upgrade pip setuptools wheel
}

showMacAppStoreUpdates() {
    if [[ $(mas outdated | wc -l) -gt 0 ]]
    then
        echo "Please update the following Applications on the Mac App Store:"
        mas outdated
    else
        echo "Applications from the Mac App Store are up to date."
    fi
}

update() {
    updateDotfiles
    updateHomebrew
    updatePython
    showMacAppStoreUpdates
}

# Fun
alias projekt="git" # -> German git (see global gitconfig)

# -------------------------------------------------------------------------------- #
# ---------------------------- Spaceship Theme Config ---------------------------- #
# -------------------------------------------------------------------------------- #

# -> Theme is activated in .zpreztorc

# GIT
SPACESHIP_GIT_SYMBOL="ᚶ "
SPACESHIP_DIR_TRUNC_REPO=false # Fix for https://bit.ly/2sQOZ8w

# SPACESHIP PROMPT
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_JOBS_SHOW=false

# -------------------------------------------------------------------------------- #
# ------------------------------------ Prezto ------------------------------------ #
# -------------------------------------------------------------------------------- #

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# -------------------------------------------------------------------------------- #
# ------------------------------------- JAVA ------------------------------------- #
# -------------------------------------------------------------------------------- #

# jenv (JAVA environment) Configuration --> https://www.jenv.be/
eval "$(jenv init -)"

# -------------------------------------------------------------------------------- #
# ------------------------------- The Fuck Config -------------------------------- #
# -------------------------------------------------------------------------------- #

# The Fuck Configuration
eval $(thefuck --alias)
