local mason_lsp_setup
return function(_, opts)
  require("mason-lspconfig").setup(opts)
end
