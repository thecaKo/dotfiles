-- Variables
local opt = vim.opt

-- Set <leader> to space
vim.g.mapleader = " "

-- Add some tabs and spaces configurations
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.expandtab = true
opt.softtabstop = 2
opt.sidescrolloff = 2

-- Enable explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Set the maximum itens in completion box
opt.pumheight = 3

-- Quality life change's
opt.laststatus = 3
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.fillchars:append { eob = " " }
opt.shortmess:append "aIF"
opt.cursorline = true
opt.cursorlineopt = "number"
opt.ruler = true
opt.number = true
opt.breakindent = true
opt.linebreak = true
opt.swapfile = false
opt.undofile = true
opt.cmdheight = 0

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    suffix = "",
    format = function(diagnostic)
      return " " .. diagnostic.message .. " "
    end,
  },
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "󱐮",
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.INFO] = "◉",
      [vim.diagnostic.severity.WARN] = "",
    },
  },
}
