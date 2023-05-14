return {
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    enabled = true,
    opts = {
      tools = {
        --executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = false,
          -- only_current_line = false,
          -- show_parameter_hints = true,
          -- parameter_hints_prefix = "<-",
          -- other_hints_prefix = "=>",
          -- max_len_align = false,
          -- max_len_align_padding = 1,
          -- right_align = false,
          -- right_align_padding = 7,
          -- highlight = "Comment",
        },
        hover_actions = {
          border = "rounded",
        },
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
            pattern = { "*.rs" },
            callback = function()
              local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
          })
        end,
      },
    },
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  -- Inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    opts = {
      inlay_hints = {
        parameter_hints = {
          show = true,
          prefix = "<- ",
          separator = ", ",
          remove_colon_start = false,
          remove_colon_end = true,
        },
        type_hints = {
          -- type and other hints
          show = true,
          prefix = "",
          separator = ", ",
          remove_colon_start = false,
          remove_colon_end = false,
        },
        only_current_line = false,
        -- separator between types and parameter hints. Note that type hints are
        -- shown before parameter
        labels_separator = "  ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- highlight group
        highlight = "LspInlayHint",
        -- virt_text priority
        priority = 0,
      },
      enabled_at_startup = true,
      debug_mode = false,
    },
  },

  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      })
    end,
  },
}
