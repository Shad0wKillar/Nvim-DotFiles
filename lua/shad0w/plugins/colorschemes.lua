-- ~/.config/nvim/lua/shad0w/plugins/colorschemes.lua

return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load this at startup
		priority = 1000, -- Make sure it loads before other plugins
		opts = {
			style = "moon",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
			vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
		end,
	},
}
