-- Install tokyonight.nvim colorscheme 
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
  },
-- Install eldritch.nvim colorscheme 
  {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    opts = {},
  },
-- Install vscode.nvim colorscheme
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    lazy = true,

  },
-- Install gruvbox.nvim colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
    opts = {}
}
}

