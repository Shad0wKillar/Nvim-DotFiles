-- ~/.config/nvim/lua/shad0w/plugins/lsp/lspconfig.lua

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp", -- For LSP capabilities
	},
	config = function()
		-- Require plugins
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Define the on_attach function to set keymaps after LSP attaches
		local on_attach = function(client, bufnr)
			local keymap = vim.keymap
			local opts = { buffer = bufnr, noremap = true, silent = true, desc = "LSP" }

			keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end

		-- The main setup call. We are now using the correct API.
		mason_lspconfig.setup({
			-- NOTE: The `ensure_installed` list is correctly placed in your `mason.lua`.
			-- We don't need it here.

			-- The 'handlers' table is the correct place for custom server setups.
			handlers = {
				-- This is the default handler for any server that doesn't have a specific
				-- entry below. It just runs the server with the default config.
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				-- Custom handler specifically for 'pyright' to make it venv-aware.
				["pyright"] = function()
					local util = require("lspconfig.util")
					lspconfig.pyright.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							python = {
								-- This automatically finds and sets the pythonPath
								-- to your project's virtual environment.
								pythonPath = util.path.join(
									util.root_pattern(".venv", "venv", ".git")(),
									"bin",
									"python"
								),
							},
						},
					})
				end,
			},
		})
	end,
}
