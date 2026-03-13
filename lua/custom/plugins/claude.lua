return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = function()
    require('claude-code').setup {
      window = {
        split_ratio = 0.3,
        position = 'vertical', -- "botright", "topleft", "vertical", "float", etc.
      },
      command = 'ANTHROPIC_AUTH_TOKEN=freecc ANTHROPIC_BASE_URL=http://localhost:8082 claude',
    }
  end,
  keys = function()
    local keys = {
      {
        '<leader>cc',
        '<cmd>ClaudeCode<CR>',
        desc = 'Toggle Claude Code',
      },
    }
    return keys
  end,
}
