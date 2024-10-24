-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
  -- Key mappings for LSP features
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- Mappings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)         -- Hover documentation
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)   -- References
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Go to implementation
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- Rename
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code actions
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) -- Format document
end

-- Configure Go language server
lspconfig.gopls.setup({
  on_attach = on_attach,
  cmd = {"gopls"},  -- Ensure the correct binary is called
  filetypes = {"go", "gomod"},  -- Ensure Go files are detected
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),  -- Automatically detect the Go project root
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

-- Configure Python language server
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- Configure C++ language server
lspconfig.clangd.setup({
  on_attach = on_attach,
})

-- Configure Tailwind CSS language server
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
})

-- Configure HTML language server
lspconfig.html.setup({
  on_attach = on_attach,
})

-- Configure TypeScript/JavaScript language server
lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

-- -- EXAMPLE
-- local servers = { "html", "cssls"}
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

--}
