return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      pink   = "#f4b8e4", -- NORMAL (ストロベリーミルク)
      mint   = "#94e2d5", -- INSERT (ミントリボン)
      purple = "#cba6f7", -- VISUAL (シュガーラベンダー)
      yellow = "#f9e2af", -- COMMAND (レモンクリーム)
      bg     = "#141012", -- ビターチョコ(文字色と背景)
      gray   = "#939ab7", -- ブルーグレー(非アクティブ)
    }

    local yumekawa_theme = {
      normal  = {
        a = { fg = colors.bg, bg = colors.pink, gui = 'bold' },
        b = { fg = colors.pink, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      },
      insert  = {
        a = { fg = colors.bg, bg = colors.mint, gui = 'bold' },
        b = { fg = colors.mint, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      },
      visual  = {
        a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
        b = { fg = colors.purple, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      },
      command = {
        a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
        b = { fg = colors.yellow, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      },
      replace = {
        a = { fg = colors.bg, bg = colors.pink, gui = 'bold' },
        b = { fg = colors.pink, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      },
      inactive = {
        a = { fg = colors.gray, bg = 'NONE' },
        b = { fg = colors.gray, bg = 'NONE' },
        c = { fg = colors.gray, bg = 'NONE' }
      }
    }

    require("lualine").setup({
      options = {
        theme = yumekawa_theme,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = '' } }
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },

        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        -- 🎀 一番右端（行番号など）のブロックにも、直接カプセルをつける
        lualine_z = {
          { 'location', separator = { left = '', right = '' } }
        }
      }
    })
  end
}


