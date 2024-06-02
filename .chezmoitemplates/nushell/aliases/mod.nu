export use "exa.nu" *
export use "kubectl.nu" *
export use "lazygit.nu" *
export use "terraform.nu" *
export use "cargo.nu" *

# Updates Brew packages and Rust.
export def full_update [] { 
    print $'(ansi red_bold)Brew update(ansi reset)'
    brew update; brew upgrade; brew cleanup --prune=all 
    print $'(ansi red_bold)Rust update(ansi reset)'
    rustup update
}
