local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Database workflow ]]
vim.g.db_ui_use_nerd_fonts = 1

vim.pack.add {
  gh 'tpope/vim-dadbod',
  gh 'kristijanhusak/vim-dadbod-ui',
  gh 'kristijanhusak/vim-dadbod-completion',
}

-- Add dadbod completion to blink.cmp for SQL buffers.
local blink = require 'blink.cmp'
blink.add_source_provider('dadbod', { name = 'Dadbod', module = 'vim_dadbod_completion.blink' })
blink.add_filetype_source('sql', 'dadbod')
blink.add_filetype_source('mysql', 'dadbod')
blink.add_filetype_source('plsql', 'dadbod')

-- vim: ts=2 sts=2 sw=2 et
