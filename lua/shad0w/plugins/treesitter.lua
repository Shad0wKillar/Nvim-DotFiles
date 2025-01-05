return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- Import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Configure Treesitter
		treesitter.setup({
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
			-- Ensure these language parsers are installed
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

		-- Configure nvim-ts-autotag with the new options layout
		require("nvim-ts-autotag").setup({
			close = true, -- Auto close tags
			rename = true, -- Auto rename pairs of tags
			close_on_slash = false, -- Auto close on trailing </
			filetypes = {
				html = {

					close = false, -- Disable auto close tags for HTML specifically
				},
			},
		})
	end,
}
