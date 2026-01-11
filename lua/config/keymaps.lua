local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウへ移動", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウへ移動", noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "下のウィンドウへ移動", noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "上のウィンドウへ移動", noremap = true })

map("n", "<Leader>x", "<cmd>bdelete<CR>", { desc = "現在のバッファを閉じる", noremap = true })

