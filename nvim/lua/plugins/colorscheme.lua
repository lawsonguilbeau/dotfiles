return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
    end,
  },
}

--  seperate colorschemes

--  {
--    "bluz71/vim-nightfly-colors",
--    name = "nightfly",
--    lazy = false,
--    priority = 1000,
--    config = function()
--      vim.cmd.colorscheme("nightfly")
--      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
--    end,

--    {
--    "folke/tokyonight.nvim",
--    name = "tokyonight-storm",
--    lazy = false,
--    priority = 1000,
--    opts = {},
--    config = function()
--      vim.cmd.colorscheme("tokyonight-storm")
--      vim.cmd.highlight("link NvimTreeWinSeparator NvimTreeNormal") -- put somewhere in lua config after colorscheme is set
--      require("tokyoni Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--        styles = {
--          -- Style to be applied to different syntax groups
--          -- Value is any valid attr-list value for `:help nvim_set_hl`
--          comments = { italic = true },
--          keywords = { italic = true },
--          functions = {},
--          variables = {},
--          -- Background styles. Can be "dark", "transparent" or "normal"
--          sidebars = "dark", -- style for sidebars, see below
--          floats = "dark", -- style for floating windows
--        },
--        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--        hide_inactive_statusline = false, -- Enabling this optiome will be bold
--      })
--    end,
--  },
--ght").setup({
--        -- your configuration comes here
-- or leave it empty to use the default settings
--        style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--        light_style = "day", -- The theme is used when the background is set to light
--        transparent = true, -- Enable this to disable setting the background color
---        terminal_colors = true, --
