# Dotfiles configuration

## Install repository

```sh
# public repository
chezmoi init --apply https://github.com/IvanProg00/dotfiles.git
# private repository
chezmoi init --apply git@github.com:IvanProg00/dotfiles.git
```

## Install brew casks

```sh
brew bundle --global
```

## Configure shell

```sh
sudo echo $(which nu) >> /etc/shells
chsh -s $(which nu)
```
