export TERM=xterm

source $XDG_DATA_HOME/zplug/init.zsh

export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

setopt autocd extendedglob nomatch notify
bindkey -v

zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"
autoload -Uz compinit
compinit

zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-autosuggestions"
zplug "anatolykopyl/doas-zsh-plugin"
zplug "plugins/git", from:oh-my-zsh

eval "$(starship init zsh)"

export GPG_TTY=$(tty)

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*} & fg; }

[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:$XDG_DATA_HOME/cargo/bin/
export PATH=$PATH:$HOME/Downloads/zig/

if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

alias ls="exa -l --color=never --icons=always -B -o --no-permissions"
alias cat="bat"
alias tweet="ssh envs.net twtxt tweet "

source <(fzf --zsh)

[ -s "/home/paulov/.local/share/bun/_bun" ] && source "/home/paulov/.local/share/bun/_bun"
