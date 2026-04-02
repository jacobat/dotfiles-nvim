-- A blazing fast and easy to configure neovim statusline plugin written in
-- pure lua.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "folke/noice.nvim"
  },
  config = function()
    require("lualine").setup(
    {
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          "overseer",
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
      },
    }
  )
  end
}
