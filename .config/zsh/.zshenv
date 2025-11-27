# All of these variables go to /etc/zshenv or any shell you use

# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_STATE_HOME="$HOME/.local/state"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export ZPLUG_HOME="$XDG_DATA_HOME/zplug"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export WAKATIME_HOME="$XDG_DATA_HOME/wakatime"
export ESP_IDF_TOOLS_PATH="$XDG_DATA_HOME/espressif"

export ZSHZ_DATA="$XDG_STATE_HOME/zsh-z/.z"

export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export QT_CONFIG_HOME="$XDG_CONFIG_HOME/QtProject"

export BUN_INSTALL="$XDG_DATA_HOME/bun"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export FNM_PATH="$XDG_DATA_HOME/fnm"

export XDG_RUNTIME_DIR="/run/user/$UID"
export MOZ_ENABLE_WAYLAND=1
export LIBSEAT_BACKEND=seatd
export $(dbus-launch)
