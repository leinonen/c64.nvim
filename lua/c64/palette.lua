-- c64 palette
-- Commodore 64 (Pepto/VICE) colors mapped onto acidburn's role keys.
-- Screen is C64 blue, border/comments light blue, text white.

local M = {}

M.colors = {
  -- Backgrounds (all derived from C64 blue #352879)
  bg_dark   = "#2a1f60", -- floats, statusline, non-current windows
  bg        = "#352879", -- default background (C64 blue)
  bg_alt    = "#3a2d85", -- sidebars, alt panes
  bg_high   = "#40339a", -- cursorline, folds
  bg_sel    = "#4f42ad", -- visual selection
  bg_border = "#6c5eb5", -- window/popup borders (C64 light blue)

  -- Foregrounds
  fg        = "#e8e8f8", -- default text
  fg_bright = "#ffffff", -- C64 white
  fg_dim    = "#a8a0e0", -- line numbers, subtle UI
  fg_faint  = "#6c5eb5", -- C64 light blue (border color)

  -- Accents (role from acidburn -> C64 color)
  green     = "#70a4b2", -- cyan         (functions)
  green_lo  = "#6c5eb5", -- light blue   (comments)
  lime      = "#9ad284", -- light green  (methods / fields)
  yellow    = "#b8c76f", -- yellow       (keywords)
  amber     = "#ffff80", -- bright yellow tint
  orange    = "#9a6759", -- light red    (booleans / operators)
  salmon    = "#9ad284", -- light green  (strings)
  red       = "#ff6a5c", -- lit-up light red (errors)
  pink      = "#b07ac8", -- light purple tint (specials / constants)
  purple    = "#ffffff", -- white        (types / preproc)
  blue      = "#a8d8e0", -- light cyan tint (identifiers / params)
  cyan      = "#ffff80", -- bright yellow (numbers / constants)

  -- Diff / git (blended onto C64 blue)
  diff_add     = "#2f4a52",
  diff_change  = "#4a4a5c",
  diff_delete  = "#5a2f45",
  diff_text    = "#5c5a7a",

  none = "NONE",
}

return M.colors
