# This function was adapted from:
# https://github.com/fish-shell/fish-shell/blob/3.5.1/share/functions/fish_title.fish
#
# Changes:
# 1. sub -l 20  ->  sub -l 32
# 2. prompt_pwd -d 1 -D 1  ->  prompt_pwd -d 16 -D 8

function fish_title
    # emacs' "term" is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        # If we're connected via ssh, we print the hostname.
        set -l ssh
        set -q SSH_TTY
        and set ssh "["(prompt_hostname | string sub -l 10 | string collect)"]"
        # An override for the current command is passed as the first parameter.
        # This is used by `fg` to show the true process name, among others.
        if set -q argv[1]
            echo -- $ssh (string sub -l 32 -- $argv[1]) (prompt_pwd -d 16 -D 8)
        else
            # Don't print "fish" because it's redundant
            set -l command (status current-command)
            if test "$command" = fish
                set command
            end
            echo -- $ssh (string sub -l 32 -- $command) (prompt_pwd -d 16 -D 8)
        end
    end
end
