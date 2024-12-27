# finish fish installation
eval (/opt/homebrew/bin/brew shellenv)

# clear welcome text
set -g fish_greeting

# language
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# .config path
set -x CONFIG_PATH ~/.config

# Commands to run in interactive sessions can go here
if status is-interactive
    # jj setup
    if type -q jj
        jj util completion fish | source
    end

    # uv setup
    if type -q uv
        # uv setup
        source $HOME/.cargo/env.fish
        uv generate-shell-completion fish | source
    end

    # pyenv setup
    if type -q pyenv
        # set -Ux PYENV_VERSION "3.11"
        set -Ux PYENV_ROOT "$HOME/.pyenv"
        fish_add_path $PYENV_ROOT/bin
        pyenv init - | source
    end

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
        fzf --fish | source
        set -x FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
        # abbr -a f "find * -type f | fzf"
        alias f "find * -type f | fzf"
    end

    # if bat is available
    if type -q bat
        # abbr -a -g cat "bat --color=always --style=numbers"
        # abbr -a cat "bat --color=always --style=numbers"
        alias cat "bat --color=always --style=numbers"
    end

    # if zoxide is available
    if type -q zoxide
        zoxide init fish | source
        abbr j z
    end

    if type -q tmux
        # abbr -a tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"
        # abbr -ag tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"
        alias tmux "tmux -f $CONFIG_PATH/tmux/tmux.conf"

        # if bass fish plugin available
        if type -q bass
            # abbr -a tat "bass $CONFIG_PATH/fish/custom-scripts/tmux-tat.sh"
            alias tat "bass $CONFIG_PATH/fish/custom-scripts/tmux-tat.sh"
        end
    end
end
