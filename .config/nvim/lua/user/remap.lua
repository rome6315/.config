vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --space + p + v brings up directory file system

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --shift J to move code block down
vim.keymap.set("v", "K", ":m '< -2<CR>gv=gv") --shift K to move code block up

vim.keymap.set("n", "<C-d>", "<C-d>zz" ) --ctrl + d to 
vim.keymap.set("n", "<C-u>", "<C-u>zz" ) --shift J to move code block down

vim.keymap.set("x", "<leader>p", "\"_dP") --by default, x also copies the thing it deletes. hell naw
vim.keymap.set("n", "<leader>d", "\"_d") --space + d to delete in normal mode
vim.keymap.set("v", "<leader>d", "\"_d") --space + d to delete in visual mode

--copy to system clipboard instead of nvim clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
