-- -- Autocmds are automatically loaded on the VeryLazy event
-- -- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- -- Add any additional autocmds here
--
-- -- Define an autocmd group for the blade workaround
-- local augroup = vim.api.nvim_create_augroup('lsp_blade_workaround', { clear = true })
--
-- -- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
--   group = augroup,
--   pattern = '*.blade.php',
--   callback = function()
--     vim.bo.filetype = 'php'
--   end,
-- })
--
-- -- Additional autocommand to switch back to 'blade' after LSP has attached
-- vim.api.nvim_create_autocmd('LspAttach', {
--   pattern = '*.blade.php',
--   callback = function(args)
--     vim.schedule(function()
--       -- Check if the attached client is 'intelephense'
--       for _, client in ipairs(vim.lsp.get_active_clients()) do
--         if client.name == 'intelephense' and client.attached_buffers[args.buf] then
--           vim.api.nvim_buf_set_option(args.buf, 'filetype', 'blade')
--           -- update treesitter parser to blade
--           vim.api.nvim_buf_set_option(args.buf, 'syntax', 'blade')
--           break
--         end
--       end
--     end)
--   end,
-- })
--
-- -- make $ part of the keyword for php.
-- vim.api.nvim_exec(
--   [[
-- autocmd FileType php set iskeyword+=$
-- ]],
--   false
-- )
--
-- -- Create templates group
local augroup = vim.api.nvim_create_augroup('templates', {})

vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
  group = augroup,
  pattern = { '[A-Z]*.php' },
  -- command = "echo 'Entering a C or C++ file'",
  -- command = '0r ~/.config/nvim/templates/skeleton-class.php',
  callback = function()
    vim.cmd '0r ~/.config/nvim/templates/skeleton-class.php'
    local path = vim.fn.expand '%:~:.'
    print(path)
    local ns_path = string.gsub(path, '/([^/]+)$', '')
    print(ns_path)
    ns_path = string.gsub(ns_path, '/', '\\\\')
    print(ns_path)
    ns_path = ns_path:gsub('^([a-z])', string.upper, 1)
    print(ns_path)

    vim.cmd(string.format('%%s/Namespace/%s', ns_path))
    vim.cmd(string.format('%%s/ClassName/%s', vim.fn.expand '%:t:r'))
    vim.fn.feedkeys '7ggcc'
  end,
})
