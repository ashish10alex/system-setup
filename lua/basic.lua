-- print('hello from ~/config/nvim/lua/basic.lua')
require 'lspconfig'.pyright.setup{
    on_attach = function()
        print("Hello from Ashish")
    end,
}
require 'lspconfig'.bashls.setup{}

require 'lspconfig'.sumneko_lua.setup{}


