return {
  "tiagovla/tokyodark.nvim",
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.cmd([[colorscheme tokyodark]])
  end,

  opts = {
    transparent_background = false,
    gamma = 1.00,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      identifiers = { italic = true }, -- style for identifiers
      functions = {},
      variables = {},
    },
    custom_highlights = {} or function(highlights, palette)
      return {}
    end,
    custom_palette = {} or function(palette)
      return {}
    end,
    terminal_colors = true,
  },
}
