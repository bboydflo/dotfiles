# clear welcome text
set -g fish_greeting

# language
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# finish fish installation
eval (/opt/homebrew/bin/brew shellenv)

# .config path
set -x CONFIG_PATH ~/.config

# Commands to run in interactive sessions can go here
if status is-interactive

    # https://stackoverflow.com/a/48750830/1597360
    # Fish shell; import config into main config based on the current hostname
    set host_config $CONFIG_PATH/fish/config-(hostname).fish
    test -r $host_config; and source $host_config

    # volta setup
    if type -q volta
        set -gx VOLTA_HOME "$HOME/.volta"
        set -gx PATH "$VOLTA_HOME/bin" $PATH
    end

    # eza setup
    if type -q eza
        # abbr -a ll "eza -lg --icons"
        # abbr -a lla "eza -lga --icons # ll -a"
        alias ll "eza -lg --icons"
        alias lla "ll -a"
    end

    ## starship setup
    # if type -q starship
    #     set -x STARSHIP_CONFIG $CONFIG_PATH/starship/config.toml
    #     init starship
    #     starship init fish | source
    # end

    # better find
    if type -q fzf
        set -x FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
        # abbr -a f "find * -type f | fzf"
        alias f "find * -type f | fzf"
    end

    # if bass fish plugin available
    if type -q bass
        # abbr -a tat "bass $CONFIG_PATH/fish/custom-scripts/tmux-tat.sh"
        alias tat "bass $CONFIG_PATH/fish/custom-scripts/tmux-tat.sh"
    end

    # if bat is available
    if type -q bat
        # abbr -a -g cat "bat --color=always --style=numbers"
        # abbr -a cat "bat --color=always --style=numbers"
        alias cat "bat --color=always --style=numbers"
    end

    if type -q z
        # miscellaneous abbreviations and aliases
        alias j z
        # abbr -a tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"
        # abbr -ag tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"
        alias tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"
    end
end
