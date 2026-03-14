return {
  'https://gitlab.com/code-stats/code-stats-vim.git',
  config = function()
    vim.g.codestats_api_key = os.getenv 'CODESTATS_API_KEY'
  end,
}
