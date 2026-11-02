-- Personal options and keymaps kept out of the kickstart modules so upstream
-- changes stay easy to merge.

vim.opt.relativenumber = true

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Insert a Go error check below the current line and start typing inside it.
vim.keymap.set('i', '<C-e>', function()
  local cur_row = vim.api.nvim_win_get_cursor(0)[1]
  local current_line = vim.api.nvim_buf_get_lines(0, cur_row - 1, cur_row, false)[1]
  local indent_str = current_line:match '^%s*'
  local sw = vim.o.shiftwidth
  local extra_indent = vim.o.expandtab and string.rep(' ', sw) or '\t'
  local inner_indent_str = indent_str .. extra_indent

  local lines = {
    indent_str .. 'if err != nil {',
    inner_indent_str,
    indent_str .. '}',
  }

  vim.api.nvim_buf_set_lines(0, cur_row, cur_row, false, lines)
  vim.api.nvim_win_set_cursor(0, { cur_row + 2, #inner_indent_str })
  vim.cmd.startinsert()
end, { desc = 'Insert Go error check' })

-- Personal colorscheme choice.
vim.cmd.colorscheme 'tokyonight-moon'

-- vim: ts=2 sts=2 sw=2 et
