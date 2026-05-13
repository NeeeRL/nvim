return {
  "3rd/image.nvim",
  config = function()
    local api = require("image")
    api.setup({
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
        },
      },
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "neo-tree" },
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      with_virtual_padding = false,
      max_width = 100,
      max_height = 30,
    })

    -- BufWinEnter よりも確実に「中身」を書き換えられる BufReadPost を使用
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      callback = function()
        -- 1. バッファを「普通のテキスト」として扱えるように設定を強制上書き
        vim.opt_local.buftype = ""      -- 特殊バッファ属性を消す
        vim.opt_local.modifiable = true -- 書き込み許可
        vim.opt_local.readonly = false  -- 読み取り専用解除

        -- 2. 画面の高さの約 1/4 分の空行を作成
        local win_height = vim.api.nvim_win_get_height(0)
        local padding_count = math.max(5, math.floor(win_height / 4))
        local lines = {}
        for i = 1, padding_count do table.insert(lines, "") end

        -- 3. 1行目から空行を挿入
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

        -- 4. 見栄えを整える
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.statuscolumn = "" -- ステータスラインの隙間も消す

        -- 5. 最後に「編集不可」に戻してファイルを保護
        vim.opt_local.modifiable = false

        -- 6. 画像を描画
        vim.defer_fn(function()
          local images = api.get_images()
          for _, img in ipairs(images) do
            img:render()
          end
        end, 100)
      end,
    })
  end,
}

