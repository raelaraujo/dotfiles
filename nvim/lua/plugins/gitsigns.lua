return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    vim.cmd [[
      highlight GitSignsAdd    guifg=#00ff00 guibg=NONE
      highlight GitSignsChange guifg=#ffff00 guibg=NONE
      highlight GitSignsDelete guifg=#ff0000 guibg=NONE
    ]]
  end,
}
