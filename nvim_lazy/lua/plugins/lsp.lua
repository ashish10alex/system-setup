

return {

    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local on_attach = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
            vim.keymap.set("n", "L", vim.lsp.buf.signature_help, {buffer=0})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
            vim.keymap.set("n", "]e", vim.diagnostic.goto_next, {buffer=0})
            vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, {buffer=0})
            vim.keymap.set("n", "qe", vim.diagnostic.setqflist, {buffer=0})
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer=0})
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    severity_sort = { reverse = false }
                }
            )
        end

        require("mason").setup()

        require("mason-lspconfig").setup({
            -- library = { plugins = { "nvim-dap-ui" }, types = true },
            ensure_installed = {
                "lua_ls",
                "pyright",
                "tsserver",
                "bashls",
                "terraformls",
          },
          handlers = {

                function(server_name)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,

               ["lua_ls"] = function ()
                   local lspconfig = require("lspconfig")
                   lspconfig.lua_ls.setup {
                       settings = {
                           Lua = {
                               diagnostics = {
                                   globals = { "vim", "feedkey", "has_words_before" },
                               }
                           }
                       }
                   }
               end,

          }
        })
     end
}
