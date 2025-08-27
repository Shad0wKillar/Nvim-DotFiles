-- This file ensures that the background is always transparent.
-- It works by setting the background of Neovim's core UI components to "NONE".

-- Enable syntax highlighting
vim.cmd("syntax on")

local highlights = {
	-- The default background
	"Normal",
	-- Background for non-current windows
	"NormalNC",
	-- The background of floating windows
	"NormalFloat",
	-- The border of floating windows
	"FloatBorder",
	-- The popup menu for completion
	"Pmenu",
	-- The background of the popup menu's selected item
	"PmenuSel",
	-- The sign column for git signs, diagnostics
	"SignColumn",
	-- The line number columns
	"LineNr",
	"CursorLineNr",
	-- The area where you see '~' at the end of a buffer
	"EndOfBuffer",
	-- Any characters that are not actual text, like trailing spaces
	"NonText",
}

-- Apply the transparent background to all specified highlight groups
for _, group in ipairs(highlights) do
	vim.api.nvim_set_hl(0, group, { bg = "none" })
end

-- These lines are set so it won't error for indent-line plugins.
-- Define IblScope with a foreground color and transparent background
-- You can choose any color here. '#888888' is a light gray.
vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888", bg = "none" })
-- You might also need to define other IBL highlight groups if more errors appear.
-- For instance, the basic indent lines are often IblIndent or similar:
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#333333", bg = "none" })
