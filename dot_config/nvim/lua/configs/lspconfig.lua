local M = {}

function M.config()
    local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if not ok then
        return
    end

    local ok_lsp, nvim_lsp = pcall(require, 'lspconfig')
    if not ok then
        return
    end

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        local opts = { noremap = true, silent = true }
        -- Neovim 0.7: vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) ---> n == normal mode, buffer=0 == current
        -- See `:help vim.lsp.*` for docs on functions below
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<leader><leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    local capabilites = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end

    -- Setup C# lsp
    local pid = vim.fn.getpid()
    local omnisharp_bin = 'C:/tools/omnisharp/OmniSharp.exe'
    nvim_lsp.omnisharp.setup {
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    }
end

return M
