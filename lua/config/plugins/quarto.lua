return {
  { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
    -- for complete functionality (language features)
    'quarto-dev/quarto-nvim',
    enabled = true,
    ft = { 'quarto', 'markdown' },
    dev = false,
    opts = {},
    lazy = true,
    dependencies = {
      -- for language features in code cells
      'jmbuhr/otter.nvim',
    },
  },
}
