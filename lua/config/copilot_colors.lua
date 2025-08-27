-- ~/.config/nvim/lua/config/copilot_colors.lua
vim.api.nvim_set_hl(0, "CopilotSuggestion", {
	fg = "#E000E0", -- A vivid purple color (example)
	-- bg = "NONE",   -- No background color (transparent)
	-- blend = 20,    -- Make it slightly transparent (value from 0 to 100)
})

-- If you also use copilot.cmp (for autocompletion suggestions)
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {
	fg = "#E000E0", -- Same vivid purple for Copilot completion items
})
