return {
  name = "Run rspec",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "bundle" },
      args = { "exec", "rspec", file },
      -- args = { file },
      -- components = { { "on_output_quickfix", open = true }, "default" },
      components = { { "open_output", on_complete = "always", direction = "dock", on_start = "never" }, "default" },
    }
  end,
  condition = {
    filetype = { "ruby" },
  },
}
