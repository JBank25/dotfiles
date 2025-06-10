-- While in normal mode, " pv" will open file explorer mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- TODO: check better_escape plugin as replacement for jk
vim.keymap.set("i", "jk", "<Esc>")

-- Remap space to leader
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
