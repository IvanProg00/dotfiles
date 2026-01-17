set fish_greeting ""

# PATH

fish_add_path /opt/homebrew/opt/openjdk/bin

fish_add_path ~/.cargo/bin

fish_add_path /Users/ivanprog00/.antigravity/antigravity/bin

# Activate Shell tools

atuin init fish | source

starship init fish | source

zoxide init fish | source
