return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			-- autotag = {
			-- enable = true,
			-- },
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"cpp",
				"css",
				"disassembly",
				"dot",
				"html",
				"java",
				"javascript",
				"json",
				"json5",
				"luadoc",
				"php",
				"python",
				"sql",
				"kotlin",
				"markdown",
				"vim",
				"dockerfile",
				"gitignore",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
