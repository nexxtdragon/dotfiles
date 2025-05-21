# ~/.zshrc

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

autoload -U colors && colors

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  local last_status=$?
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ $last_status -eq 0 ]; then
      export RPROMPT="%F{231}// %F{green}⚡ ${timer_show}s%f"
    else
      export RPROMPT="%F{231}// %F{red}❌ ${timer_show}s%f"
    fi
    unset timer
  else
    export RPROMPT=""
  fi
  return $last_status
}

PROMPT="%F{231}╭──(%F{67}%n@%m%F{231}) [ %F{67}%~%F{231} ]
%F{231}╰─╼ \$ %f"

plugins=()

autoload -U compinit && compinit

ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' completer _complete _ignored _commands
zstyle ':completion:*' menu select

alias ls='ls --color=auto'
alias grep='grep --color=auto'

neofetch
