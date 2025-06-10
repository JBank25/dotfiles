-- github and docs here: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- build config item tells lazy that when we update this plugin you should call ":TSUpdate"
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "cmake" },
				-- Auto install when treesitter encounters language it does not
				-- already have a parse for. Opted for this rather than manually 
				-- specifying like I am above using ensure_installed
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
