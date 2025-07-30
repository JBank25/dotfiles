### alacritty

Navigated to `~/dotfiles` and ran:

`stow alacritty`

To symlink these files to `~/.config/alacritty`


### tmux
Will need to clone the `tmux plugin manager` for tmux to
properly work

Go here:

https://github.com/tmux-plugins/tpm

I think the only step that is needed is this:

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

Then use `prefix+I` to install the plugins you specified in your `.tmux.conf`

Plugin specification should look something like this in `.tmux.conf`:
```
set -g @plugin 'tmux-plugins/tpm'
```

### zsh

Navigated to `~/dotfiles`

Then ran `stow -t ~ zsh`

To symlink this to `~/.zshrc`


### nvim

Navigated to `~/dotfiles` and ran:

`stow nvim`

To symlink these files to `~/.config/nvim`

### starship

Navigated to `~/dotfiles` and ran:

`stow --targert=$HOME starship`

To symlink these files to `~/.config/starship.toml`
