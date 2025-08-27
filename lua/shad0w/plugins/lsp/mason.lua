return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- This list is now the COMBINED list from both files
			ensure_installed = {
				"bashls",
				"clangd",
				"omnisharp",
				"cmake",
				"cssls",
				"dotls",
				"html",
				"jdtls",
				"eslint",
				"jsonls",
				"phpactor",
				"pyright",
				"sqlls",
				"kotlin_language_server",
				"markdown_oxide",
				"vimls",
				"dockerls",
				"lua_ls",
				-- Added from your other file
				"svelte",
				"graphql",
				"emmet_ls",
			},
		})

		mason_tool_installer.setup({
			-- This is the list of your formatters and linters
			ensure_installed = {
				"shfmt",
				"clang-format",
				"asmfmt",
				"google-java-format",
				"php-cs-fixer",
				"sql-formatter",
				"markdownlint",
				"prettier",
				"stylua",
				"isort",
				"black",
				"cpplint",
				"cmakelint",
				"stylelint",
				"htmlhint",
				"checkstyle",
				"jsonlint",
				"selene",
				"phpcs",
				"sqlfluff",
				"ktlint",
				"markdownlint-cli2",
				"hadolint",
				"eslint_d",
				"pylint",
			},
		})
	end,
}
