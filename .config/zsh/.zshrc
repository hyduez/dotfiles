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

yradio() {
    if [ -z "$1" ]; then
        echo "Usage: yradio <YouTube URL>"
        echo "Example: yradio https://www.youtube.com/watch?v=abcd1234"
        return 1
    fi

    ID=$(echo "$1" | sed -E 's/.*(v=|youtu\.be\/|embed\/)([a-zA-Z0-9_-]{11}).*/\2/')

    if [ -z "$ID" ] || [ "${#ID}" -ne 11 ]; then
        echo "Could not extract a valid ID from the URL."
        return 1
    fi

    yt-dlp \
        -x \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --add-metadata \
        -o "%(playlist_index)03d - %(title)s.%(ext)s" \
        --playlist-items 1:100 \
        "https://www.youtube.com/watch?v=$ID&list=RD$ID"
}

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

source ~/envs.sh

[ -s "/home/paulov/.local/share/bun/_bun" ] && source "/home/paulov/.local/share/bun/_bun"
