# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github node nvm npm perl)

source $ZSH/oh-my-zsh.sh

source $HOME/dotfiles/zsh/zaw/zaw.zsh

# Customize to your needs...
export PATH=~/.rbenv/shims:~/bin:~/nvm/v0.8.25/bin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin
source ~/nvm/nvm.sh
nvm use v0.8.25

source ~/perl5/perlbrew/etc/bashrc

alias ki='tree -CAF'
alias pb='perlbrew'
alias rm='rm -i'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# utility aliases
# TODO: alias.zshと重複しているのでsourceで取り込む
alias la='ls -al'
alias ll='ls -l'
alias l='ls'
alias rm='rm -i'
alias mv='mv -i'
alias gst='git status'
alias gdc='git diff --cached'
alias hg='history -E 2 | grep '
alias -g G=' | grep '
alias -g GV=' | grep -v '
alias -g L=' | lv '
alias -g T=' | tail '
alias -g V="| vim -R -"
alias ki='tree -CA'
alias ack="ack -i \--pager='less \-R'"
alias ackjs='ack -t=js'
alias ag="ag -C 1 --pager='less \-R'"
alias findname='find . -name'

# 補完候補が複数ある時に、一覧表示
# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_list

# ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt HIST_NO_STORE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

## never ever beep ever
setopt NO_BEEP

# ==== Commands ====
setopt correct
setopt list_packed
setopt extendedglob
