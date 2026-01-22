if status --is-login
    if test -z "$DISPLAY"; and test -z "$WAYLAND_DISPLAY"; and test (tty) = /dev/tty1
        exec Hyprland
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    export HOMEBREW_NO_ENV_HINTS=1
    if not set -q NO_FASTFETCH
        fastfetch
    end
    alias ls lsd
    alias ll "lsd -alF"

    function ppwd
        set_color cyan
        echo "📂 "(string replace -r "^$HOME" "~" (pwd))
        set_color normal
    end

    function mkcd
        set -l dir (string join " " -- $argv)
        mkdir -p -- "$dir"
        cd -- "$dir"
    end

    function a --description "Find and activate a Python virtual environment"
        # Do not activate if already inside a venv
        if set -q VIRTUAL_ENV
            echo "A virtual environment is already active: $VIRTUAL_ENV"
            return 0
        end

        set dir (pwd)

        while test "$dir" != /
            # Explicit common names
            for candidate in venv .venv
                if test -f "$dir/$candidate/bin/activate.fish"
                    source "$dir/$candidate/bin/activate.fish"
                    echo "Activated virtual environment: $dir/$candidate"
                    return 0
                end
            end

            # Generic pattern: any directory with activate.fish
            for activate in (find "$dir" -maxdepth 2 -type f -name activate.fish 2>/dev/null)
                source "$activate"
                echo "Activated virtual environment: "(dirname (dirname "$activate"))
                return 0
            end

            set dir (dirname "$dir")
        end

        echo "No Python virtual environment found."
        return 1
    end
end

eval "$(/opt/homebrew/bin/brew shellenv)"
