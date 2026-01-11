return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diagnostics_dict.error and icons.Error .. diagnostics_dict.error .. " " or "")
            .. (diagnostics_dict.warning and icons.Warn .. diagnostics_dict.warning or "")
          return vim.trim(ret)
        end,
        show_buffer_close_icons = true,
        show_close_icon = true,
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        -- マウスでの操作を有効化
        persist_buffer_sort = true,
      },
    },
  },
}

