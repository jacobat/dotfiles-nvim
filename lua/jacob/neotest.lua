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
