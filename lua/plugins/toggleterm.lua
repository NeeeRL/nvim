return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    size = 15,
    -- ここで透明化！
    highlights = {
      NormalFloat = { link = "Normal" },
      FloatBorder = { guibg = "NONE" },
    },
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.85),
      winblend = 0, -- 完全に透明にするための念押し
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
    })

    vim.keymap.set("n", "<leader>l", function()
      lazygit:toggle()
    end, { desc = "Lazygit (ToggleTerm)" })
  end,
}
