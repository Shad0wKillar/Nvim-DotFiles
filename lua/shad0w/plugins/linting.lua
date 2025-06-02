return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

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
      python = { "pyling" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
