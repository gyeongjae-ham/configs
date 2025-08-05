-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>tc", ":tabnew<cr>", {desc = "[T]ab [C]reat New"})
vim.keymap.set("n", "<leader>tn", ":tabnext<cr>", {desc = "[T]ab [N]ext"})
vim.keymap.set("n", "<leader>tp", ":tabprevious<cr>", {desc = "[T]ab [P]revious"})

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- select configuration
vim.keymap.set("n", '<leader>d', 'vi"')
vim.keymap.set("n", '<leader>r', 'vi(')
vim.keymap.set("n", '<leader>t', 'vi{')
vim.keymap.set("n", '<leader>v', 'viw')
vim.keymap.set("n", '<leader>x', '<S-V>x')

-- move cursor
vim.keymap.set("n", '<leader>a', '^')
vim.keymap.set("n", '<leader>f', '$')
vim.keymap.set("v", '<leader>a', '^')
vim.keymap.set("v", '<leader>f', '$')

-- copy doesn't yank
vim.keymap.set("n", 'x', '"_x')
vim.keymap.set("n", 'd', '"_d')
vim.keymap.set("v", 'd', '"_d')
vim.keymap.set("x", 'p', '"_dp')

-- open terminal
vim.keymap.set("n", "<Space>j", ":split | terminal<CR>", { desc = "[T]erminal [H]orizontal Split" })
