return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  -- DELETE OR COMMENT OUT THE LINE BELOW:
  -- main = 'nvim-treesitter.configs',

  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'vim', 'vimdoc', 'qmljs' },
    auto_install = true,
    highlight = {
      enable = true,
      -- Note: Only keep this if you actually use Ruby and need legacy regex logic
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- Add this to ensure lazy uses the correct root module
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)
  end,
}
