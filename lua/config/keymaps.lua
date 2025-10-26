vim.keymap.set('n', '<leader>rr', function()
  package.loaded['creator'] = nil
  require 'creator'
end, { desc = 'Run current file' })
