return {
  -- Formatter
  { "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },

  -- Linter (optional)
  { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" }, config = function()
    require("lint").linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
      sql = { "sqlfluff" },
      -- Add more if needed
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end },

  -- Automatic formatter/linter install via Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier", -- HTML, CSS, JS, TS, JSON, Markdown
        "stylua", -- Lua
        "clang-format", -- C, C++
        -- "csharpier", -- C#
        "sql-formatter", -- SQL
        "google-java-format", -- Java
        "markdownlint", -- Markdown
        "jsonlint", -- JSON
        "black", -- Python (optional)
        "shfmt", -- Shell

        -- Linters (for nvim-lint)
        "eslint_d",
        "sqlfluff",
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
