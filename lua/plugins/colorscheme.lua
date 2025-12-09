return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup()
      vim.cmd("TransparentEnable")
    end,
  },

  { "neanias/everforest-nvim", "shaunsingh/nord.nvim" },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false, -- 起動時に読み込む
    priority = 1000, -- 最優先で読み込む
    config = function()
      require("monokai-pro").setup()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
