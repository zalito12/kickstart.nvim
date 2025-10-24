-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    commands = {
      -- Create open command for visual mode (currently missing)
      open_visual = function(state, selected_nodes)
        local utils = require 'neo-tree.utils'
        if not selected_nodes or #selected_nodes == 0 then
          vim.notify('No files selected', vim.log.levels.WARN, { title = 'Neo-tree' })
          return
        end

        for _, node in ipairs(selected_nodes) do
          if node.type == 'file' then
            local path = node.path or node:get_id()
            local bufnr = node.extra and node.extra.bufnr
            -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/0d0b29a529216d41173c9c5c8a8f484db5b891ba/lua/neo-tree/sources/common/commands.lua#L819
            -- TODO: Experiment with splits
            utils.open_file(state, path, 'e', bufnr)
          end
        end
        vim.cmd 'Neotree close'
      end,
    },
    filesystem = {
      window = {
        mappings = {
          ['<cr>'] = function(state)
            state.commands['open'](state)
            vim.cmd 'Neotree close'
          end,
          ['<tab>'] = function(state)
            state.commands['open'](state)
            vim.cmd 'Neotree reveal'
            vim.defer_fn(function()
              if vim.bo.filetype == 'neo-tree' then
                vim.fn.feedkeys 'j'
              end
            end, 150)
          end,
        },
      },
      filtered_items = {
        visible = false,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          '.git',
          'node_modules',
          'package-lock.json',
        },
        never_show = {},
      },
    },
  },
}
