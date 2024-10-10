return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
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
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter

				-- formatters below
				-- "shellcheck", -- install it manually using :Mason command -> Going into linter by pressing 4 -> searching for shellcheck using /shellcheck -> press "i" to install is manually
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
