return {
	{
		"SirVer/ultisnips",
		dependencies = {
			"honza/vim-snippets", -- Optional: A collection of snippets
		},
		config = function()
			-- Configure UltiSnips
			vim.g.UltiSnipsExpandTrigger = "<C-p>"
			vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
			vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "mysnippets" } -- Custom snippet directories
		end,
	},
}
