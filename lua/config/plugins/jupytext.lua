-- return {
--   { -- directly open ipynb files as quarto docuements
--     -- and convert back behind the scenes
--     'GCBallesteros/jupytext.nvim',
--     enabled = true,
--     opts = {
--       custom_language_formatting = {
--         python = {
--           extension = 'qmd',
--           style = 'quarto',
--           force_ft = 'quarto',
--         },
--         r = {
--           extension = 'qmd',
--           style = 'quarto',
--           force_ft = 'quarto',
--         },
--       },
--     },
--   },
-- }
return {
  {
    -- directly open ipynb files as quarto documents
    -- and convert back behind the scenes
    'GCBallesteros/jupytext.nvim',
    enabled = true,
    opts = {
      on_open = 'QuartoPreview',
      custom_language_formatting = {
        python = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
        r = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
      },
    },
  },
}
