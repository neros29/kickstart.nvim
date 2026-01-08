return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      -- Add file
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon add file' })

      -- Toggle menu
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon menu' })

      -- 1–9
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>' .. i, function()
          harpoon:list():select(i)
        end, { desc = 'Harpoon file ' .. i })
      end

      -- 0 → 10
      vim.keymap.set('n', '<leader>0', function()
        harpoon:list():select(10)
      end, { desc = 'Harpoon file 10' })
    end,
  },
}
