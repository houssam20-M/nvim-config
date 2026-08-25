return {
  "stevearc/conform.nvim",
  event = "BufReadPost",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "c_formatter_42" },
      h = { "c_formatter_42" },
    },
    formatters = {
      c_formatter_42 = {
        command = "c_formatter_42",
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
