local M = {}
-- https://github.com/nvim-telescope/telescope.nvim
function M.config()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
        print(telescope)
        return
    end

    -- Dont preview binaries or images
    local previewers = require("telescope.previewers")
    local job = require("plenary.job")
    local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        job:new({
            command = "file",
            args = { "--mime-type", "-b", filepath },
            on_exit = function(j)
              local mime_type = vim.split(j:result()[1], "/")[1]
              if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
              else
                  return
              end
            end
          }):sync()
    end

    local actions = require "telescope.actions"

    telescope.setup {
        defaults = {
            buffer_previewer_maker = new_maker,
            mappings = {
                i = {
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                },

                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                }
            }
        },
        file_ignore_patterns = {
            "node_modules",
            "%.svg",
            "*.svg",
            "*.md",
            "%.md",
        },
        pickers = {},
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }

    telescope.load_extension "fzf"

    local function set_k(...) vim.api.nvim_set_keymap(...) end
    local opts = { noremap = true, silent = true }

    set_k('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
    set_k('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
    set_k('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
    set_k('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)

end

return M
