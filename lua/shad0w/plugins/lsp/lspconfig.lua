-- ~/.config/nvim/lua/shad0w/plugins/lsp/lspconfig.lua

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Only list dependencies, do not call setup functions here
		"williamboman/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		-- ... other dependencies
	},
	config = function()
		-- ... (keep all your lspconfig logic, keymaps, and handlers)

		-- REMOVE the mason.setup() and mason_lspconfig.setup() blocks from this file.

		-- ...
	end,
}
