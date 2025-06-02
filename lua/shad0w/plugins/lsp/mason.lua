return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
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
			-- list of servers for mason to install
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
				-- "tsserver",
			},
		})

		mason_tool_installer.setup({
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
				-- "shellcheck", type :Mason , press "4" and then search and install shellcheck
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
				"eslint",
				"pylint",
			},
		})
	end,
}
