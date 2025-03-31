-- Mini.nvim is a library of plugins, we'll just call what we want here
-- https://github.com/echasnovski/mini.nvim
return {
  {
    "echasnovski/mini.nvim",
    enabled = true, -- change to false to disable icons
    config = function()
      local statusline = require "mini.statusline"
      statusline.setup { use_icons = true }

      local pairs = require "mini.pairs"
      pairs.setup {}

      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      local ai = require "mini.ai"
      ai.setup {}

      local indent = require "mini.indentscope"
      indent.setup {
        symbol = '│',
        draw = {
          animation = function() return 22 end, -- returns the duration in milliseconds
        },
      }

      -- Define custom highlight groups
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#B9F3FB", bg = "NONE" }) -- Light MDR blue for indent line animations
    end
  },
}
