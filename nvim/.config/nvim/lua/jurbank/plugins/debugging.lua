-- NOTE: python debugging will differ across machines I believe.
-- Maybe if it is installed system wide things will be more or less
-- the same???
return {
	-- Debug Adapter Protocol so we can easily debug in nvim
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- This is a dependency of nvim-dap-ui
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		-- I think this will change depending on how you install
		-- here: https://codeberg.org/mfussenegger/nvim-dap-python
		dap_python.setup("~/.virtualenvs/debugpy/bin/python")

    dapui.setup({})

		-- keybindings for nvim-dap-ui
		-- Automatically open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- keybindings for nvim-dap
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dB", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end)
	end,
}

-- nvim-dap-ui provides a nice layer on top of nvim-dap that looks a bit
-- more familiar to us. The panes are nice to have, again a bit more of a
-- familiar experience of debugging. Breakpoints, step over functions,
-- step into funcitons, variable tracing, etc
--
-- Once you have the two plugins above installed you still need to install specific debug
-- adapters to get going in a certain language.
-- See the list of supported languages here: https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
--
-- Languages have different tooling so the setup process will differ between each
