return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd[[set background=dark]]
    require("dracula").setup({
      transparent = true,
      transparent_bg = true,
    })
    vim.cmd[[colorscheme dracula]]
  end
}

