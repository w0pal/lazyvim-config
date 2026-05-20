return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        if vim.api.nvim_buf_get_name(bufnr):match("%.ipynb$") then
          return false
        end
      end,
    },
  },
  {
    "goerz/jupytext.nvim",
    version = "0.2.0",
    lazy = false,
    opts = {
      format = "py:percent",
      update = true,
      autosync = true,
    },
  },
}
