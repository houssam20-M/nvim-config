return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }

      local gdb_config = {
        name = "Launch (gdb)",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      }

      dap.configurations.c = { gdb_config }
      dap.configurations.cpp = { gdb_config }

      vim.keymap.set("n", "<F5>", dap.continue, {})
      vim.keymap.set("n", "<F10>", dap.step_over, {})
      vim.keymap.set("n", "<F11>", dap.step_into, {})
      vim.keymap.set("n", "<F12>", dap.step_out, {})
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<leader>du", dapui.toggle, {})
    end,
  },
}
