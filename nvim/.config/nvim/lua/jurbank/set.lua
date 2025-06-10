-- This is the file where we will put all the 

-- Line numberings + rel line numberings
vim.opt.nu = true
vim.opt.relativenumber = true

-- Will highlight the term you're searching as you search it
vim.opt.incsearch = true

-- Disables the highlighting of a word when it is searched
vim.opt.hlsearch = false

-- This keeps an 8 line buffer  on the bottom of the file as
-- we move down 
vim.opt.scrolloff = 8

-- Tab key inserts spaces, not tab chars
vim.cmd("set expandtab")
-- Tab chars display as 2 spaces wide
vim.cmd("set tabstop=2")
-- Tab/Backspace inserts/removes 2 spaces
vim.cmd("set softtabstop=2")
-- Indenting/unindenting uses 2 spaces
vim.cmd("set shiftwidth=2")

































