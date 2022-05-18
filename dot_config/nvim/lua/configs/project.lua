local M = {}

function M.config()
    local status_ok, project = pcall(require, 'project_nvim')
    if not status_ok then
        print(project)
        return
    end

    project.setup {
        detection_methods = { 'lsp', 'pattern' },
        patterns = { '.git', '*.sln' }
    }

    require('telescope').load_extension('projects')
end

return M
