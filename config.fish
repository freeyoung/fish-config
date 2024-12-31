# show command duration when a command takes more than X milliseconds,
# or when the value of SHOW_COMMAND_DURATION is not empty:
function show_command_duration --on-event fish_postexec
  set -q COMMAND_DURATION_THRESHOLD_MS; or set COMMAND_DURATION_THRESHOLD_MS 5000
  if test $CMD_DURATION -gt $COMMAND_DURATION_THRESHOLD_MS
    or test -n "$SHOW_COMMAND_DURATION"
      set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
      echo "Duration: $duration"
      set CMD_DURATION 0
  end
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  # Path for Homebrew (Apple Silicon)
  test -d /opt/homebrew
    and fish_add_path -g /opt/homebrew/sbin /opt/homebrew/bin /opt/homebrew/opt/coreutils/libexec/gnubin /opt/homebrew/opt/grep/libexec/gnubin

  test -f $HOME/.local/bin/poetry
    and fish_add_path -g $HOME/.local/bin

  test -d $HOME/go/bin
    and fish_add_path -g $HOME/go/bin

  # Load omf config in the repo
  set REPO_OMF_CONFIG "$HOME/.config/fish/omf"
  test -d $REPO_OMF_CONFIG
    and set -gx OMF_CONFIG $REPO_OMF_CONFIG

  # Load ssh private keys when absent
  ssh-add -l > /dev/null || ssh-add
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

