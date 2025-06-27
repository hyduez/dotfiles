# Calling z-plug
source ~/.zplug/init.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/paulov/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zplug "agkozak/zsh-z"
zplug "plugins/git", from:oh-my-zsh

eval "$(starship init zsh)"
# End of lines added by paulov

export GPG_TTY=$(tty)

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# fnm
FNM_PATH="/home/paulov/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/paulov/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

alias ls="exa -l --color=never --icons=always -B -o --no-permissions"

alias tweet="ssh envs.net twtxt tweet "

co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*} & fg; }

# bun completions
[ -s "/home/paulov/.bun/_bun" ] && source "/home/paulov/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH=$PATH:/home/paulov/.spicetify

