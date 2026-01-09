return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      size = 15,
    },
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({

        mode = "toggleterm",

        filetype = {
          python = "python3 -u",
          typescript = "deno run",
          javascript = "node",

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

      vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
      vim.keymap.set("n", "<leader>f", ":RunFile<CR>", { noremap = true, silent = false })
      vim.keymap.set("n", "<leader>c", ":RunClose<CR>", { noremap = true, silent = false })
    end,
  },
}
