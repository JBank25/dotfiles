return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			-- Table of sources
			sources = {
				-- https://github.com/nvimtools/none-ls-extras.nvim/tree/main
				-- https://stackoverflow.com/questions/78108133/issue-with-none-ls-configuration-error-with-eslint-d 
				require("none-ls.diagnostics.cpplint"),
				-- :MasonInstall stylua for lua formatter
				null_ls.builtins.formatting.stylua,
				-- clang formatter cor C/C++ already installed with LSP I guess

				-- cpplint for linting
				--null_ls.builtins.diagnostics.cpplint,
			},
		})
		-- Will call format for the built-in lsp client
		-- for nvim
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
