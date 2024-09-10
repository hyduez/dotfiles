export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "agkozak/zsh-z"

if [ -e /home/paulov/.nix-profile/etc/profile.d/nix.sh ]; then . /home/paulov/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

eval "$(starship init zsh)"
eval "$(fnm env --shell zsh)"

# Then, source plugins and add commands to $PATH
zplug load

export GPG_TTY=$(tty)

# bun completions
[ -s "/home/paulov/.bun/_bun" ] && source "/home/paulov/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
