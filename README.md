# My dotfiles

This pository contains my important dotfiles that I want to share between my machines. You can use them however you want.

## Requirements

Ensure you have the following installed on your system.

### Git

```
# pacman -S git
```

### Stow

```
# pacman -S stow
```

## Installation

First, clone the repo to your $HOME directory.

```
$ git clone git@github.com:Deathlesz/dotfiles.git
$ cd dotfiles
```

Then use GNU Stow to create symlinks

```
$ stow .
```

## License

This repository is licensed under [WTFPL Public License](LICENSE). So... do what the fuck you want with it.
