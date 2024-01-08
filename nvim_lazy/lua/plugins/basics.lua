return {
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000 ,
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end
    },

    { 'tpope/vim-commentary' },
    { 'dstein64/vim-startuptime' },
}
