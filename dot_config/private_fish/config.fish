# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/ivanprog00/.docker/bin"
# End of Docker Desktop section.

set fish_greeting ""

# PATH

fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.antigravity/antigravity/bin
fish_add_path (go env GOPATH)/bin
fish_add_path ~/.pub-cache/bin
fish_add_path /opt/homebrew/share/google-cloud-sdk/bin
fish_add_path /opt/homebrew/opt/libpq/bin

set -gx EDITOR nvim

# Configuration

fish_vi_key_bindings

# Activate Shell tools

atuin init fish | source

starship init fish | source

zoxide init fish | source

set -gx LIBRARY_PATH /opt/homebrew/lib $LIBRARY_PATH
