-- lua/shad0w/plugins/copilot.lua
return {
	-- 1) Core Copilot client
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = true },
			})
		end,
	},

	-- 2) Integrate Copilot into nvim-cmp
	{
		"zbirenbaum/copilot-cmp",
		after = "copilot.lua",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- 3) Copilot Chat UI
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- correct ASCII hyphen :contentReference[oaicite:1]{index=1}
		dependencies = {
			"zbirenbaum/copilot.lua", -- core client
			"nvim-lua/plenary.nvim", -- async utilities
			"MunifTanjim/nui.nvim", -- UI components
		},
		cmd = { "CopilotChat", "CopilotChatOpen" },
		build = "make tiktoken", -- optional token counting
		opts = {
			panel = { enabled = true },
			popup = { border = { style = "rounded" } },
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
		end,
	},
}
