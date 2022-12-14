-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/u0157733/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/u0157733/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/u0157733/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/u0157733/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/u0157733/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  everforest = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0046\0\0\0009\0\1\0005\2\2\0D\0\2\0\1\4\0\0\vbundle\texec\nrspec\16tbl_flatten\bvim?\1\1\0\b\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0003\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\1K\0\1\0\radapters\1\0\0\14rspec_cmd\1\0\0\0\18neotest-rspec\nsetup\fneotest\frequire\3????\4\0" },
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-rspec"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/neotest-rspec",
    url = "https://github.com/olimorris/neotest-rspec"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-trevJ.lua"] = {
    config = { "\27LJ\2\n?\3\0\0\6\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\21\0005\3\n\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\a\0045\5\18\0=\5\19\4=\4\20\3=\3\22\2B\0\2\1K\0\1\0\15containers\1\0\0\truby\22method_parameters\1\0\2\19final_end_line\2\20final_separator\1\1\0\2\19final_end_line\2\20final_separator\1\narray\1\0\2\19final_end_line\2\20final_separator\1\thash\1\0\0\1\0\2\19final_end_line\2\20final_separator\1\blua\1\0\0\15parameters\1\0\2\19final_end_line\2\20final_separator\1\14arguments\1\0\2\19final_end_line\2\20final_separator\1\22table_constructor\1\0\0\1\0\2\19final_end_line\2\20final_separator\6,\nsetup\ntrevj\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/opt/nvim-trevJ.lua",
    url = "https://github.com/AckslD/nvim-trevJ.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-angry"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-angry",
    url = "https://github.com/b4winckler/vim-angry"
  },
  ["vim-bundler"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-bundler",
    url = "https://github.com/tpope/vim-bundler"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-rake"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-rake",
    url = "https://github.com/tpope/vim-rake"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/u0157733/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-trevJ.lua
time([[Setup for nvim-trevJ.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21format_at_cursor\ntrevj\frequireC\1\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0B\0\4\1K\0\1\0\0\14<leader>k\6n\bset\vkeymap\bvim\0", "setup", "nvim-trevJ.lua")
time([[Setup for nvim-trevJ.lua]], false)
time([[packadd for nvim-trevJ.lua]], true)
vim.cmd [[packadd nvim-trevJ.lua]]
time([[packadd for nvim-trevJ.lua]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0046\0\0\0009\0\1\0005\2\2\0D\0\2\0\1\4\0\0\vbundle\texec\nrspec\16tbl_flatten\bvim?\1\1\0\b\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0003\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\1K\0\1\0\radapters\1\0\0\14rspec_cmd\1\0\0\0\18neotest-rspec\nsetup\fneotest\frequire\3????\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-trevJ.lua
time([[Config for nvim-trevJ.lua]], true)
try_loadstring("\27LJ\2\n?\3\0\0\6\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\21\0005\3\n\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\a\0045\5\18\0=\5\19\4=\4\20\3=\3\22\2B\0\2\1K\0\1\0\15containers\1\0\0\truby\22method_parameters\1\0\2\19final_end_line\2\20final_separator\1\1\0\2\19final_end_line\2\20final_separator\1\narray\1\0\2\19final_end_line\2\20final_separator\1\thash\1\0\0\1\0\2\19final_end_line\2\20final_separator\1\blua\1\0\0\15parameters\1\0\2\19final_end_line\2\20final_separator\1\14arguments\1\0\2\19final_end_line\2\20final_separator\1\22table_constructor\1\0\0\1\0\2\19final_end_line\2\20final_separator\6,\nsetup\ntrevj\frequire\0", "config", "nvim-trevJ.lua")
time([[Config for nvim-trevJ.lua]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
