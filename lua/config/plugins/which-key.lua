-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    enabled = true,
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = true, -- defined in init.lua as true
        -- using a Nerd Font: set icons.keys to an empty table will use the
        -- default which-key.nvim defined Nerd Font icons
        keys = true and {},
      },

      -- Document existing key chains
      -- spec = {
      --   { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      --   { '<leader>d', group = '[D]ocument' },
      --   { '<leader>r', group = '[R]ename' },
      --   { '<leader>f', group = '[F]ind' },
      --   { '<leader>w', group = '[W]orkspace' },
      --   { '<leader>t', group = '[T]oggle' },
      --   { '<leader>G', group = '[G]it', mode = { 'n', 'v' } },
      -- },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
