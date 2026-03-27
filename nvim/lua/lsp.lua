require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", "pyright", "ts_ls", "texlab",
    "clangd", "cssls", "html", "jsonls", "bashls",
  },
  automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  map("gd", vim.lsp.buf.definition, "Go to definition")
  map("gD", vim.lsp.buf.declaration, "Go to declaration")
  map("gr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", "References")
  map("gi", vim.lsp.buf.implementation, "Go to implementation")
  map("K", vim.lsp.buf.hover, "Hover docs")
  map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
  map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
  map("<leader>ds", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", "Document symbols")
end

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  pyright = {
    settings = {
      python = {
        pythonPath = "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3",
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  ts_ls = {},
  texlab = {},
  clangd = {},
  cssls = {},
  html = {},
  jsonls = {},
  bashls = {},
}

for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  vim.lsp.config[server] = config
end

vim.lsp.enable(vim.tbl_keys(servers))
