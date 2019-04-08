
##################################################################################################################################
#                                                            Aliases                                                             #
##################################################################################################################################

# Shortcuts
alias zshrc="subl ~/.dotfiles/.zshrc"
alias brewfile="subl ~/.dotfiles/Brewfile"
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias edit='sublime'
alias git='hub'
alias gitconfig="open ~/.gitconfig"
alias less='less -FSRXc'
alias ll="gls -lahF --color --group-directories-first"
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias gem='rvm all do gem'
# alias sourceZSH ="source ~/.zshrc" # --> FIXME: Error when starting the Terminal
alias sshServer="ssh admin@kress.myqnapcloud.com -p 2992 -i ~/.ssh/id_server_rsa"
alias zshconfig="open ~/.zshrc"
alias xcode="xed ." # opens the xcworkspace if present and xcodeproj otherwise

# Functions
cl() { cd "$@"; ll; }
mcd() { mkdir -p "$1" && cd "$1"; }
ql() { qlmanage -p "$*" >& /dev/null; }
swap() { mv $1 $1._tmp; mv $2 $1; mv $1._tmp $2; }
trash() { command mv "$@" ~/.Trash ; }
weather() { curl -4 wttr.in/${1:-"$@"} }

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
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew doctor
}

updatePython() {
    pip3 install --upgrade pip setuptools wheel
}

updateRuby() {
    rvm all do gem update --quiet # updates all gems to latest version
    rvm all do gem cleanup # removes unused files
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
    updateHomebrew
    updatePython
    updateRuby
    showMacAppStoreUpdates
}

# Fun
alias projekt="git" # -> German git (see global gitconfig)

# Fiducia
alias npm_fgi="docker run -it --rm -p 8100:8100 -p 35729:35729 --privileged -v ~/.gradle:/root/.gradle -v \$PWD:/workdir:rw nexus.in.fiduciagad.de:50017/mobile/ionic-intern:4.1.latest npm"
alias ionic_fgi="docker run -it --rm -p 8100:8100 -p 35729:35729 --privileged -v ~/.gradle:/root/.gradle -v \$PWD:/workdir:rw nexus.in.fiduciagad.de:50017/mobile/ionic-intern:4.1.latest ionic"
alias docker41="docker run -it --rm -p 8100:8100 -p 35729:35729 --privileged -v ~/.gradle:/root/.gradle -v \$PWD:/workdir:rw nexus.in.fiduciagad.de:50017/mobile/ionic-intern:4.1.latest"


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
