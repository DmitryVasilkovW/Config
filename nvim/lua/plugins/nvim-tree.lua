return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        group_empty = true,
        icons = {
          webdev_colors = true,
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      view = {
        width = 30,
        side = "left",
      },
    })
  end,
}

