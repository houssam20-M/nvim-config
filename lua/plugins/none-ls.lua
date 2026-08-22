return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local h = require("null-ls.helpers")

    local c_formatter_42 = h.make_builtin({
      name = "c_formatter_42",
      meta = { url = "https://github.com/cacharle/c_formatter_42" },
      method = null_ls.methods.FORMATTING,
      filetypes = { "c", "h" },
      generator_opts = {
        command = "c_formatter_42",
        args = {},
        to_stdin = true,
      },
      factory = h.formatter_factory,
    })

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        c_formatter_42,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(c)
                  return c.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
