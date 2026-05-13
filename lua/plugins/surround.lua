return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})

    -- Space + s 始まりでマッピングする！
    vim.keymap.set("n", "<leader>sa", "<Plug>(nvim-surround-normal)", { remap = true, desc = "Add Surround" })
    vim.keymap.set("n", "<leader>sd", "<Plug>(nvim-surround-delete)", { remap = true, desc = "Delete Surround" })
    vim.keymap.set("n", "<leader>sc", "<Plug>(nvim-surround-change)", { remap = true, desc = "Change Surround" })
    vim.keymap.set(
      "n",
      "<leader>ss",
      "<Plug>(nvim-surround-normal-line)",
      { remap = true, desc = "Add Surround (Line)" }
    )
  end,
}
