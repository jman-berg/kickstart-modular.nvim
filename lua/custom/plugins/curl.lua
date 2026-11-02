local function gh(repo) return 'https://github.com/' .. repo end

-- [[ curl.nvim ]]
-- Scratchpad for running curl requests with jq-formatted output.
vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'oysandvik94/curl.nvim',
}

require('curl').setup {}

-- vim: ts=2 sts=2 sw=2 et
