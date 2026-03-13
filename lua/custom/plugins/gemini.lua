return {
  'gutsavgupta/nvim-gemini-companion',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    require('gemini').setup {
      win = {
        preset = 'right-fixed', -- Options: "right-fixed", "left-fixed", "bottom-fixed", "floating"
        width = 0.3,
      },
    }
  end,
  keys = {
    { '<leader>gg', '<cmd>GeminiToggle<cr>', desc = 'Toggle Gemini sidebar' },
    { '<leader>gc', '<cmd>GeminiSwitchToCli<cr>', desc = 'Spawn or switch to AI session' },
    { '<leader>gs', '<cmd>GeminiSend<cr>', mode = { 'x' }, desc = 'Send selection to Gemini' },
    { '<leader>gs', '<cmd>GeminiSendFileDiagnostic<cr>', mode = { 'n' }, desc = 'Send file to Gemini' },
    -- { '<leader>g1', '<cmd>GeminiSwitchToCli tmux gemini<cr>', desc = 'Tmux Gemini' },
    -- { '<leader>g2', '<cmd>GeminiSwitchToCli tmux qwen<cr>', desc = 'Tmux Qwen' },
    { '<leader>g1', '<cmd>!tmux selectw -t 1 && tmux selectp -t 0<cr><cr>', desc = 'Tmux Gemini' },
    { '<leader>g2', '<cmd>!tmux selectw -t 1 && tmux selectp -t 1<cr><cr>', desc = 'Tmux Claude' },
    { '<leader>gS', '<cmd>GeminiSwitchSidebarStyle<cr>', desc = 'Switch sidebar style' },
  },
}
