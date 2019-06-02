CLEARCOLOR="\033[0m"
ALERTCOLOR="\033[0;31m"
SUCCESSCOLOR="\033[0;32m"

##################################################################################################################################
#                                                            Aliases                                                             #
##################################################################################################################################

# Shortcuts
alias zshrc='subl ~/.dotfiles/.zshrc'
alias brewfile='subl ~/.dotfiles/Brewfile'
alias copyssh='pbcopy < ~/.ssh/id_ed25519.pub'
alias edit='subl'
alias git='hub'
alias gitconfig='subl ~/.gitconfig'
alias less='less -FSRXc'
alias ll='gls -lahF --color --group-directories-first'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias gem='rvm all do gem'
alias reload='source ~/.zshrc && clear'
alias sshServer='ssh admin@kress.myqnapcloud.com -p 2992 -i ~/.ssh/id_server_rsa'
alias xcode='xed .' # opens the xcworkspace if present and xcodeproj otherwise

# Functions
cl() { cd "$@"; ll; }
mcd() { mkdir -p "$1" && cd "$1"; }
ql() { qlmanage -p "$*" >& /dev/null; }
swap() { mv $1 $1._tmp; mv $2 $1; mv $1._tmp $2; }
trash() { command mv "$@" ~/.Trash ; }
weather() { curl -4 wttr.in/${1:-"$@"} }

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
        printf "%b" "${ALERTCOLOR}Please update the following Applications on the Mac App Store:${CLEARCOLOR}\n"
        mas outdated
    else
        printf "%b" "${SUCCESSCOLOR}Applications from the Mac App Store are up to date.${CLEARCOLOR}\n"
    fi
}

update() {
    updateHomebrew
    updatePython
    updateRuby
    showMacAppStoreUpdates
}

cleanup() {
    update
    brew bundle install --global
    brew bundle cleanup --global
    printf "%b" "${ALERTCOLOR}The above listed Homebrew items will be deleted. Adjust your Brewfile now to save individual items.${CLEARCOLOR}\n"
    printf "%b" "${ALERTCOLOR}Press ↩ to continue or CTRL + C to cancel ...${CLEARCOLOR}\n"
    read input
    brew bundle cleanup --global --force --verbose
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
SPACESHIP_DIR_TRUNC_REPO=false # Fix for https://bit.ly/2sQOZ8w

# SPACESHIP PROMPT
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_JOBS_SHOW=false

# ICONS --> Those need the Powerline Font activated (https://github.com/ryanoasis/nerd-fonts)
SPACESHIP_AWS_SYMBOL=" "
SPACESHIP_BATTERY_SYMBOL_CHARGING=" "
SPACESHIP_BATTERY_SYMBOL_DISCHARGING=" "
SPACESHIP_BATTERY_SYMBOL_FULL=" "
SPACESHIP_CHAR_SYMBOL=" " # Alternatives: , , , , ⇢, , , 
# SPACESHIP_CONDA_SYMBOL=" "
SPACESHIP_DIR_LOCK_SYMBOL=" "
SPACESHIP_DOCKER_SYMBOL=" "
SPACESHIP_DOTNET_SYMBOL=" "
SPACESHIP_ELIXIR_SYMBOL=" "
SPACESHIP_ELM_SYMBOL=" "
SPACESHIP_EMBER_SYMBOL=" "
SPACESHIP_GIT_SYMBOL="שׂ "
SPACESHIP_GOLANG_SYMBOL=" "
SPACESHIP_HASKELL_SYMBOL=" "
# SPACESHIP_HG_SYMBOL=" "
SPACESHIP_JOBS_SYMBOL=" "
SPACESHIP_JULIA_SYMBOL=" "
# SPACESHIP_KUBECONTEXT_SYMBOL=" "
SPACESHIP_NODE_SYMBOL=" "
SPACESHIP_PACKAGE_SYMBOL=" "
SPACESHIP_PHP_SYMBOL=" "
SPACESHIP_PYENV_SYMBOL=" "
SPACESHIP_RUBY_SYMBOL=" "
SPACESHIP_RUST_SYMBOL=" "
SPACESHIP_SWIFT_SYMBOL=" "
# SPACESHIP_TERRAFORM_SYMBOL=" "
# SPACESHIP_VENV_SYMBOL=" "
SPACESHIP_XCODE_SYMBOL=" "


# -------------------------------------------------------------------------------- #
# ------------------------------------ Prezto ------------------------------------ #
# -------------------------------------------------------------------------------- #

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# -------------------------------------------------------------------------------- #
# ------------------------------- The Fuck Config -------------------------------- #
# -------------------------------------------------------------------------------- #

# The Fuck Configuration
eval $(thefuck --alias)
