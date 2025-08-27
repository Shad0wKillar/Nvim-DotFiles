-- ~/.config/nvim/lua/shad0w/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	-- ...
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			-- ... your existing treesitter config
			autotag = {
				enable = true,
			},
			-- ...
		})

		-- No need to require('nvim-ts-autotag').setup() here,
		-- lazy.nvim and treesitter handle it.
	end,
}
