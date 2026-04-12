# 🚀 FatihNvim - extended AstroNvim configuration

This is my personalized fork of [AstroNvim](https://astronvim.com/), enhanced with additional plugins and customizations for an improved editing experience.

## ✨ Added Features

- **Enhanced Motion**: [flash.nvim](https://github.com/folke/flash.nvim) for quick navigation
- **Multi-Cursor Support**: [multiple-cursors.nvim](https://github.com/brenton-leighton/multiple-cursors.nvim)
- **Development Tools**: [live-server.nvim](https://github.com/aurum77/live-server.nvim) for real-time preview
- **Tetris**: [nvim-tetris](https://github.com/alec-gibson/nvim-tetris)
- **Additional Themes & Plugins**:
  - [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A clean, dark Neovim theme
  - [alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and fully programmable greeter
  - [flash.nvim](https://github.com/folke/flash.nvim) - Navigate your code with search labels, enhanced character motions
  - [live-server.nvim](https://github.com/aurum77/live-server.nvim) - Live server for web development
  - [Neoscroll](https://github.com/karb94/neoscroll.nvim) - Plugin for smooth scrolling
  - Other colorschemes(reqire vim-plug):
  - [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) - Neovim/Vim color scheme inspired by Dark+ and Light+ theme in Visual Studio Code
  - [Eldritch.nvim](https://github.com/eldritch-theme/eldritch.nvim) - A theme for the Ancient Ones! (NVIM)

## 📋 Prerequisites

- Neovim >= 0.8.0
- git
- unzip (for installing some LSP plugins on Linux)
- A [Nerd Font](https://www.nerdfonts.com/font-downloads) installed and configured in your terminal
- [Node.js](https://nodejs.org/)
- [pnpm](https://pnpm.io/installation) (for live-server.nvim)
- [Python](https://www.python.org/) (preinstalled on most Linux distributions)
- [pip](https://pypi.org/project/pip/) (for black, sqlfluff and other formatters and linters)
- [JDK](https://www.oracle.com/java/technologies/downloads/) (for Java support and Java formatters and linters)
- zig (on Windows)
- xclip (if using X11) or wl-clipboard (if using Wayland) packages (on Linux for clipboard sync)
- A Nerd Font installed and configured in your terminal
- Terminal with true color support


## 🚀 Installation

1. Backup your existing Neovim configuration if you have one:
```bash
# Linux/macOS
<div align="center" id="madewithlua">
  <img
    src="https://astronvim.com/logo/astronvim.svg"
    width="110"
    ,
    height="100"
  />
</div>
<h1 align="center">AstroNvim</h1>

<h4 align="center">
  <a href="https://docs.astronvim.com/#-installation">Install</a>
  ·
  <a href="https://docs.astronvim.com/#-configuration">Configure</a>
  ·
  <a href="https://github.com/AstroNvim/astrocommunity">Community Plugins</a>
  ·
  <a href="https://astronvim.com">Website</a>
  ·
  <a href="https://discord.astronvim.com">Discord</a>
</h4>

<p align="center">
    <a href="https://github.com/AstroNvim/AstroNvim/pulse"><img src="https://img.shields.io/github/last-commit/AstroNvim/AstroNvim?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://github.com/AstroNvim/AstroNvim/releases/latest"><img src="https://img.shields.io/github/v/release/AstroNvim/AstroNvim?style=for-the-badge&logo=gitbook&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://github.com/AstroNvim/AstroNvim/stargazers"><img src="https://img.shields.io/github/stars/AstroNvim/AstroNvim?style=for-the-badge&logo=apachespark&color=eed49f&logoColor=D9E0EE&labelColor=302D41"></a>
     <img src="https://img.shields.io/endpoint?url=https://waka.mehalter.com/api/compat/shields/v1/mehalter/interval:any/label:AstroNvim&style=for-the-badge&label=wakatime&logo=wakatime&color=a6da95&logoColor=D9E0EE&labelColor=302D41">
    <br>
    <a href="https://www.twitter.com/AstroNvim"><img src="https://img.shields.io/badge/@AstroNvim-e05d44?style=for-the-badge&logo=twitter&color=fab387&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://hachyderm.io/@AstroNvim"><img src="https://img.shields.io/badge/@AstroNvim-e05d44?domain=https%3A%2F%2Fhachyderm.io&style=for-the-badge&logo=mastodon&color=eebebe&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://www.reddit.com/r/AstroNvim/"><img src="https://img.shields.io/badge/%2Fr%2FAstroNvim-e05d44?style=for-the-badge&logo=reddit&color=ee99a0&logoColor=D9E0EE&labelColor=302D41"></a>
    <br>
    <a href=https://discord.astronvim.com><img src="https://img.shields.io/discord/939594913560031363?style=for-the-badge&logo=discord&color=cba6f7&logoColor=D9E0EE&labelColor=302D41"></a>
</p>

<p align="center">
AstroNvim is an aesthetically pleasing and feature-rich neovim config that is extensible and easy to use with a great set of plugins
</p>

## 🌟 Preview

![Preview Image](https://astronvim.com/themes/overview.png)

## ✨ Features

- Common plugin specifications with [AstroCommunity](https://github.com/AstroNvim/astrocommunity)
- File explorer with [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Autocompletion with [Blink.cmp](https://github.com/saghen/blink.cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Statusline, Winbar, and Bufferline, Statuscolumn with [Heirline](https://github.com/rebelot/heirline.nvim)
- Terminal with [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Fuzzy finding with [Snacks Picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Formatting and Linting with [None-ls](https://github.com/nvimtools/none-ls.nvim)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)
- Debug Adapter Protocol with [nvim-dap](https://github.com/mfussenegger/nvim-dap)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/Recipes/icons)) <sup>[[1]](#1)</sup>
- [Neovim 0.11+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) (_Note:_ If not installed, this will be auto-installed with Mason if available)
- A C compiler in your path (see [https://docs.rs/cc/latest/cc/#compile-time-requirements](https://docs.rs/cc/latest/cc/#compile-time-requirements))
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using) <sup>[[2]](#2)</sup>
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep picker search (`<leader>fw`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
  - [Node](https://nodejs.org/en/) - node repl toggle terminal (`<leader>tn`)

> [!NOTE] > <sup id="1">[1]</sup> All downloadable Nerd Fonts contain icons which are used by AstroNvim. Install the Nerd Font of your choice to your system and in your terminal emulator settings, set its font face to that Nerd Font. If you are using AstroNvim on a remote system via SSH, you do not need to install the font on the remote system.

> [!NOTE] > <sup id="2">[2]</sup> Note when using default theme: For MacOS, the default terminal does not have true color support. You will need to use [iTerm2](https://iterm2.com/), [Kitty](https://sw.kovidgoyal.net/kitty/), [WezTerm](https://wezterm.org), or another [terminal emulator](https://github.com/termstandard/colors?tab=readme-ov-file#truecolor-support-in-output-devices) that has true color support.

## 🛠️ Installation

AstroNvim is provided as a plugin that can be installed with the [`lazy.nvim`](https://github.com/folke/lazy.nvim) plugin manager and then used to import all of the plugin configurations that AstroNvim provides. To quickly get started it is recommended to start with the official [AstroNvim Template](https://github.com/AstroNvim/template) which provides a great starting point for a new AstroNvim based configuration.

### Linux/Mac OS (Unix)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Windows
mv %LOCALAPPDATA%\nvim nvim.bak
mv %LOCALAPPDATA%\nvim-data nvim-data.bak
```
2. Clone the repository
```bash
# Linux/MacOS:
# Clone the repo
git clone https://github.com/FatihTheDev/FatihNvim.git ~/.config/nvim
# remove .git so you can use your own git connection later
rm -rf ~/.config/nvim/.git

# Windows:
# Clone the repo
git clone https://github.com/FatihTheDev/FatihNvim.git C:/Users/<Username>/AppData/Local/nvim
# remove .git so you can use your own git connection later
Remove-Item  C:/Users/<Username>/AppData/Local/nvim/.git -Recurse -Force
```
3. Run these commands in terminal for some linters and formatters to work, as well as live-server (for HTML):
```
npm install -g live-server
pip install black sqlfluff 'python-lsp-server[all]'
# On Linux, pip will throw an error, so before the above command, run these 2 commands:
python3 -m venv ~/.venvs/nvim-lsp
source ~/.venvs/nvim-lsp/bin/activate
```
4. Start Neovim
```bash
nvim
```
The configuration will automatically install all plugins on the first launch.

## Configuration

### Alpha dashboard:
You can modify the alpha.nvim dashboard by editing the init.lua file:
```bash
# Windows
%LOCALAPPDATA%\nvim\init.lua

# Linux/macOS
~/.config/nvim/init.lua
```

### Extending Configuration with Plugins:
You can add new plugins by creating .lua files in the plugins directory:
```bash
# Windows
%LOCALAPPDATA%\nvim\lua\plugins\

# Linux/macOS
~/.config/nvim/lua/plugins/
```

#### Best practices for adding plugins:

- Create one file per plugin or related group of plugins
- Name the file after the main plugin (e.g., tokyonight.lua for the TokyoNight theme)
- Use the following template for adding plugins:
```lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Set to false if you want to load at startup
    priority = 1000, -- Load before other plugins
    config = function()
      -- Your plugin configuration here
      -- Leave empty if you want default values
    end,
  }
}
```

##### Example for adding multiple related plugins in one file (plugins.lua):
```lua
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  }
}
```
Colorschemes:
Most colorschemes are managed through lazy.nvim.


## 🎨 Available Themes:
- TokyoNight (variants: storm, moon, night, day)
- Kanagawa
- vscode.nvim
- eldrich.nvim...

## 📝 Usage:
- Use ```<leader>ff``` or ```ctrl + f``` for file finding
- Use ```ctrl + t``` or ``ctrl + alt + t`` for opening a terminal window
- Use ``s`` in normal mode to trigger flash.nvim
- Access live server features using commands ```:LiveServerStart``` and ```:LiveServerStop``` in command mode
- Switch themes using ```:colorscheme <theme_name>``` in command mode
- To start playing tetris, run ```:Tetris```, and to quit, run ```:q```.

  **Note**: If you encounter some issues with .jsx or .tsx autocomplete, run ```:MasonInstall emmet-language-server``` in command mode
  
  ##### Preinstalled Mason LSPs:
  - emmet_language_server
  - lua_ls
  - html
  - cssls
  - tailwindcss
  - ts_ls
  - clangd
  - pylsp
  - markdown_oxide
  - sqlls 
```

### To sync with latest upstream changes of AstroNvim, run these:
```
git remote add upstream https://github.com/AstroNvim/AstroNvim.git #if it isn't already added
git fetch upstream
git merge upstream/main --allow-unrelated-histories
```
