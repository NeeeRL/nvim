return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
      term_colors = true,

      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },

      color_overrides = {
        macchiato = {
          pink = "#ebbae2",
          mauve = "#f4b8e4",
          base = "#1c1820",
        },
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        lualine = true,
        neo_tree = true,
        noice = true,
        notify = true,
        telescope = { enabled = true },
        treesitter = true,
        mini = { enabled = true },
        mason = true,
      },

      custom_highlights = function(colors)
        return {
          NoiceCmdlineIcon = { bg = "NONE", fg = colors.pink },
          NoiceCmdlineIconSearch = { bg = "NONE", fg = colors.pink },
          NoiceCmdlinePopupTitle = { bg = "NONE", fg = colors.pink },
          NoiceCmdlinePopupBorder = { bg = "NONE", fg = colors.pink },

          Search = { bg = colors.mauve, fg = colors.base, style = { "bold" } },
          IncSearch = { bg = colors.pink, fg = colors.base, style = { "bold" } },

          CursorLine = { bg = colors.surface0 },

          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          MasonNormal = { bg = "NONE" },
          MasonNormalNC = { bg = "NONE" },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
