
M = {}

g_new_bufnr = nil;

local function pprint(msg)
    print(tostring(vim.inspect(msg)))
end


local function _create_window()
    --[[ Creates a new window at the top right of the screeen --]]
    local new_bufnr = vim.api.nvim_create_buf(false, true)
    pprint(new_bufnr)
    g_new_bufnr = new_bufnr
    pprint(g_new_bufnr)
    win_handle = vim.api.nvim_open_win(new_bufnr, false, {relative='win', row=1, col=200, width=100, height=10, border='rounded'})
    pprint(win_handle)
end

vim.keymap.set("n", "<leader>w", _create_window, {noremap = true})
-- vim.keymap.set("n", "<leader>q", close_window, {noremap = true})


