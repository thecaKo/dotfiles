return {
  "catppuccin/nvim",
  lazy = true,
  priority = 1000,
  name = "catppuccin",
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  opts = {
    transparent_background = true,
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    compile = true,
    flavour = "mocha",
    integrations = {
      snacks = true,
      treesitter = true,
      mason = true,
      blink_cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      mini = {
        enabled = true,
      },
    },
  },
}
