return {
  'nosduco/remote-sshfs.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  opts = {
    -- Refer to the configuration section below
    -- or leave empty for defaults
  },
  keys = {
    {
      '<leader>rc',
      '<cmd>RemoteSSHFSConnect<CR>',
      desc = 'Connect to remote server',
    },
    {
      '<leader>rd',
      '<cmd>RemoteSSHFSDisconnect<CR>',
      desc = 'Disconnec from remote server',
    },
    {
      '<leader>re',
      '<cmd>RemoteSSHFSEdit<CR>',
      desc = 'Edit ssh configuration',
    },
  },
}
