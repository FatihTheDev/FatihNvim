
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


require("lazy_setup")
require("polish")
require("alpha")
require("flash")
require("mason")
require("multiple-cursors")
require("nvim-treesitter")
require("astrocore")
require("plugins.colorschemes")
require("plugins.kanagawa_theme")
require("plugins.neoscroll")
require("live-server")
require("plugins.formatting_and_linting")
require("plugins.tailwind-tools")
require("plugins.nvim-tetris")


vim.cmd("set smartcase")

-- directory where swapfiles will be stored (works on Linux, Windows and MacOS)
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local home = vim.fn.expand("~")  -- Works for both Unix and Windows
local config_dir = is_windows and home .. "\\AppData\\Local\\nvim" or home .. "/.config/nvim"
local swapdir = config_dir .. "/swapfiles"

if vim.fn.isdirectory(swapdir) == 0 then
  vim.fn.mkdir(swapdir, "p")
end

vim.opt.directory = swapdir


-- Colorschemes Usage

-- vim.cmd[[colorscheme tokyonight-night]]

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- vim.cmd[[colorscheme eldritch]]

-- vim.cmd("colorscheme kanagawa")

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

        vscLineNumber = '#555555',

    },


    -- Override highlight groups (see ./lua/vscode/theme.lua)

    group_overrides = {

        -- this supports the same val table as vim.api.nvim_set_hl

        -- use colors from this colorscheme by requiring vscode.colors!

        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },

    }

})

require('vscode').load()

-- load the theme without affecting devicon colors.

vim.cmd.colorscheme "vscode"


-- Configure alpha.nvim 
local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
  return "Made with ❤️  by FatihTheDev."
end

-- Banner
local banner = {
"                     / / |      ",
"                   _/ / /       ",
"              _,-' `Z_/          ███████   ████    ████████ ██  ██    ██     ███    ██  ██    ██  ██  ███    ███",
"            ,-'_,-.    |  _      ██      ██    ██     ██    ██  ██    ██     ████   ██  ██    ██  ██  ████  ████",
"          _(_-'_()|     |' |     █████   ██    ██     ██    ██  ████████     ██ ██  ██  ██    ██  ██  ██ ████ ██",
"  ,--_,--'                 |     ██      ████████     ██    ██  ██    ██     ██  ██ ██   ██  ██   ██  ██  ██  ██",
" / ''                      L-'/  ██      ██    ██     ██    ██  ██    ██     ██   ████    ████    ██  ██      ██",
" |,--^---v--v-._        /   / | ",
" |_________________,-'      |   ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('SPC n', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('SPC e', '  Toggle File Explorer', 'Toggle Explorer<CR>'),
  dashboard.button('SPC ff  or  CTRL f', '  Find file', ':Telescope find_files<CR>'),
  dashboard.button('SPC Ss', '  Save current session', 'Save this session<CR>'),
  dashboard.button('SPC Sf', '  List all saved sessions', 'Load a sessionCR>'),
  dashboard.button("SPC f'", '  Find bookmarks', 'Find marks<CR>'),
  dashboard.button("SPC Sf", '  Find sessions', 'Find marks<CR>'),
  dashboard.button('u', '  Update plugins', ':Lazy update<CR>'),
  dashboard.button('m', '  Update mason.nvim LSPs', ':MasonUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)

