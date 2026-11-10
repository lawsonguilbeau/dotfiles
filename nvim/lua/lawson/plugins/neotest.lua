return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestArguments = { "--colors", "--forceExit", "--testLocationInResults" },
          }),
          require("neotest-vitest"),
        },
      })

      vim.keymap.set("n", "<leader>ntc", function()
        require("neotest").run.run()
      end, { desc = "Run Closest Test" })
      vim.keymap.set("n", "<leader>ntf", function()
        require("neotest").run.run(vim.api.nvim_buf_get_name(0))
      end, { desc = "Run File" })
      vim.keymap.set("n", "<leader>nts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle Summary Panel" })
      vim.keymap.set("n", "<leader>nto", function()
        require("neotest").output_panel.toggle()
      end, { desc = "Toggle Output Panel" })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters["pwa-node"] = {
        type = "server",
        port = "${port}",
        executable = {
          command = "js-debug-adapter", -- Extracted globally by Mason
          args = { "${port}" },
        },
      }

      for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceRoot}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceRoot}",
          },
        }
      end
    end,
  },
}
