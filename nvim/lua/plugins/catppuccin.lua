return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      float = {
          transparent = true,
          solid = false,
      },
      term_colors = true,
      default_integrations = true,
      auto_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
      }
    })
    vim.cmd[[colorscheme catppuccin-latte]]
  end
}

