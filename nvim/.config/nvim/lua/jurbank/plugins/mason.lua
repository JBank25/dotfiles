return {
  -- Mason can be used for installing LSP's clangd for example
  -- Using msaon-lspconfig to specify them more concretely however
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },
  -- Specifying LSP's specifically using this, see the config portion
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = false,
      })
    end,
  },
  -- How we are enabling a specific LSP
  -- Check which one are instlaled using :checkhealth vim-lsp
  -- Was having some clangd issues.Specifically when using conan See these pages:
  -- https://releases.llvm.org/8.0.0/tools/clang/tools/extra/docs/clangd/Installation.html
  -- https://www.reddit.com/r/neovim/comments/r0ndez/clangd_conan/
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").clangd.setup({ capabilities = capabilities })
      require("lspconfig").pyright.setup({ capabilities = capabilities })
      -- Looks like if we want specific functinoality we will have to
      -- set things like this
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      -- This was added to remove the big red "E", "H", etc that would show up to the left
      -- of the line numbers in the editor when an error had occurred
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
        },
      })
      -- Allows you to toggle error reporting lines in the editor. Without these
      -- all you are given is a red line under the line where the error occurs
      vim.keymap.set("n", "gK", function()
        local new_config = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({ virtual_lines = new_config })
      end, { desc = "Toggle diagnostic virtual_lines" })
    end,
  },
}
