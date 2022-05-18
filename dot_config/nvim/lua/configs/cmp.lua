local M = {}

function M.config()
    local ok, cmp = pcall(require, 'cmp')
    if not ok then
        print('cmp not found')
        return
    end

    local snip_ok, luasnip = pcall(require, 'luasnip')
    if not snip_ok then
        print('luasnip not found')
        return
    end

    local lspkind_ok, lspkind = pcall(require, 'lspkind')
    if not lspkind_ok then
        print('lspkind not found' .. tostring(lspkind))
        return
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({ -- Order matters on what completions you will see first
              { name = 'nvim_lsp_signature_help' },
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
              { name = 'path' },
          },{
              { name = 'buffer', keyword_length = 3 }, -- Dont do completion until you've entered at least 4 chars
        }),
        experimental = {
            native_menu = false, -- use cmp's menu
            ghost_text = true,
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'text',
                menu = ({
                    buffer = "[buff]",
                    nvim_lsp = "[lsp]",
                    luasnip = "[snip]",
                    path = "[path]"
                })
            })
        }
    })
end

return M
