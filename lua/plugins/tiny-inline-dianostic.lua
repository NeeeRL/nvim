return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      underline = true,
    })

    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      transparent_bg = false,

      options = {
        multilines = { enabled = true, always_show = false },
        overflow = { mode = "wrap" },
        override_open_float = true,

        show_source = { enabled = false },

        format = function(diag)
          if diag.source then
            return diag.message .. " [" .. diag.source .. "]"

          end

          return diag.message
        end,
      },
    })
  end,
}

