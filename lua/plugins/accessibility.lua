return {
  {
    "snacks.nvim",
    keys = {
      {
        "<F7>",
        function()
          Snacks.terminal.open(nil, { cwd = LazyVim.root() })
        end,
        desc = "New Terminal",
      },
      {
        "<leader>ot",
        function()
          Snacks.terminal(nil, { cwd = LazyVim.root() })
        end,
        desc = "Toggle Terminal",
      },
      {
        "<leader>oe",
        function()
          Snacks.explorer({ cwd = LazyVim.root() })
        end,
        desc = "Open Explorer",
      },
      { "<leader>oa", "<cmd>ClaudeCode<cr>", desc = "Open Claude" },
      { "<leader>oc", "<cmd>Codex<cr>", desc = "Open Codex" },
      { "<leader>om", "<cmd>MCPHub<cr>", desc = "Open MCP Hub" },
    },
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}

      vim.list_extend(opts.dashboard.preset.keys, {
        {
          icon = " ",
          key = "t",
          desc = "New Terminal",
          action = ":lua Snacks.terminal.open(nil, { cwd = LazyVim.root() })",
        },
        { icon = " ", key = "e", desc = "Explorer", action = ":lua Snacks.explorer({ cwd = LazyVim.root() })" },
        { icon = "󰚩 ", key = "a", desc = "Claude AI", action = ":ClaudeCode" },
        { icon = "󱚣 ", key = "d", desc = "Codex AI", action = ":Codex" },
        { icon = "󰐻 ", key = "m", desc = "MCP Hub", action = ":MCPHub" },
      })
    end,
  },
}
