return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- core LSP, Mason and completion imports
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- 1) MASON SETUP
		mason.setup() -- initialize Mason :contentReference[oaicite:0]{index=0}

		-- 2) COMMON LSP CAPABILITIES (for nvim-cmp)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- 3) GLOBAL LSP ATTACH MAPPINGS
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP references" })
				)
				keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP definitions" })
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP implementations" })
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" })
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code actions" })
				)
				keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Smart rename" })
				)
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					vim.tbl_extend("force", opts, { desc = "Buffer diagnostics" })
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Line diagnostics" })
				)
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
				keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover doc" }))
				keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Restart LSP" })
				)
			end,
		})

		-- 4) DIAGNOSTICS SIGNS
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			-- you can add virtual_text, float, underline, etc. here
		})

		-- 5) MASON-LSPCONFIG WITH v2 HANDLERS
		mason_lspconfig.setup({
			ensure_installed = { "svelte", "graphql", "emmet_ls", "lua_ls" },
			automatic_installation = true,
			handlers = {
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Custom Svelte handler
				svelte = function()
					lspconfig.svelte.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,

				-- Custom GraphQL handler
				graphql = function()
					lspconfig.graphql.setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,

				-- Custom Emmet handler
				emmet_ls = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				-- Custom Lua handler
				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
			},
		}) -- migrate from setup_handlers → handlers :contentReference[oaicite:1]{index=1}
	end,
}
