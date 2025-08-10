return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text", -- Shows variable values during debugging
  },
  config = function()
    local dap = require("dap")

    -- ========================
    -- Godot Debugger Setup
    -- ========================
    -- Adapter Configuration (Connects to Godot's debug server)
    dap.adapters.godot = {
      type = "server",
      host = "127.0.0.1", -- Godot's default debugger host
      port = 6006,        -- Godot's default debugger port (check in Editor Settings > Debugger)
    }

    -- Debug Configurations
    -- For GDScript
    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "launch",
        name = "Launch Scene (GDScript)",
        project = "${workspaceFolder}", -- Points to Godot project root
        launch_scene = true, -- Launches the current scene
      },
    }

    -- For C# (if you use it)
    dap.configurations.cs = {
      {
        type = "godot",
        request = "launch",
        name = "Launch Scene (C#)",
        project = "${workspaceFolder}",
        launch_scene = true,
      },
    }

    -- ========================
    -- Optional: Keybindings
    -- ========================
    vim.keymap.set("n", "<F5>", function() dap.continue() end)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end)
    vim.keymap.set("n", "<F11>", function() dap.step_into() end)
    vim.keymap.set("n", "<F12>", function() dap.step_out() end)
    vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
  end,
}
