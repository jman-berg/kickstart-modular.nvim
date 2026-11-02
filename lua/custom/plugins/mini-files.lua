-- mini.files: column-based file explorer (replaces oil.nvim)
require('mini.files').setup {
  content = {
    -- Keep the explorer focused on project files; never show .git.
    filter = function(fs_entry) return fs_entry.name ~= '.git' end,
  },
  windows = {
    preview = false,
    width_focus = 40,
    width_nofocus = 25,
    width_preview = 40,
  },
}

local minifiles_toggle = function()
  local MiniFiles = require 'mini.files'
  if MiniFiles.close() ~= nil then return end

  local path = vim.api.nvim_buf_get_name(0)
  if path == '' or (vim.fn.filereadable(path) == 0 and vim.fn.isdirectory(path) == 0) then path = nil end
  MiniFiles.open(path, false)
end

vim.keymap.set('n', '<leader>o', minifiles_toggle, { desc = 'Toggle mini.files' })

-- Toggle hidden files inside the explorer with `g.`
local show_dotfiles = true
local filter_show = function(fs_entry) return fs_entry.name ~= '.git' end
local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, '.') end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set('n', 'g.', function()
      show_dotfiles = not show_dotfiles
      MiniFiles.refresh { content = { filter = show_dotfiles and filter_show or filter_hide } }
    end, { buffer = buf_id, desc = 'Toggle hidden files' })
  end,
})

-- vim: ts=2 sts=2 sw=2 et
