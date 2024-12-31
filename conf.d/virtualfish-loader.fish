set -g VIRTUALFISH_VERSION 2.5.5
set -g VIRTUALFISH_PYTHON_EXEC /opt/homebrew/opt/python@3.13/bin/python3.11
set -g VIRTUALFISH_HOME ~/.venv
source /opt/homebrew/lib/python3.13/site-packages/virtualfish/virtual.fish
emit virtualfish_did_setup_plugins
