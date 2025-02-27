return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        require("conform").format({
          timeout_ms = 2000,
          lsp_fallback = true,
        })
      end,
    })
  end,
}
