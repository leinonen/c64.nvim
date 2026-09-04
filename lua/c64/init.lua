-- c64 — Commodore 64 palette for Neovim.
-- Blue screen, light-blue border, Pepto palette accents.

local M = {}

M.config = {
  transparent     = false, -- transparent background
  italic_comments = true,  -- italicize comments
  bold_keywords   = true,  -- embolden keywords/statements
  terminal_colors = true,  -- set g:terminal_color_* for :terminal
  guicursor       = true,  -- attach Cursor hl group to 'guicursor' so the TUI
                           -- sets the terminal cursor color (only if 'guicursor'
                           -- is still at its default; custom values are left alone)
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function set_terminal(c)
  vim.g.terminal_color_0  = c.bg_dark
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = c.pink
  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_7  = c.fg
  vim.g.terminal_color_8  = c.fg_faint
  vim.g.terminal_color_9  = c.salmon
  vim.g.terminal_color_10 = c.lime
  vim.g.terminal_color_11 = c.amber
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.purple
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = c.fg_bright
end

-- Neovim's default 'guicursor' names no highlight group for normal/insert
-- modes, so the TUI never tells the terminal which cursor color to use and
-- the Cursor group has no effect. Append "-Cursor" to each mode entry that
-- lacks a group so the terminal cursor follows the theme (OSC 12).
local function set_guicursor()
  local info = vim.api.nvim_get_option_info2("guicursor", {})
  if vim.o.guicursor ~= info.default then
    return
  end
  local parts = {}
  for entry in vim.gsplit(vim.o.guicursor, ",", { plain = true }) do
    local modes, shape = entry:match("^([^:]+):(.+)$")
    if modes and not shape:find("[A-Z]") then
      entry = modes .. ":" .. shape .. "-Cursor"
    end
    parts[#parts + 1] = entry
  end
  vim.o.guicursor = table.concat(parts, ",")
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "c64"

  local c  = require("c64.palette")
  local hl = require("c64.theme").setup(c, M.config)

  local set = vim.api.nvim_set_hl
  for group, spec in pairs(hl) do
    set(0, group, spec)
  end

  if M.config.terminal_colors then
    set_terminal(c)
  end
  if M.config.guicursor then
    set_guicursor()
  end
end

return M
