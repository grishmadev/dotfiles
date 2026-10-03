return {
  -- Add kanagawa.nvim to lazy.nvim plugins
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    opts = {
      transparent = true,
      sidebars = "transparent",
      floats = "transparent",
    },
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
        theme = "dragon", -- "wave" (default), "dragon" (darker), or "lotus" (light)
        background = {
          dark = "dragon",
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
