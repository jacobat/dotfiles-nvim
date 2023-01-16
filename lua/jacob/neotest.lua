local M = {}
function M.config()
  return function()
    require('neotest').setup({
      output = {
        auto_close = true
      },
      adapters = {
        require('neotest-rspec')({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end
        }),
      }
    })
  end
end
return M
