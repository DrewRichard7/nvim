-- LSP via nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     ft = { 'quarto',
--       'lua',
--       'python',
--       'javascript',
--       'typescript',
--       'html',
--       'css',
--       'json',
--       'yaml',
--       'sh',
--       'bash',
--       'vim',
--       'julia',
--       'rust',
--       'r',
--     }, -- Or list of filetypes for which you want LSP support
--
--     dependencies = {
--       "saghen/blink.cmp",
--       { 'williamboman/mason.nvim',                  lazy = false },
--       { 'williamboman/mason-lspconfig.nvim',        lazy = false },
--       { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
--       {
--         'folke/lazydev.nvim',
--         ft = 'lua', -- only load on lua files
--         opts = {
--           library = {
--             -- See the configuration section for more details
--             -- Load luvit types when the `vim.uv` word is found
--             { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--           },
--         },
--       },
--     },
--     config = function()
--       local capabilities = require("blink.cmp").get_lsp_capabilities()
--       local lsp_flags = {
--         allow_incremental_sync = true,
--         debounce_text_changes = 150,
--       }
--
--       require('mason').setup()
--       require('mason-lspconfig').setup {
--         automatic_installation = true,
--         ensure_installed = {
--           'lua_ls',
--           'rust_analyzer',
--           'pyright',
--           'r_language_server',
--         },
--       }
--       require('mason-tool-installer').setup {
--         ensure_installed = {
--           'black',
--           'stylua',
--           'shfmt',
--           'isort',
--           'tree-sitter-cli',
--           'jupytext',
--         },
--       }
--
--       require("lspconfig").lua_ls.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--         settings = {
--           Lua = {
--             completion = {
--               callSnippet = 'Replace',
--             },
--             runtime = {
--               version = 'LuaJIT',
--               -- plugin = lua_plugin_paths, -- handled by lazydev
--             },
--             diagnostics = {
--               disable = { 'trailing-space' },
--             },
--             workspace = {
--               -- library = lua_library_files, -- handled by lazydev
--               checkThirdParty = false,
--             },
--             doc = {
--               privateName = { '^_' },
--             },
--             telemetry = {
--               enable = false,
--             },
--           },
--         },
--       }
--
--       require("lspconfig").rust_analyzer.setup {
--         capabilities = capabilities,
--         settings = {
--           ['rust-analyzer'] = {
--             diagnostics = {
--               enable = true,
--             },
--           },
--         },
--       }
--
--       require("lspconfig").pyright.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--         settings = {
--           python = {
--             analysis = {
--               autoSearchPaths = true,
--               useLibraryCodeForTypes = true,
--               diagnosticMode = 'workspace',
--             },
--           },
--         },
--       }
--
--       require("lspconfig").r_language_server.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--         settings = {
--           lintr = {
--             delay = 500,
--           },
--           -- r = {
--           --   lsp = {
--           --     rich_documentation = true,
--           --   },
--           -- },
--           -- log_level = 2,
--         }
--       }
--
--       require("lspconfig").yamlls.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--         settings = {
--           yaml = {
--             schemaStore = {
--               enable = true,
--               url = '',
--             },
--           },
--         },
--       }
--
--       require("lspconfig").jsonls.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--       }
--
--       require("lspconfig").dotls.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--       }
--
--       require("lspconfig").ts_ls.setup {
--         capabilities = capabilities,
--         flags = lsp_flags,
--         filetypes = { 'js', 'javascript', 'typescript', 'ojs' },
--       }
--
--
--
--       --[[the following function and statements collect existing Lua runtime files in Neovim.
--     Checks if Quarto is installed:
--         If not installed, it notifies the user.
--         If installed, it adds Quarto-specific Lua paths to the runtime.
--     This allows Neovim’s LSP to recognize and provide autocompletion, diagnostics, and other features for Quarto documents.]] --
--       local function get_quarto_resource_path()
--         local function strsplit(s, delimiter)
--           local result = {}
--           for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
--             table.insert(result, match)
--           end
--           return result
--         end
--
--         local f = assert(io.popen('quarto --paths', 'r'))
--         local s = assert(f:read '*a')
--         f:close()
--         return strsplit(s, '\n')[2]
--       end
--
--       local lua_library_files = vim.api.nvim_get_runtime_file('', true)
--       local lua_plugin_paths = {}
--       local resource_path = get_quarto_resource_path()
--       if resource_path == nil then
--         vim.notify_once 'quarto not found, lua library files not loaded'
--       else
--         table.insert(lua_library_files, resource_path .. '/lua-types')
--         table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')
--       end
--
--
--       -- when we attach a file and language server, below gets called
--       vim.api.nvim_create_autocmd('LspAttach', {
--         callback = function(args)
--           local client = vim.lsp.get_client_by_id(args.data.client_id)
--           if not client then return end
--           if client.supports_method('textDocument/formatting') then
--             -- the below autocmd is per buffer, only applies to the current file,
--             -- whereas the outer autocmd applies to all files when the lsp attaches
--             vim.api.nvim_create_autocmd("BufWritePre", {
--               buffer = args.buf,
--               callback = function()
--                 vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
--               end,
--             })
--           end
--         end,
--       })
--
--       vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover,
--         { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } })
--       vim.lsp.handlers['textDocument/signatureHelp'] =
--           vim.lsp.with(vim.lsp.handlers.signature_help, { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } })
--     end,
--   }
-- }

return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    ft = {
      "quarto",
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "yaml",
      "sh",
      "bash",
      "vim",
      "julia",
      "rust",
      "r",
    },
    dependencies = {
      "saghen/blink.cmp",
      { "williamboman/mason.nvim",                  lazy = true },
      { "williamboman/mason-lspconfig.nvim",        lazy = true },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Improved LSP flags with increased timeout
      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 200, -- Slightly increased
      }

      -- Set up Mason
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "pyright",
          "r_language_server",
          "yamlls",
          "jsonls",
        },
      })

      -- More comprehensive tool installation
      require("mason-tool-installer").setup({
        ensure_installed = {
          "black",
          "stylua",
          "shfmt",
          "isort",
          "tree-sitter-cli",
          "jupytext",
          "r-languageserver"
        },
        auto_update = true,
      })

      -- Common setup function to reduce repetition
      local function setup_lsp(server_name, server_config)
        local config = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          flags = lsp_flags,
        }, server_config or {})

        require("lspconfig")[server_name].setup(config)
      end

      -- Specific server configurations
      setup_lsp("lua_ls", {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { disable = { "trailing-space" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      setup_lsp("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            diagnostics = { enable = true },
            -- Add more rust-specific configurations if needed
          },
        },
      })

      setup_lsp("pyright", {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      })

      -- More robust R language server setup
      setup_lsp("r_language_server", {
        settings = {
          r = {
            lsp = {
              rich_documentation = true,
              diagnostics = true,
              lint = {
                linters = "lintr::default_linters",
                delay = 1000
              }
            }
          }
        }
      })

      -- ... rest of your config ...

      setup_lsp("yamlls", {
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
              url = "",
            },
          },
        },
      })

      setup_lsp("jsonls")

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- LSP Attach autocmd (similar to your original)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = args.buf,
                  id = client.id,
                  timeout_ms = 2000, -- Increased timeout
                })
              end,
            })
          end
        end,
      })

      -- Improved hover and signature help handlers
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        max_width = 80,
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        max_width = 80,
      })
    end,
  },
}
