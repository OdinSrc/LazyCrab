return {

  -- theme (colorscheme)
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "storm" },
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = true,
  --   opts = { style = "storm" },
  -- },

  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      style = "darker",
    },
  },
  --
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
      -- colorscheme = "tokyonight",
      -- colorscheme = "kanagawa",
    },
  },
}
