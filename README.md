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
- Terminal with true color support


## 🚀 Installation

1. Backup your existing Neovim configuration if you have one:
```bash
# Linux/macOS
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
