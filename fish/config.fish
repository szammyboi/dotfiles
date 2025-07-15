if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set fish_cursor_default_block

function starship_transient_prompt_func
	starship module character
end
function starship_transient_rprompt_func
	starship module time
end
starship init fish | source

export STARSHIP_COCKPIT_MEMORY_USAGE_ENABLED=true
enable_transience

alias sg="s -p google"

function lc
	if test (count $argv) -eq 0
		echo "Usage: linecount <file-ext>"
		return 1
	end

	set ext $argv[1]

	find . -type f -name "*.$ext" | xargs wc -l
end

function lse
    find . -type f | sed -n 's/.*\.\([^.\/]*\)$/\1/p' | sort -u
end


# Created by `pipx` on 2025-05-21 05:11:36
set PATH $PATH /Users/szammy/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
