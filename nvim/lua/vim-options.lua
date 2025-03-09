-- Formater on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Variables
local opt = vim.opt

-- Set <leader> to space
vim.g.mapleader = " "

-- Set .prisma files highlight
vim.cmd([[autocmd FileType prisma TSBufEnable highlight]])

-- Change Cursor Shape
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- Add some tabs and spaces configurations
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.expandtab = true
opt.softtabstop = 2
opt.sidescrolloff = 2

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#282828", fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#504945" })
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#fe8019" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bdae93" })

-- Enable explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Set the maximum itens in completion box
opt.pumheight = 5

-- Quality life change's
opt.laststatus = 3
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.fillchars:append({ eob = " " })
opt.shortmess:append("aIF")
opt.cursorline = true
opt.cursorlineopt = "number"
opt.ruler = true
opt.number = true
opt.breakindent = true
opt.linebreak = true
opt.swapfile = false
opt.undofile = true
opt.cmdheight = 0

vim.diagnostic.config({
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
})

-- Atalho para abrir/fechar o Neo-tree
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
