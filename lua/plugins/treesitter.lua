return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})
    require("nvim-treesitter").install(
      "c", "cpp", "lua", "python", "vim", "vimdoc",
      "bash", "json", "markdown", "markdown_inline",
      "yaml", "toml", "make"
    )
  end,
}
