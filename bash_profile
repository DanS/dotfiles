export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$HOME/local/bin:$PATH

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/dsteinicke/.docker/machine/machines/dockervm"
export DOCKER_MACHINE_NAME="dockervm"
# Run this command to configure your shell for docker:
# eval "$(docker-machine env dockervm)"

#avoid too many files error
#ulimit -S -n 20000

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

nvm alias default 2.3.1
export NVM_DIR="/Users/dsteinicke/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#use command completion for git commands and branches
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  # Add git completion to aliases
     __git_complete g   __git_main
     __git_complete gb  __git_branch  #not sure if this works
     __git_complete gc  __git_commit
     __git_complete gco _git_checkout
     __git_complete gm  __git_merge
     __git_complete gl  _git_pull
     __git_complete gp  _git_push
     __git_complete grb _git_rebase
fi

docker_compose_fn() {
  docker-compose $1 $2 $3 $4 $5
}
alias dc='docker_compose_fn'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias begs='bundle exec guard start'
alias be='bundle exec'
alias locate='if [ $((`date +%s`-`eval $(stat -s /var/db/locate.database); echo $st_mtime`)) -gt 3600 ]; then echo "locate: db is too old!">/dev/stderr; sudo /usr/libexec/locate.updatedb; fi; locate -i'
alias cdj='cd ~/Documents/code/jakarta'

alias protractor='$(npm-which protractor)'
alias webdriver-manager='$(npm-which webdriver-manager)'

git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\e[36;40m\] \$(git_branch) \t \w \n> \[\e[0m\] "
#export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -gf'
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -gf'

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

#if [ "${BASH-no}" != "no" ]; then
  #[ -r /etc/bashrc ] && . /etc/bashrc
#fi

source ~/.rvm/scripts/rvm
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
