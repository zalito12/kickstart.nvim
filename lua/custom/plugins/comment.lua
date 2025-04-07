return {
  'numToStr/Comment.nvim',
  options = {},
  config = function()
    require('Comment').setup()
    require('Comment.ft').set('astro', { '<!-- %s -->', '<!-- %s -->' })
  end,
}
