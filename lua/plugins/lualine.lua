return {
  -- statusline
  "nvim-lualine/lualine.nvim",
  dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    -- get lualine nightfly theme
    local theme = require("lualine.themes.wombat")

    -- new colors for theme
    -- local new_colors = {
    --   blue = "#65D1FF",
    --   green = "#3EFFDC",
    --   violet = "#FF61EF",
    --   yellow = "#FFDA7B",
    --   black = "#000000",
    -- }
    --
    -- -- change nightlfy theme colors
    -- lualine_nightfly.normal.a.bg = new_colors.blue
    -- lualine_nightfly.insert.a.bg = new_colors.green
    -- lualine_nightfly.visual.a.bg = new_colors.violet
    -- lualine_nightfly.command = {
    --   a = {
    --     gui = "bold",
    --     bg = new_colors.yellow,
    --     fg = new_colors.black, -- black
    --   },
    -- }

    -- configure lualine with modified theme
    require("lualine").setup({
      options = {
        theme = theme,
        icons_enabled = true,
      },
    })
  end
}
