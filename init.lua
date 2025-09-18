vim.opt.termguicolors = true
require("shad0w.core.options")
require("shad0w.core")
require("shad0w.lazy")
-- Load your custom highlight configurations AFTER LazyVim and colorschemes are loaded
require("config.copilot_colors")

-- If you are using kitty, kitty will change the color of cursor
-- So instead of setting the colors here, set it in ~/.config/kitty/colors-matugen.conf
-- by setting the "cursor" and "curosr_text_color" values.
