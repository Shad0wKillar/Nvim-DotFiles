return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "javascriptreact", "typescriptreact", "vue" }, -- File types where auto-tagging should be enabled
	config = function()
		require("nvim-ts-autotag").setup({}) -- Basic setup
	end,
	requires = "nvim-treesitter", -- nvim-ts-autotag depends on nvim-treesitter
}
