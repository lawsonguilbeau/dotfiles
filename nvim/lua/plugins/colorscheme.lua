return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfly")
      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
    end,
  },
}

--  seperate colorscheme
--  {
--  "catppuccin/nvim",
--  lazy = false,
--  name = "catppuccin",
--  priority = 1000,
--  config = function()
--    vim.cmd.colorscheme("catppuccin-mocha")
--    vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
-- end,
-- },
