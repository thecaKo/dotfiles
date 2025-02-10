return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local types = require("cmp.types")
      local str = require("cmp.utils.str")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        enabled = function()
          local filetype = vim.bo.filetype
          if filetype == "markdown" then
            return false
          end
          return true
        end,
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = {
              menu = 10,
              abbr = 20,
            },
            ellipsis_char = "...",
            show_labelDetails = true,
            before = function(entry, vim_item)
              local word = entry:get_insert_text()
              if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                word = vim.lsp.util.parse_snippet(word)
              end
              word = str.oneline(word)

              local max = 50
              if string.len(word) >= max then
                local before = string.sub(word, 1, math.floor((max - 3) / 2))
                word = before .. "..."
              end

              if
                  entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                  and string.sub(vim_item.abbr, -1, -1) == "~"
              then
                word = word .. "~"
              end
              vim_item.abbr = word

              return vim_item
            end,
          }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
          max_width = 15,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<S-tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
        }),
      })
    end,
  },
}
