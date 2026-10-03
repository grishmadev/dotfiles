return {
  -- 1. Add Apprentice to your plugins list
  {
    "romainl/apprentice",
    lazy = true,
    config = function()
      -- 2. TTY Detection: Force 16-color mode if running in raw console
      vim.opt.termguicolors = false
    end,
  },
}
