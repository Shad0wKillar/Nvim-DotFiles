vim.opt.termguicolors = true
require("shad0w.core.options")
require("shad0w.core")
require("shad0w.lazy")
-- Load your custom highlight configurations AFTER LazyVim and colorschemes are loaded
require("config.copilot_colors")
