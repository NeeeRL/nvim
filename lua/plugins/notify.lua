return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
  },
  config = function(_, opts)
    require("notify").setup(opts)

    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE", ctermbg = "NONE" })
  end,
}
