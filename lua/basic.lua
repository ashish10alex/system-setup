-- print('hello from ~/config/nvim/lua/basic.lua')
require("nvim-lsp-installer").setup {}


require 'lspconfig'.pyright.setup{
  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
  end,
}

require 'lspconfig'.bashls.setup{}
require 'lspconfig'.sumneko_lua.setup{}
require 'lspconfig'.sqlls.setup{}
-- require 'lspconfig'.csharp_ls.setup{}

--
-- Add here to change telescope settings
require('telescope').setup{
    defaults = {
        prompt_prefix = "> "
    }
}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

