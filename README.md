# c64.nvim

A Commodore 64 colorscheme for Neovim. Blue screen, light-blue border, Pepto/VICE palette accents.

```
    **** COMMODORE 64 BASIC V2 ****
 64K RAM SYSTEM  38911 BASIC BYTES FREE
READY.
```

## Requirements

- Neovim >= 0.8
- `termguicolors` (set automatically on load)

## Installation

### lazy.nvim

```lua
{
  "leinonen/c64.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("c64").setup({})
    vim.cmd.colorscheme("c64")
  end,
}
```

### packer.nvim

```lua
use({
  "leinonen/c64.nvim",
  config = function()
    vim.cmd.colorscheme("c64")
  end,
})
```

### vim.pack (Neovim 0.12+)

```lua
vim.pack.add({ { src = "https://github.com/leinonen/c64.nvim", version = vim.version.range("0.1") } })
vim.cmd.colorscheme("c64")
```

### vim-plug

```vim
Plug 'leinonen/c64.nvim'
colorscheme c64
```

## Configuration

`setup()` is optional. Defaults:

```lua
require("c64").setup({
  transparent     = false, -- transparent background
  italic_comments = true,  -- italicize comments
  bold_keywords   = true,  -- embolden keywords/statements
  terminal_colors = true,  -- set g:terminal_color_* for :terminal
})
vim.cmd.colorscheme("c64")
```

## Palette

| Role            | Hex       | C64 color     |
| --------------- | --------- | ------------- |
| Background      | `#352879` | Blue          |
| Border / faint  | `#6c5eb5` | Light blue    |
| Text            | `#e8e8f8` | (near white)  |
| Bright text     | `#ffffff` | White         |
| Functions       | `#70a4b2` | Cyan          |
| Comments        | `#6c5eb5` | Light blue    |
| Strings / fields| `#9ad284` | Light green   |
| Keywords        | `#b8c76f` | Yellow        |
| Numbers         | `#ffff80` | Bright yellow |
| Operators       | `#9a6759` | Light red     |
| Errors          | `#ff6a5c` | Light red     |
| Specials        | `#b07ac8` | Light purple  |
| Identifiers     | `#a8d8e0` | Light cyan    |

Full palette in [`lua/c64/palette.lua`](lua/c64/palette.lua).

## Supported plugins

- Treesitter and LSP semantic tokens
- Diagnostics
- blink.cmp, nvim-cmp
- Telescope
- gitsigns, diff
- neo-tree, nvim-tree
- mini.nvim
- nvim-notify
- which-key
- indent-blankline
- flash.nvim
- dashboard-nvim

## Project layout

```
colors/c64.lua        -- :colorscheme entry point
lua/c64/init.lua      -- setup() / load()
lua/c64/palette.lua   -- color definitions
lua/c64/theme.lua     -- highlight groups
```

## License

MIT
