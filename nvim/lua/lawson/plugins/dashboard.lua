return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "doom", --  theme is doom and hyper default is hyper
        config = {
          header = {

            "",
            "",
            "",
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
            "",
            "",
            "",
            "",
          }, --your header
          center = {
            {
              icon = " ",
              desc = "New File           ",
              key = "e",
              key_format = " %s", -- remove default surrounding `[]`
              action = "ene",
            },
            {
              icon = " ",
              desc = "Toggle File Explorer           ",
              key = "SPC ee",
              key_format = " %s", -- remove default surrounding `[]`
              action = "NvimTreeToggle",
            },
            {
              icon = "󰱼 ",
              desc = "Find File           ",
              key = "SPC ff",
              key_format = " %s", -- remove default surrounding `[]`
              action = "Telescope find_files",
            },
            {
              icon = " ",
              desc = "Find Word           ",
              key = "SPC fs",
              key_format = " %s", -- remove default surrounding `[]`
              action = "Telescope live_grep",
            },
            {
              icon = "󰁯 ",
              desc = "Restore Session For Current Directory           ",
              key = "SPC sr",
              key_format = " %s", -- remove default surrounding `[]`
              action = "SessionRestore",
            },
            {
              icon = " ",
              desc = "Quit NVIM           ",
              key = "q",
              key_format = " %s", -- remove default surrounding `[]`
              action = "qa",
            },
          },
          footer = {}, --your footer
        },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>", { desc = "Go to dashboard" })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
