--[[
  Executes text between double quotes in neovim editor and displays the stdout in the editor on the line below  the command with in the comment block based on the language used in the file
  e.g.
  "command" -- Invoked using <leader>T
  output

  TODO:
  1. Does not support multiline command.
  2. Support for other filetypes
--]]
local function npprint(output, type)
    require("notify")(output, type)
end

local function check_if_executable(executable)
    if vim.fn.executable(executable) == 1 then
        return true
    else
        npprint("The " .. executable .. " command does not exist", "error")
        return false
    end
end


local function _add_comment_signature_to_output(output)
    if vim.bo.filetype == 'lua' then
        output = "--[[\n" .. output
        output = output .. "\n]]--"
    end

    if vim.bo.filetype == 'markdown' then
        output = "```\n" .. output
        output = output .. "\n```"
    end

    if vim.bo.filetype == 'sql' then
        output = "/*\n" .. output
        output = output .. "\n*/"
    end

    if vim.bo.filetype == 'javascript' then
        output = "/*\n" .. output
        output = output .. "\n*/"
    end

    if vim.bo.filetype == 'python' then
        output = "'''\n" .. output
        output = output .. "\n'''"
    end

    return output
end

local function execute_between_quotes()
    local cur_line = vim.api.nvim_get_current_line()
    local start_index = string.find(cur_line, '"')
    local end_index = string.find(cur_line, '"', start_index + 1)
    local command = string.sub(cur_line, start_index + 1, end_index - 1)

    -- check if the command is executable, and if it is, run it
    local first_executable = string.match(command, "%S+")
    if check_if_executable(first_executable) then
        -- npprint('running command: ' .. command)
        local output = vim.fn.system(command)
        output = _add_comment_signature_to_output(output)

        local lines = vim.split(output, "\n")
        local current_line = vim.fn.line('.')
        for _, line in ipairs(lines) do
            local column_meta_data = { line }
            vim.api.nvim_buf_set_lines(0, current_line, current_line, false, column_meta_data)
            current_line = current_line + 1
        end
    else
        return
    end
end


vim.keymap.set("n", "<leader>t", execute_between_quotes, { noremap = true })

-- "lt -lr"


-- "bq show --schema --format=prettyjson jlr-cat-opsim-dev:z_aalex.shutdown_dates_all_plants"

-- "get_schema_for_dataform jlr-cat-opsim-dev.z_aalex.shutdown_dates_all_plants"
