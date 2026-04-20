local lspconfig = require("lspconfig")
local cmp_lsp = require("blink.cmp").get_lsp_capabilities()

local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.keymap.set(...)
  end

  local opts = { noremap = true, silent = true, buffer = bufnr }

  buf_set_keymap("n", "gD", vim.lsp.buf.declaration, opts)
  buf_set_keymap("n", "gd", vim.lsp.buf.definition, opts)
  buf_set_keymap("n", "K", vim.lsp.buf.hover, opts)
  buf_set_keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  buf_set_keymap("n", "gi", vim.lsp.buf.implementation, opts)
  buf_set_keymap("i", "<C-s>", vim.lsp.buf.signature_help, opts)
  buf_set_keymap("n", "<C-s>", vim.lsp.buf.signature_help, opts)
  buf_set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  buf_set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  buf_set_keymap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  buf_set_keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  buf_set_keymap("n", "gr", vim.lsp.buf.references, opts)
  buf_set_keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
  buf_set_keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  buf_set_keymap("n", "]d", vim.diagnostic.goto_next, opts)

  if client.server_capabilities.documentFormattingProvider then
    buf_set_keymap("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    buf_set_keymap("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end

  if client.supports_method("textDocument/inlayHint") then
    pcall(vim.lsp.inlay_hint.enable, bufnr, true)
  end
end

local function capabilities()
  local caps = vim.tbl_deep_extend("force", {}, cmp_lsp)
  return caps
end

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "Lua 5.4" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  ts_ls = {
    settings = {
      typescript = { inlayHints = { includeInlayParameterNameHints = "all", includeInlayParameterNameHintsWhenArgumentMatchesName = false, includeInlayFunctionParameterReturnTypeHints = true, includeInlayVariableTypeHints = true, includeInlayPropertyDeclarationTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true } },
      javascript = { inlayHints = { includeInlayParameterNameHints = "all", includeInlayParameterNameHintsWhenArgumentMatchesName = false, includeInlayFunctionParameterReturnTypeHints = true, includeInlayVariableTypeHints = true, includeInlayPropertyDeclarationTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true } },
    },
  },
  html = { settings = { html = { format = { indentInnerHtml = false } } } },
  cssls = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        classAttributes = { "class", "className", "ngClass", "cmd", "cmdArgs", "style", "styleVars" },
        includeLanguages = { typescript = "javascript", typescriptreact = "javascriptreact", vue = "html" },
        emmetCompletions = true,
        showSuggestions = true,
      },
    },
  },
  emmet_language_server = {},
  clangd = {
    settings = { clangd = { arguments = { "--background-index", "--clang-tidy", "--header-insertion=never" } } },
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = true },
          pycodestyle = { enabled = true },
          autopep8 = { enabled = true },
          mccabe = { enabled = true },
        },
      },
    },
  },
  marksman = {},
}

require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities(),
      }
      local server_opts = servers[server_name]
      if server_opts then
        opts = vim.tbl_deep_extend("force", opts, server_opts)
      end
      lspconfig[server_name].setup(opts)
    end,
  },
})

-- Auto-start LSP for C/C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc" },
  callback = function(args)
    local lsp = require("lspconfig")
    local clangd_opts = vim.tbl_deep_extend("force", {
      on_attach = on_attach,
      capabilities = capabilities(),
    }, servers.clangd or {})
    lsp.clangd.setup(clangd_opts)
  end,
})

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end