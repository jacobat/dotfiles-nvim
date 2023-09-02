return {
  'AckslD/nvim-trevJ.lua',
  opts = function()
    require('trevj').setup({
      containers = {
        lua = {
          table_constructor = {final_separator = ',', final_end_line = true},
          arguments = {final_separator = false, final_end_line = true},
          parameters = {final_separator = false, final_end_line = true},
        },
        ruby = {
          hash = {final_separator = false, final_end_line = true},
          array = {final_separator = false, final_end_line = true},
          arguments = {final_separator = false, final_end_line = true},
          method_parameters = {final_separator = false, final_end_line = true},
        },
      }
    })
  end
}
