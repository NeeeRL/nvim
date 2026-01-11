-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 強制透明化: カラースキームやプラグインが設定された後に、特定のグループの背景を消去する
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  pattern = "*",
  callback = function()
    local groups = {
      -- 基本
      "Normal", "NormalNC", "NormalFloat", "FloatBorder",
      "SignColumn", "LineNr", "CursorLineNr", "EndOfBuffer",
      
      -- Neo-tree
      "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
      "NeoTreeWinSeparator", "NeoTreeCursorLine", "NeoTreeTitleBar",
      
      -- BufferLine
      "BufferLineFill", "BufferLineBackground", "BufferLineOffset",
      "BufferLineSeparator", "BufferLineSeparatorVisible",
      "BufferLineTab", "BufferLineTabSelected", "BufferLineTabClose",
      "BufferLineBufferSelected", "BufferLineBufferVisible",
    }

    for _, group in ipairs(groups) do
      -- 背景(guibg)のみをNONEにする (他の属性は維持したいが、highlightコマンドでguibg=NONEすると他が消えることはない)
      vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
    end
  end,
})
