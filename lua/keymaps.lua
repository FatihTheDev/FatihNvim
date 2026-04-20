local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_deep_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cmdheight = 0
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

map("n", "<leader>h", ":nohlsearch<CR>")
map("n", "<Esc>", ":nohlsearch<CR>:echo<CR>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "gq", "gqzz")

map("n", "<C-j>", ":m .+1<CR>==")
map("n", "<C-k>", ":m .-2<CR>==")

map("x", "<leader>p", [["_dP]])

map({ "n", "x" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+yG]])

map({ "n", "x" }, "<leader>d", [["_d]])

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>S", [[:let @z=expand("<cword>")<CR>g@z]])

local function buf_close(bufnr)
  local force = false
  if vim.bo.modified then
    local ans = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel")
    if ans == 1 then
      vim.cmd("write")
    elseif ans == 0 then
      return
    else
      force = true
    end
  end
  vim.api.nvim_buf_delete(bufnr, { force = force })
end

map("n", "<leader>bd", function()
  buf_close(0)
end)

map("n", "]b", function()
  vim.cmd("bnext")
end)
map("n", "[b", function()
  vim.cmd("bprevious")
end)

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    if vim.v.event.operator == "y" and vim.v.event.register == '"' then
      require("vim.highlight").on_yank({ higroup = "IncSearch", timeout = 200 })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", ":cclose<CR>", { buffer = true })
  end,
})

local function toggle_spell()
  vim.opt.spell = not vim.opt.spell
  if vim.opt.spell then
    vim.opt.spelllang = "en_us"
  end
end
map("n", "<leader>ts", toggle_spell)

local function toggle_wrap()
  vim.opt.wrap = not vim.opt.wrap
end
map("n", "<leader>tw", toggle_wrap)

vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})

vim.api.nvim_create_user_command("LspInstall", function()
  require("mason-lspconfig").install_all()
end, {})
