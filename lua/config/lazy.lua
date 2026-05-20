local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.lang.python" },
    {
      "ravitemer/mcphub.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      build = "bundled_build.lua",
      cmd = "MCPHub",
      keys = {
        { "<leader>aM", "<cmd>MCPHub<cr>", desc = "MCP Hub" },
      },
      config = function()
        require("mcphub").setup({
          use_bundled_binary = true,
          auto_approve = false,
          extensions = {
            copilotchat = {
              enabled = true,
              convert_tools_to_functions = true,
              convert_resources_to_functions = true,
              add_mcp_prefix = false,
            },
          },
          ui = {
            window = {
              border = "single",
            },
          },
        })
      end,
    },
    {
      "ishiooon/codex.nvim",
      dependencies = {
        "folke/snacks.nvim",
      },
      enabled = function()
        return vim.fn.executable("codex") == 1
      end,
      cmd = {
        "Codex",
        "CodexFocus",
        "CodexSend",
        "CodexTreeAdd",
      },
      keys = {
        { "<leader>aC", "<cmd>Codex<cr>", desc = "Codex: Toggle" },
        { "<leader>aF", "<cmd>CodexFocus<cr>", desc = "Codex: Focus" },
        { "<leader>aS", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: Send selection" },
        { "<leader>aA", "<cmd>CodexTreeAdd<cr>", desc = "Codex: Add file", ft = { "neo-tree", "oil" } },
      },
      config = function()
        local notify_path = vim.fn.stdpath("state") .. "/codex.nvim/notify.jsonl"

        require("codex").setup({
          terminal_cmd = vim.fn.exepath("codex"),
          env = {
            ENABLE_IDE_INTEGRATION = "true",
            CODEX_NVIM_NOTIFY_PATH = notify_path,
          },
          status_indicator = {
            cli_notify_path = notify_path,
          },
        })
      end,
    },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
