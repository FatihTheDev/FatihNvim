return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  lazy = true,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    select = { lookahead = true },
  },
}
