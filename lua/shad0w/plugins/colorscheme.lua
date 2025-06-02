return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin", -- Recommended for catppuccin
	config = function()
		require("catppuccin").setup({
			transparent_background = true, -- Enable transparency
			-- You can also configure styles for specific elements if needed
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			-- other catppuccin options...
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
