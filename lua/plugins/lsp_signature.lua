return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded",
    },

    floating_window = true,
    floating_window_above_cur = true,
    fix_pos = false,

    hint_enable = true,
    hint_prefix = "💎 ",
    hint_scheme = "String",

    hi_parameter = "LspSignatureActiveParameter",

    transparency = 10,

    padding = ' ',
    max_height = 12,
    max_width = 80,
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}

