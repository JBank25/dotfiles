### indent-blankline

Draws a line going down the editor at a given line of code to
show its indentation level. Mirrors the functionality of the
one VsCode has
Repo: https://github.com/lukas-reineke/indent-blankline.nvim


### Mason and Mason-LSPConfig

These two packages help us to install things like Linters, LSP's, and
Formatters. With both of these installed we can install and more or less
abstract away the wiring needed between neovim and the LSP, Linter, etc

Repo's: https://github.com/mason-org/mason.nvim
        https://github.com/mason-org/mason-lspconfig.nvim

### NVIM LSP Config

Here we enable LSP's and dictate a little more how they, alongside the other
packages installed using Mason (LSP's only I think, linters and formatters use
non-ls) will interact with the editor. I have a few keybindings for example
that are here. I have also modified the way that errors, hints, etc show up in
the editor.

Repo: https://github.com/neovim/nvim-lspconfig

### None-ls

Many popular linters and formatters are command line tools and aren't language
servers in and of themselves. Null-ls or None-ls wraps command line tools into
a generalized LSP allowing communication between our LSP and the linter or
formatter at hand. In none-ls.lua we will specify keybindings we want for our
formatters as well as the linters and formatters we want running

Repo: https://github.com/nvimtools/none-ls.nvim

### Nvim-Tree

This is just a file explorer we can use. Pretty similar to the one offered by VsCode.

The keybindings for this one I have specified in
`after/plugin/nvim-tree.lua` for some reason

Repo: https://github.com/nvim-tree/nvim-tree.lua

### Telescope

Nice fuzzy finder that can be used to search
for file as well as for regex's within files.
I'm sure it has more functionality but that
is how I am using it at the moment

Keybindings for this one are in `after/plugin/telescope.lua`

Repo: https://github.com/nvim-telescope/telescope.nvim

### Treesitter

Repo: https://github.com/nvim-treesitter/nvim-treesitter

