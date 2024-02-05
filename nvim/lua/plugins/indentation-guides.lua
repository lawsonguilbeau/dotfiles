return {
  "lucastavaresa/simpleIndentGuides.nvim",
  config = function()
    vim.opt.list = true -- enable in all buffers
    require("simpleIndentGuides").setup()
  end,
}
