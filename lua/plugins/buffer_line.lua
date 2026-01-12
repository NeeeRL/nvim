return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "TransparentOffset",
          text_align = "left",
          separator = true,
        },
      },
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      show_buffer_close_icons = true,
      show_close_icon = true,
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      persist_buffer_sort = true,
      always_show_bufferline = true,
      indicator = {
        style = "none",
      },
    },
    highlights = {},
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    local function fix_transparency()
      local bg_match = "#242424"
      local inactive_fg = "#454c59"
      local active_fg = "#abb2bf"

      local transparency_groups = {
        "Normal",
        "TabLine",
        "TabLineFill",
        "TabLineSel",
        "BufferLineFill",
        "WinSeparator",
        "VertSplit",
        "NeoTreeWinSeparator",
      }

      for _, group in ipairs(transparency_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE", force = true })
      end

      local states = { "", "Selected", "Visible" }
      for _, state in ipairs(states) do
        vim.api.nvim_set_hl(0, "BufferLineBackground" .. state, {
          bg = "NONE",
          fg = (state == "Selected") and active_fg or inactive_fg,
          bold = (state == "Selected"),
          force = true
        })
        vim.api.nvim_set_hl(0, "BufferLineSeparator" .. state, {
          bg = "NONE",
          fg = bg_match,
          force = true
        })
      end

      vim.api.nvim_set_hl(0, "TransparentOffset", {
        -- 後ろにいるTabLineFill君の色を透明化しないと意味ない

        fg = "#6b7180",
        bg = "NONE",
        ctermbg = "NONE",
        bold = true,
        force = true,
      })
    end

    fix_transparency()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = fix_transparency,
    })
  end,
}

