return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'dasupradyumna/midnight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "midnight"
    end
  },
  -- this one is pretty good.
  {
    "bluz71/vim-moonfly-colors",
    enabled = false,
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "moonfly"
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    enabled = false,
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "nightfly"
    end
  },

  --  i really like this one
  {
    "metalelf0/jellybeans-nvim",
    enabled = false,
    dependencies = {
      {
        'rktjmp/lush.nvim'
      }
    },
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "jellybeans-nvim"
    end,
  },
  {
    "sekke276/dark_flat.nvim",
    enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "dark_flat"
    end
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "oxocarbon"
    end
  },
  {
    {
      "rose-pine/neovim",
      enabled = true,
      name = "rose-pine",
      config = function()
        require("rose-pine").setup({
          variant = "auto",      -- auto, main, moon, or dawn
          dark_variant = "main", -- main, moon, or dawn
          dim_inactive_windows = false,
          extend_background_behind_borders = true,

          enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true,        -- Handle deprecated options automatically
          },

          styles = {
            bold = true,
            italic = true,
            transparency = false,
          },

          groups = {
            border = "muted",
            link = "iris",
            panel = "surface",

            error = "love",
            hint = "iris",
            info = "foam",
            note = "pine",
            todo = "rose",
            warn = "gold",

            git_add = "foam",
            git_change = "rose",
            git_delete = "love",
            git_dirty = "rose",
            git_ignore = "muted",
            git_merge = "iris",
            git_rename = "pine",
            git_stage = "iris",
            git_text = "rose",
            git_untracked = "subtle",

            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },

          palette = {
            main = {
              base = '#000000', -- Set background to pure black
            },
            moon = {
              base = '#000000', -- Set background to pure black
            },
            dawn = {
              base = '#000000', -- Set background to pure black
            },
          },

          -- NOTE: Highlight groups are extended (merged) by default. Disable this
          -- per group via `inherit = false`
          highlight_groups = {
            Normal = { bg = "#000000" },      -- Set background to pure black
            NormalFloat = { bg = "#000000" }, -- Set floating window background to pure black
            -- FloatBorder = { bg = "#000000" }, -- Set floating window border background to pure black
          },

          before_highlight = function(group, highlight, palette)
            -- Disable all undercurls
            -- if highlight.undercurl then
            --   highlight.undercurl = false
            -- end
            --
            -- Change palette colour
            -- if highlight.fg == palette.pine then
            --   highlight.fg = palette.foam
            -- end
          end,
        })
        vim.cmd("colorscheme rose-pine")
      end
    }
  },
  {
    "rockyzhang24/arctic.nvim",
    enabled = false,
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme arctic")
    end
  },
}
