return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true, -- if you ever use treesitter
        enable_check_bracket_line = false,
      }
    end,
  },
}
