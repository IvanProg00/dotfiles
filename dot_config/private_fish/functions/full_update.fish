function full_update -d "Update Homebrew"
    set_color red --bold
    echo "Brew update"
    set_color normal

    brew update; and brew upgrade; and brew cleanup --prune=all
end
