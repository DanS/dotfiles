# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#DEFAULT_USER=dan

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tks='tmux kill-server':

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem rake bundler brew osx rvm)

# use vim key bindings, instead of the the default emacs
set -o vi

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

# Customize to your needs...
export PATH=/Users/dan/.rvm/gems/ruby-1.9.2-p290@gtcms/bin:/Users/dan/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/dan/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/dan/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:/Users/dan/.rvm/bin
export EDITOR=mvim
ulimit -S -n 2048

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
