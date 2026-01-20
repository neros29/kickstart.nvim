return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle', -- lazy-load only when used
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'UndoTree' },
    },
    config = function()
      -- Optional: make the layout nicer
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SplitWidth = 35

      -- Show diff panel (feels more powerful)
      vim.g.undotree_DiffpanelHeight = 12

      -- Set focus to the tree when opened
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
