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

