# My Neovim Config

A modern Neovim setup built from scratch, configured for C (42 School projects), Lua, and Python development.

![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A143?logo=neovim&logoColor=white)

## Features

- **Catppuccin** colorscheme
- **Treesitter** — syntax highlighting and indentation for all major languages
- **Telescope** + **ripgrep** — fuzzy file finder and live text search
- **Neo-tree** — sidebar file explorer with file-type icons (Nerd Font)
- **LSP** (via `mason.nvim`) — `clangd` (C), `lua_ls` (Lua), `pyright` (Python)
  - Hover docs, go-to-definition, find references, rename, code actions, diagnostics
- **Autocomplete** — `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Format-on-save** — via `conform.nvim`
  - `c_formatter_42` for C/H files (formats to 42 School Norm)
  - `stylua` for Lua files
- **Debugging (DAP)** — `nvim-dap` + `nvim-dap-ui`, using `gdb` as the C/C++ debug adapter

## Structure

```
~/.config/nvim/
├── init.lua                     # entrypoint, requires config modules
└── lua/
    ├── config/
    │   ├── keymaps.lua          # leader key + global keymaps
    │   ├── options.lua          # vim options + diagnostic signs + 42 norm autocmd
    │   └── lazy.lua             # lazy.nvim bootstrap + plugin spec loader
    └── plugins/
        ├── colorscheme.lua      # catppuccin
        ├── treesitter.lua       # syntax highlighting
        ├── telescope.lua        # fuzzy finder
        ├── neo-tree.lua         # file explorer
        ├── lsp.lua              # mason + lspconfig
        ├── conform.lua          # formatters (c_formatter_42, stylua)
        ├── cmp.lua              # autocomplete + snippets
        └── dap.lua              # debugger (gdb)
```

## Requirements

- **Neovim >= 0.12**
- **git**
- **[tree-sitter CLI](https://github.com/tree-sitter/tree-sitter)** — required by `nvim-treesitter` to compile parsers
  - install via `cargo install tree-sitter-cli`, `npm install -g tree-sitter-cli`, or a [prebuilt binary](https://github.com/tree-sitter/tree-sitter/releases)
- **A C compiler** (`gcc` or `clang`) **+ make** — to build parsers and `telescope-fzf-native`
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — for Telescope live grep
- **A [Nerd Font](https://www.nerdfonts.com/)** installed and set in your terminal — for file icons
- **Node.js + npm** — required by `pyright` (installed automatically via Mason)
- **gdb** — for debugging C/C++ programs
- **[c_formatter_42](https://github.com/cacharle/c_formatter_42)** — installed via `pipx install c-formatter-42`

## Installation

```bash
git clone https://github.com/houssam20-M/nvim-config.git ~/.config/nvim
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically bootstrap itself and install every plugin. Mason will then install the language servers (`clangd`, `lua_ls`, `pyright`) in the background.

Treesitter parsers are compiled on first launch as well, which is why the `tree-sitter` CLI must be on your `PATH` beforehand.

## Keymaps

Leader key: `<Space>`

| Keymap        | Action                              |
|---------------|--------------------------------------|
| `<leader>w`   | Save file                            |
| `<leader>q`   | Quit                                 |
| `<Esc>`       | Clear search highlight               |
| `<leader>gf`  | Format buffer (conform.nvim)         |
| `<leader>ff`  | Find files (Telescope)               |
| `<leader>fg`  | Live grep / search text (Telescope)  |
| `<leader>fb`  | List open buffers (Telescope)        |
| `<leader>fh`  | Search help docs (Telescope)         |
| `<leader>e`   | Toggle file tree (Neo-tree)          |
| `K`           | Hover documentation (LSP)            |
| `gd`          | Go to definition (LSP)               |
| `gr`          | Find references (LSP)                |
| `<leader>rn`  | Rename symbol (LSP)                  |
| `<leader>ca`  | Code actions (LSP)                   |
| `[d` / `]d`   | Previous / next diagnostic           |
| `<leader>b`   | Toggle breakpoint (DAP)              |
| `<leader>du`  | Toggle debugger UI (DAP)             |
| `F5`          | Start / continue debugging (DAP)     |
| `F10`         | Step over (DAP)                      |
| `F11`         | Step into (DAP)                      |
| `F12`         | Step out (DAP)                       |
| `Ctrl+h/j/k/l`| Navigate between windows             |

## Formatting

Files are auto-formatted on save:
- `.c` / `.h` files — formatted to 42 School Norm via `c_formatter_42`
- `.lua` files — formatted via `stylua`

42 Norm settings for C/H files: tabs (not spaces), tab width 4, braces on new line.
