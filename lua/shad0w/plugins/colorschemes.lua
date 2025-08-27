-- lua/plugins/colorschemes.lua (or wherever you define your colorscheme plugin)

return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load this at startup
		priority = 1000, -- Make sure it loads before other plugins
		opts = {
			style = "moon", -- You can choose 'storm', 'moon', 'day', 'night'
			transparent = true, -- <--- THIS IS THE KEY OPTION
			styles = {
				sidebars = "transparent", -- Make sidebars transparent
				floats = "transparent", -- Make floating windows transparent
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
			-- You might still want to explicitly set Normal and other key groups to none
			-- if the colorscheme doesn't make everything transparent by default.
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

			-- This is where you would place the manual IblScope definition if needed,
			-- but usually, transparent-aware themes handle this for you.
			-- vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888", bg = "none" })
			-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#333333", bg = "none" })
		end,
	},
}
