return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "javascript" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
