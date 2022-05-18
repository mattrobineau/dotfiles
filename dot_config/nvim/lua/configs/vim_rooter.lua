local M = {}

function M.config()
    vim.g['rooter_patterns'] = {'.git', '*.sln'}
end

return M
