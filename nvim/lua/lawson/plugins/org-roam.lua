return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.1",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      branch = "main",
      "nvim-treesitter/nvim-treesitter", -- Forces treesitter to load first
      tag = "0.3.7",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/orgfiles",
    })
  end,
}
