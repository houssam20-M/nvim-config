return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install("all")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and pcall(vim.treesitter.get_parser, 0, lang) then
          vim.treesitter.start()
        end
      end,
    })
  end,
}
