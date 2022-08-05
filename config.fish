if status is-interactive
  # Commands to run in interactive sessions can go here
  # Path for Homebrew (Apple Silicon)
  test -d /opt/homebrew
    and fish_add_path -g /opt/homebrew/sbin /opt/homebrew/bin /opt/homebrew/opt/coreutils/libexec/gnubin

  # Load omf config in the repo
  set REPO_OMF_CONFIG "$HOME/.config/fish/omf"
  test -d $REPO_OMF_CONFIG
    and set -gx OMF_CONFIG $REPO_OMF_CONFIG
end
