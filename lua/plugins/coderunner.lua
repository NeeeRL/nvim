return {
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      -- ここから設定開始
      require("code_runner").setup({

        -- 1. 結果をどこに出すか（今回は浮遊ウィンドウ）
        mode = "toggleterm",

        -- 2. ★ここに「filetype」を書きます★
        filetype = {
          -- 文字列で書くパターン（シンプル）
          python = "python3 -u",
          typescript = "deno run",
          javascript = "node",

          -- テーブルで書くパターン（複数コマンド）
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
          },
          rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
          },
          cpp = {
            "cd $dir &&",
            "g++ $fileName -o $fileNameWithoutExt &&",
            "./$fileNameWithoutExt",
          },
        },
      })
      -- 設定終了

      -- キーマッピング（ショートカット設定）
      vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
      vim.keymap.set("n", "<leader>f", ":RunFile<CR>", { noremap = true, silent = false })
      vim.keymap.set("n", "<leader>c", ":RunClose<CR>", { noremap = true, silent = false })
    end,
  },
}
