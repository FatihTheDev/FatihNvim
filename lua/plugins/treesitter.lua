-- Customize Treesitter (This is for syntax highlighting)

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- "clojure",
      -- "cmake",
      -- "csv",
      -- "dart",
      -- "vue",
      -- "vim"
      -- "dockerfile",
      -- "elixir",
      -- "erlang",
      -- "fsharp",
      -- "go",
      -- "graphql",
      -- "haskell",
      -- "kotlin",
      -- "htmldjango",
      -- "jsdoc",
      -- "javadoc",
      -- "julia",
      -- "latex",
      -- "matlab",
      -- "nginx",
      -- "objc",   -- Objective C
      -- "pascal",
      -- "perl",
      -- "prolog",
      -- "qmljs",
      -- "regex",
      -- "ruby",
      -- "rust",
      -- "solidity",
      -- "svelte",
      -- "swift",
      --
      "lua",
      "c",
      "c_sharp",
      "cpp",
      "css",
      "html",
      "java",
      "javascript",
      "json",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "scss",
      "sql",
      "tsx",
      "typescript"
      -- add more arguments for adding more treesitter parsers
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true;
    },
  },
}
