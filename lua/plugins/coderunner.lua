return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      size = 15,
    },
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({

        mode = "toggleterm",
        focus = true,

        filetype = {
          -- Space置いて、Parrotの判定を吸わせる
          python = " python3 -u",
          typescript = " deno run",
          javascript = " node",

          java = {
            " cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
          },
          rust = {
            " cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
          },
          cpp = {
            "  cd $dir &&",
            "g++ $fileName -o $fileNameWithoutExt &&",
            "./$fileNameWithoutExt",
          },
        },
      })

      vim.keymap.set("n", "<leader>r", function ()
        if vim.bo.filetype == 'markdown' then
          vim.cmd('MarkdownPreview')
        else
          vim.cmd("RunCode")
        end
      end, { noremap = true, silent = false })
      -- vim.keymap.set("n", "<leader>f", ":RunFile<CR>", { noremap = true, silent = false })
      -- vim.keymap.set("n", "<leader>c", ":RunClose<CR>", { noremap = true, silent = false })
    end,
}
}
