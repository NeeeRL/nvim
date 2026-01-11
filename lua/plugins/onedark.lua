return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "dark",

      transparent = true,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      toggle_style_key = nil,
      toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warner', 'light'},

      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      lualine = {
        enabled = true,
        transparent = false,
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
      colors = {
        purple = "#9a7ecc",
        red = "#ec6d71",
      },
    })

    -- テーマを適用
    vim.cmd.colorscheme("onedark")
  end,
}
