-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.wo.wrap = true
vim.g.lazyvim_inlay_hints = false
vim.g.live_server = {
  port = 5000,
  browser = false,
}
