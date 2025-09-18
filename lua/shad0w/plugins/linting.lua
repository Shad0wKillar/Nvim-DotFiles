-- ~/.config/nvim/lua/shad0w/plugins/linting.lua

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- This helper function finds the correct pylint executable.
		local function get_venv_pylint()
			local buf = vim.api.nvim_get_current_buf()
			local buf_name = vim.api.nvim_buf_get_name(buf)

			if not buf_name or buf_name == "" then
				return "pylint" -- Fallback for unnamed buffers
			end

			-- Find the project root
			local root = require("lspconfig.util").root_pattern(".venv", "venv", ".git")(buf_name)
			if root then
				-- Check for .venv/bin/pylint
				local pylint_path = root .. "/.venv/bin/pylint"
				if vim.fn.filereadable(pylint_path) then
					return pylint_path
				end
				-- Check for venv/bin/pylint
				pylint_path = root .. "/venv/bin/pylint"
				if vim.fn.filereadable(pylint_path) then
					return pylint_path
				end
			end
			-- If no venv pylint is found, use the global one (from Mason)
			return "pylint"
		end

		-- We are still using the simple approach: modifying the built-in linter.
		local pylint = lint.linters.pylint

		-- The cmd is a function that now correctly gets the buffer information.
		pylint.cmd = function()
			return get_venv_pylint()
		end

		-- Assign the modified 'pylint' linter to Python files.
		lint.linters_by_ft = {
			bash = { "shellcheck" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			cmake = { "cmakelint" },
			css = { "stylelint" },
			html = { "htmlhint" },
			java = { "checkstyle" },
			json = { "jsonlint" },
			luadoc = { "selene" },
			php = { "phpcs" },
			sql = { "sqlfluff" },
			kotlin = { "ktlint" },
			markdown = { "markdownlint-cli2" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			python = { "pylint" },
		}

		-- Standard autocommand to trigger linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Standard keymap to trigger linting manually
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
