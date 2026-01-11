return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "doom",
    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    },
    config = {
      header = {
        "",
        "",
        "",
        "",
        "",
        " $$\\   $$\\                                $$\\                  ",
        " $$$\\  $$ |                               \\__|                 ",
        " $$$$\\ $$ | $$$$$$\\   $$$$$$\\  $$\\    $$\\ $$\\ $$$$$$\\$$$$\\     ",
        " $$ $$\\$$ |$$  __$$\\ $$  __$$\\ \\$$\\  $$  |$$ |$$  _$$  _$$\\    ",
        " $$ \\$$$$ |$$$$$$$$ |$$ /  $$ | \\$$\\$$  / $$ |$$ / $$ / $$ |   ",
        " $$ |\\$$$ |$$   ____|$$ |  $$ |  \\$$$  /  $$ |$$ | $$ | $$ |   ",
        " $$ | \\$$ |\\$$$$$$$\\ \\$$$$$$  |   \\$  /   $$ |$$ | $$ | $$ |   ",
        " \\__|  \\__| \\_______| \\______/     \\_/    \\__|\\__| \\__| \\__|   ",
        "",
        " Welcome to Neovim",
        "",
        "",
        "",
        "",
      },
      center = {
        { icon = "  ", desc = "Find File           ", action = "Telescope find_files", key = "f" },
        { icon = "  ", desc = "New File            ", action = "ene | startinsert", key = "n" },
        { icon = "  ", desc = "Recent Files        ", action = "Telescope oldfiles", key = "r" },
        { icon = "  ", desc = "Find Text           ", action = "Telescope live_grep", key = "g" },
        { icon = "  ", desc = "Config              ", action = "e $MYVIMRC", key = "c" },
        { icon = "󰅩  ", desc = "Quit                ", action = "qa", key = "q" },
      },
      footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
      end,
    },
  },
}

