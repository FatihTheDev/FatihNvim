# 🚀 FatihNvim - extended AstroNvim configuration

This is my personalized fork of [AstroNvim](https://astronvim.com/), enhanced with additional plugins and customizations for an improved editing experience.

## ✨ Added Features

- **Enhanced Motion**: [flash.nvim](https://github.com/folke/flash.nvim) for quick navigation
- **Development Tools**: [live-server.nvim](https://github.com/aurum77/live-server.nvim) for real-time preview
- **Additional Themes & Plugins**:
  - [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A clean, dark Neovim theme
  - [alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and fully programmable greeter
  - [flash.nvim](https://github.com/folke/flash.nvim) - Navigate your code with search labels, enhanced character motions
  - [live-server.nvim](https://github.com/aurum77/live-server.nvim) - Live server for web development
  - Other colorschemes(reqire vim-plug):
  - [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) - Neovim/Vim color scheme inspired by Dark+ and Light+ theme in Visual Studio Code
  - [Eldritch.nvim](https://github.com/eldritch-theme/eldritch.nvim) - A theme for the Ancient Ones! (NVIM)

## 📋 Prerequisites

- Neovim >= 0.8.0
- Git
- (Optional) vim-plug if using specific colorschemes
- A Nerd Font installed and configured in your terminal
- Terminal with true color support
- [Node.js](https://nodejs.org/) for live-server functionality

## 🚀 Installation

1. Backup your existing Neovim configuration if you have one:
```bash
# Linux/macOS
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Windows
rename %LOCALAPPDATA%\nvim nvim.bak
rename %LOCALAPPDATA%\nvim-data nvim-data.bak
```
2. Clone the repository
```bash
# Linux/macOS
git clone https://github.com/FatihTheDev/FatihNvim.git ~/.config/nvim

# Windows
git clone https://github.com/FatihTheDev/FatihNvim.git %LOCALAPPDATA%\nvim
```
3. Start Neovim
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
Most colorschemes are managed through lazy.nvim. However, if you want to use the vim-plug colorschemes, install [vim-plug](https://github.com/junegunn/vim-plug)


## 🎨 Available Themes:
- TokyoNight (variants: storm, moon, night, day)
- vscode.nvim
- eldrich.nvim

## 📝 Usage:
- Use ```<leader>ff``` for file finding
- Use 's' in normal mode to trigger flash.nvim
- Access live server features using commands :LiveServerStart and :LiveServerStop
- Switch themes using :Colorscheme <theme_name>
