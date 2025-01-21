-- Add some tabs and spaces configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Show relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Set the maximum itens in completion box
vim.opt.pumheight = 10
