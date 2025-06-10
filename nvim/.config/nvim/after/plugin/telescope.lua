-- TODO: builtins from the primeagen


-- ~6:30 in this vid https://www.youtube.com/watch?v=w7i4amO_zaE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find files' })

