return {
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    name = "moonfly",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
    end,
  },
}

--  seperate colorscheme(s)

--  {
--    "catppuccin/nvim",
--    name = "catppuccin",
--    lazy = false,
--    priority = 1000,
--    config = function()
--      vim.cmd.colorscheme("catppuccin")
--      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
--    end,
