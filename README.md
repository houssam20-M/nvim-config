# My Neovim Config

A modern Neovim setup built from scratch, configured for C (42 School projects), Lua, and Python development.

![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A143?logo=neovim&logoColor=white)

## Features

- 🎨 **Catppuccin** colorscheme
- 🌳 **Treesitter** — proper syntax highlighting and indentation for all major languages
- 🔍 **Telescope** + **ripgrep** — fuzzy file finder and live text search across projects
- 📁 **Neo-tree** — sidebar file explorer with file-type icons (Nerd Font)
- 🧠 **LSP** (via `mason.nvim`) — `clangd` (C), `lua_ls` (Lua), `pyright` (Python)
  - Hover docs, go-to-definition, find references, rename, code actions, diagnostics
- ✨ **Autocomplete** — `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- 🧹 **Format-on-save** — via `none-ls.nvim`
  - `c_formatter_42` for C files (formats to 42 School's Norm)
  - `stylua` for Lua files
- 🐛 **Debugging (DAP)** — `nvim-dap` + `nvim-dap-ui`, using `gdb` as the C debug adapter

## Structure

```
~/.config/nvim/
├── init.lua                     # entrypoint, just requires the config modules
└── lua/
    ├── config/
    │   ├── keymaps.lua          # leader key setup
    │   ├── options.lua          # vim options + diagnostic sign icons
    │   └── lazy.lua             # lazy.nvim bootstrap + plugin spec loader
    └── plugins/
        ├── colorscheme.lua      # catppuccin
        ├── treesitter.lua       # syntax highlighting
        ├── telescope.lua        # fuzzy finder
        ├── neo-tree.lua         # file explorer
        ├── lsp.lua               # mason + lspconfig
        ├── none-ls.lua           # formatters (c_formatter_42, stylua)
        ├── cmp.lua               # autocomplete + snippets
        └── dap.lua               # debugger (gdb)
```

## Requirements

- **Neovim >= 0.12**
- **git**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — for Telescope live grep
- **A [Nerd Font](https://www.nerdfonts.com/)** installed and set in your terminal — for file icons
- **Node.js + npm** — required by `pyright` (installed automatically via Mason)
- **gdb** — for debugging C programs
- **[c_formatter_42](https://github.com/cacharle/c_formatter_42)** — installed via `pipx install c-formatter-42`

## Installation

```bash
git clone <this-repo-url> ~/.config/nvim
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically bootstrap itself and install every plugin. Mason will then install the language servers (`clangd`, `lua_ls`, `pyright`) in the background — this can take a few minutes on the first run.

## Keymaps

Leader key: `<Space>`

| Keymap        | Action                         |
|---------------|---------------------------------|
| `<leader>ff`  | Find files (Telescope)          |
| `<leader>fg`  | Live grep / search text (Telescope) |
| `<leader>fb`  | List open buffers (Telescope)   |
| `<leader>fh`  | Search help docs (Telescope)    |
| `<leader>e`   | Toggle file tree (Neo-tree)     |
| `K`           | Hover documentation (LSP)       |
| `gd`          | Go to definition (LSP)          |
| `gr`          | Find references (LSP)           |
| `<leader>rn`  | Rename symbol (LSP)             |
| `<leader>ca`  | Code actions (LSP)              |
| `[d` / `]d`   | Previous / next diagnostic      |
| `<leader>b`   | Toggle breakpoint (DAP)         |
| `<leader>du`  | Toggle debugger UI (DAP)        |
| `F5`          | Start / continue debugging (DAP)|
| `F10`         | Step over (DAP)                 |
| `F11`         | Step into (DAP)                 |
| `F12`         | Step out (DAP)                  |

## Formatting

Files are auto-formatted on save:
- `.c` / `.h` files → formatted to 42 School Norm via `c_formatter_42`
- `.lua` files → formatted via `stylua`

## Notes

This config started as a single flat `init.lua` and was later refactored into a modular `lua/config` + `lua/plugins` structure for maintainability — new plugins can be added by simply dropping a new file into `lua/plugins/`, no other changes needed.

Built step by step while working through recurring Neovim/treesitter version issues, npm/network timeouts during LSP installs, and matching the correct nvim-treesitter API for the `main` branch. A good reminder that a lot of "broken plugin" issues are actually branch/version mismatches.
