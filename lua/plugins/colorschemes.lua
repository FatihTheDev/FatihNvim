-- Install tokyonight.nvim colorscheme 
return{
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
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
    lazy = true,

  },
-- Install gruvbox.nvim colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
    opts = ...}
}
