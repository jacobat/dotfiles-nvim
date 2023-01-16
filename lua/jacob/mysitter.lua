local ts_utils = require 'nvim-treesitter.ts_utils'
local locals = require("nvim-treesitter.locals")
local api = vim.api
local hl_namespace = vim.api.nvim_create_namespace "mysitter"

local M = {}

function node_at_cursor()
  local node = ts_utils.get_node_at_cursor()
  local buf = api.nvim_get_current_buf()
  local ERROR_HL = "TSQueryLinterError"
  ts_utils.highlight_node(node, 0, hl_namespace, ERROR_HL)
end

function next_scope(scope)
  node = locals.get_scopes()[scope]
  print("Moving to scope" .. node:type())
  ts_utils.goto_node(node)
end

function scopes()
  return locals.get_scopes()
end

function methods()
  local methods = {}
  for _, node in pairs(scopes()) do
    if node:type() == "method" then
      table.insert(methods, node)
    end
  end
  return methods
end

function M.method_for_node(index)
  local node = ts_utils.get_node_at_cursor()
  local method = locals.containing_scope(node)
  if method:type() ~= "method" then
    return nil
  end
  ts_utils.update_selection(0, method)
end

function node_type()
  local node = ts_utils.get_node_at_cursor()
  print(node:type())
end

function clear_hilight()
  api.nvim_buf_clear_namespace(0, hl_namespace, 0, -1)
end

function reset_mysitter()
  package.loaded['jacob.mysitter'] = nil
end

M.node_at_cursor = node_at_cursor
M.clear_hilight = clear_hilight
M.reset_mysitter = reset_mysitter
M.node_type = node_type
M.next_scope = next_scope
M.scopes = scopes
M.methods = methods
return M
