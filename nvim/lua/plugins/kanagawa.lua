return {
  -- Add kanagawa.nvim to lazy.nvim plugins
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compilation
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        dimInactive = false,
        globalStatus = false,
        terminalColors = true,
        theme = "wave", -- "wave" (default), "dragon" (darker), or "lotus" (light)
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },

  -- Configure LazyVim to use kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
