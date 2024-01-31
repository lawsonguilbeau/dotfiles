return {
  "xiyaowong/transparent.nvim",
  config = function ()
    require("transparent").setup()

    vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", {})
  end
}
