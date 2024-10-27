-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution

-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then

  -- stylua: ignore

  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })

end


vim.opt.rtp:prepend(lazypath)


-- validate that lazy is available

if not pcall(require, "lazy") then

  -- stylua: ignore

  vim.api.nvim_echo(

    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },

    true, {})

  vim.fn.getchar()

  vim.cmd.quit()

end


require "lazy_setup"
require "polish"
require "flash"
require "mason"
require "multiple-cursors"

vim.cmd("set smartcase")


local Plug = vim.fn["plug#"]

vim.call('plug#begin')

Plug('Mofiqul/vscode.nvim')
Plug('eldritch-theme/eldritch.nvim')

vim.call('plug#end')


-- Colorschemes Usage

vim.cmd[[colorscheme tokyonight-night]]

-- vim.cmd[[colorscheme eldritch]]

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


-- Keybindings
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>") -- space + a = toggle aerial(to show all variables and functions in code)
vim.keymap.set("n", "<C-A-a>", "<cmd>AerialToggle!<CR>") -- ctrl + alt + a = toggle aerial(to show all variables and functions in code)

vim.keymap.set("n", "<C-A-t>", "<cmd>:ToggleTerm<CR>") -- ctrl + alt + t = toggle terminal
vim.keymap.set("n", "<C-t>", "<cmd>:ToggleTerm<CR>") -- ctrl + t = toggle terminal

vim.keymap.set("n", "<C-f>", "<cmd>:Telescope fd<CR>") -- ctrl + f = open Telescope(fuzzy finder)



local c = require('vscode.colors').get_colors()

require('vscode').setup({

    -- Enable italic comment
    italic_comments = true,


    -- Underline `@markup.link.*` variants
    underline_links = true,


    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,


    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {

        vscLineNumber = '#FFFFFF',

    },


    -- Override highlight groups (see ./lua/vscode/theme.lua)

    group_overrides = {

        -- this supports the same val table as vim.api.nvim_set_hl

        -- use colors from this colorscheme by requiring vscode.colors!

        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },

    }

})

-- require('vscode').load()

-- load the theme without affecting devicon colors.

-- vim.cmd.colorscheme "vscode"


-- Configure alpha.nvim 
local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return "Made with ❤️  by FatihTheDev." 
end

-- Banner
local banner = {
   "███████   ████    ████████ ██  ██    ██     ███    ██  ██    ██  ██  ███    ███  ",
   "██      ██    ██     ██    ██  ██    ██     ████   ██  ██    ██  ██  ████  ████    ",
   "█████   ██    ██     ██    ██  ████████     ██ ██  ██  ██    ██  ██  ██ ████ ██    ",
   "██      ████████     ██    ██  ██    ██     ██  ██ ██   ██  ██   ██  ██  ██  ██     ",
   "██      ██    ██     ██    ██  ██    ██     ██   ████    ████    ██  ██      ██    ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('SPC n', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('SPC e', '  Toggle File Explorer', 'Toggle Explorer<CR>'),
  dashboard.button('SPC ff  or  CTRL f', '  Find file', ':Telescope find_files<CR>'),
  dashboard.button('SPC fo', '  Recents', 'Find history<CR>'),
  dashboard.button("SPC f'", '  Find bookmarks', 'Find marks<CR>'), 
  dashboard.button("SPC fa", '  Find config files', 'Find AstroNvim config files<CR>'),
  dashboard.button('u', '  Update plugins', ':Lazy update<CR>'),
  dashboard.button('m', '  Update mason.nvim LSPs', ':MasonUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
