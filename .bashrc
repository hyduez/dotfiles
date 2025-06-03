# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() {
  co $1 && ./${1%.*} &
  fg
}
