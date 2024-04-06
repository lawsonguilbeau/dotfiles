return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>", { desc = "Go to dashboard" })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
