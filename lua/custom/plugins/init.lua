-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --[[ {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      require('nvim-treesitter.configs').setup {
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable = { 'c', 'ruby' }, -- optional, list of language that will be disabled
          -- [options]
        },
      }
    end,
  }, ]]
  --[[ {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = { -- totally optional
      'hrsh7th/nvim-cmp', -- if using nvim-cmp
      { 'ms-jpq/coq_nvim', branch = 'coq' }, -- if using coq
      -- 'saghen/blink.cmp', -- if using blink.cmp
    },
    ft = { 'blade', 'php' }, -- optional, improves startup time
    opts = {
      -- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
      close_tag_on_complete = true, -- default: true
    },
  }, ]]
}
