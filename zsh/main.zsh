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
export PATH=~/.rbenv/shims:~/bin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin

source ~/perl5/perlbrew/etc/bashrc

export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew use default

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


# ディレクトリまわり
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# プロンプトに色をつける
setopt prompt_subst
PROMPT="%{${fg[blue]}%}[%n@%m:%~] %(!.#.$) %{${reset_color}%}"


# 補完候補が複数ある時に、一覧表示
# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_list

# ==== Key ====
bindkey -v

## never ever beep ever
setopt NO_BEEP

# ==== Commands ====
setopt correct
setopt list_packed
setopt extendedglob

autoload -U colors
colors


# zsh functions

# ==== fast change top directory ====
rationalise-dot() {
if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
else
    LBUFFER+=.
fi
}

zle -N rationalise-dot

bindkey . rationalise-dot

function history-all { history -E 1 }
function hisall { history-all }

function alc {
    if [ $# != 0 ]; then
        w3m -o confirm_qq=false "http://eow.alc.co.jp/$1/UTF-8/"
    fi
}

function gvdiff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}


