vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nv", vim.cmd.Ex, { desc = "Go to netrw" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Better escape" })

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
-- paste repeatedly
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "[P]aste repeatedly" })
