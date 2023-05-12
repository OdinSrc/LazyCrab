return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    config.sources = {
      formatting.stylua,
      code_actions.gitsigns,
    }

    return config -- return final config table
  end,
}
