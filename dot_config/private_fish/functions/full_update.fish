function full_update -d "Update Homebrew"
    set_color red --bold
    echo "Delete Zellij sessions"
    set_color normal
    zellij delete-all-sessions --yes

    set_color red --bold
    echo "Brew update"
    set_color normal
    brew update; and brew upgrade --yes; and brew cleanup --prune=all

    set_color red --bold
    echo "Gcloud update"
    set_color normal
    gcloud components update --quiet
end
