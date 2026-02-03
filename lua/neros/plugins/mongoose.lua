return {
  {
    'XiaoConstantine/mongoose.nvim',
    event = 'VeryLazy', -- start tracking once nvim is fully up
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- Basic setup
      require('mongoose').setup()

      -- Show analytics
      vim.keymap.set('n', '<leader>ma', '<cmd>Mongoose<CR>', {
        silent = true,
        desc = 'Show Mongoose Analytics',
      })
    end,
  },
}
