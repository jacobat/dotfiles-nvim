return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    image = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = "sidebar",
      formatters = {
        file = {
          filename_first = true
        }
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    layouts = {
      vertical_wide = { preset = "vertical", layout = { width = 0.9 } }
    }
  },
  keys = {
    {
      "<leader>tt",
      function()
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
          }
        )
      end,
      desc = "Snacks global files picker"
    },
    {
      "<leader>tsf",
      function()
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
            exclude = { "spec", "test" },
          }
        )
      end,
      desc = "Snacks files picker excluding specs"
    },
    {
      "<leader>tp",
      function()
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
            dirs = { "packs" },
          }
        )
      end,
      desc = "Snacks files picker scoped to packs"
    },
    {
      "<leader>tfl",
      function()
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
            dirs = { "lib" },
          }
        )
      end,
      desc = "Snacks files picker scoped to lib"
    },
    {
      "<leader>tb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Snacks buffers picker"
    },
    {
      "<leader>dd",
      function()
        Snacks.picker.diagnostics(
          {
            layout = "vertical",
          }
        )
      end,
      desc = "Snacks diagnostics picker"
    },
    {
      "<leader>tls",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "Snacks lsp workspace symbols picker"
    },
    {
      "<leader>tlw", function()
        local symbol = vim.fn.expand("<cword>")

        Snacks.picker.lsp_workspace_symbols()

        vim.defer_fn(function()
          vim.api.nvim_feedkeys(symbol, "i", false)
        end, 100) -- 100 ms delay
      end,
      desc = "Search workspace symbol under cursor"
    },
    {
      "<leader>tlo", function()
        Snacks.picker.lsp_symbols(
          {
            layout = "vertical",
          }
        )
      end,
      desc = "Search buffer symbols"
    },
    {
      "<leader>tw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Snacks grep picker"
    },
    {
      "<leader>tgw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Snacks grep picker"
    },
    {
      "<leader>tfh",
      function()
        if glob_in_cwd("lib/*component.rb") then
          local component = remove_file_extension(vim.fs.basename(first_file_matching("lib/*component.rb")))
          Snacks.picker.files(
            {
              args = { "--no-require-git" },
              dirs = { "lib/" .. component .. "/handlers" },
              title = "Handlers"
            }
          )
        end
      end,
      desc = "Snacks eventide handlers picker"
    },
    {
      "<leader>tfm",
      function()
        if glob_in_cwd("lib/*component.rb") then
          local component = remove_file_extension(vim.fs.basename(first_file_matching("lib/*component.rb")))
          Snacks.picker.files(
            {
              args = { "--no-require-git" },
              dirs = { "lib/" .. component .. "/messages" },
              title = "Messages"
            }
          )
        end
      end,
      desc = "Snacks eventide messages picker"
    },
    {
      "<leader>tfe",
      function()
        if glob_in_cwd("lib/*component.rb") then
          Snacks.picker.files(
            {
              args = { "--no-require-git" },
              dirs = { "exercise" },
              title = "Messages"
            }
          )
        end
      end,
      desc = "Snacks eventide messages picker"
    },
    {
      "<leader>tfc",
      function()
        if glob_in_cwd("lib/*component.rb") then
          local component = first_file_matching("lib/*component.rb")
          vim.cmd.edit(component)
        end
      end,
      desc = "Snacks eventide messages picker"
    },
    {
      "<leader>tfp",
      function()
        if glob_in_cwd("lib/*component.rb") then
          local component = remove_file_extension(vim.fs.basename(first_file_matching("lib/*component.rb")))
          vim.cmd.edit("lib/" .. component .. "/projection.rb")
        end
      end,
      desc = "Snacks eventide messages picker"
    },
    {
      "<leader>tft",
      function()
        if glob_in_cwd("lib/*component.rb") then
          local component = remove_file_extension(vim.fs.basename(first_file_matching("lib/*component.rb")))
          local entity_name = component:gsub("_component", "")
          vim.cmd.edit("lib/" .. component .. "/" .. entity_name .. ".rb")
        end
      end,
      desc = "Snacks eventide messages picker"
    },
  },
}
