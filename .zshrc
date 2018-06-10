
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

# Fun
alias projekt="git" # -> German git (see global gitconfig)

# -------------------------------------------------------------------------------- #
# ---------------------------- Spaceship Theme Config ---------------------------- #
# -------------------------------------------------------------------------------- #

# -> Theme is activated in .zpreztorc

# GIT
SPACESHIP_GIT_SYMBOL="ᚶ "

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
# ------------------------------- The Fuck Config -------------------------------- #
# -------------------------------------------------------------------------------- #

# The Fuck Configuration
eval $(thefuck --alias)
