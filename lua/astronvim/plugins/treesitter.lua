return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0,
  cmd = { "TSInstall", "TSInstallFromGrammar", "TSUninstall", "TSUpdate", "TSLog" },
  build = ":TSUpdate",
  opts = {},
}
