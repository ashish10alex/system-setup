return {
        'nvim-tree/nvim-tree.lua',

        depenencies = {
            'nvim-tree/nvim-web-devicons'
        },

        config = function()
        vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeOpen)
        require("nvim-tree").setup({
          sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 50,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
        })
        end,
}
