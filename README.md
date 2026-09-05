# Neovim Keymaps

`<leader>` = `Space`

## General

| Key         | Action                 |
| ----------- | ---------------------- |
| `<leader>h` | Clear search highlight |
| `<C-h>`     | Left window            |
| `<C-j>`     | Lower window           |
| `<C-k>`     | Upper window           |
| `<C-l>`     | Right window           |

## Buffers

| Key         | Action               |
| ----------- | -------------------- |
| `[b`        | Previous buffer      |
| `]b`        | Next buffer          |
| `<leader>c` | Close current buffer |

## Oil

| Key     | Action                         |
| ------- | ------------------------------ |
| `-`     | Open Oil / parent directory    |
| `<CR>`  | Open file / directory          |
| `-`     | Parent directory               |
| `_`     | Open current working directory |
| `<C-s>` | Open in vertical split         |
| `<C-h>` | Open in horizontal split       |
| `<C-t>` | Open in new tab                |
| `<C-p>` | Preview                        |
| `<C-c>` | Close Oil                      |
| `<C-l>` | Refresh                        |
| `g?`    | Help                           |
| `gs`    | Change sorting                 |
| `gx`    | Open externally                |
| `g.`    | Toggle hidden files            |
| `g\`    | Toggle trash                   |

## Telescope

### Open

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>ff` | Find files             |
| `<leader>fg` | Search text in project |
| `<leader>fb` | Open buffers           |
| `<leader>fh` | Help tags              |
| `<leader>/`  | Search current buffer  |
| `<leader>fs` | Document symbols       |
| `<leader>fS` | Workspace symbols      |

### Inside Telescope

| Key                | Action                        |
| ------------------ | ----------------------------- |
| `<C-n>` / `<Down>` | Next result                   |
| `<C-p>` / `<Up>`   | Previous result               |
| `<CR>`             | Open                          |
| `<C-x>`            | Horizontal split              |
| `<C-v>`            | Vertical split                |
| `<C-t>`            | New tab                       |
| `<C-c>` / `<Esc>`  | Close                         |
| `<Tab>`            | Select result                 |
| `<S-Tab>`          | Unselect / previous selection |
| `<C-u>` / `<C-d>`  | Scroll preview                |
| `<C-q>`            | Send results to quickfix      |
| `<C-/>` / `?`      | Show Telescope keymaps        |

In Telescope normal mode, `j/k`, `gg/G`, `H/M/L` navigate results.

## LSP

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gr`         | Find references       |
| `gi`         | Go to implementation  |
| `go`         | Go to type definition |
| `K`          | Hover documentation   |
| `<leader>rn` | Rename symbol         |
| `<leader>d`  | Show diagnostics      |

## Formatting

| Key         | Action                  |
| ----------- | ----------------------- |
| `<leader>f` | Format file / selection |

## Completion

| Key         | Action                |
| ----------- | --------------------- |
| `<C-Space>` | Open completion       |
| `<Tab>`     | Next item             |
| `<S-Tab>`   | Previous item         |
| `<CR>`      | Confirm               |
| `<C-n>`     | Next item             |
| `<C-p>`     | Previous item         |
| `<C-e>`     | Close completion      |
| `<C-y>`     | Confirm selected item |

## LuaSnip

| Key     | Action                       |
| ------- | ---------------------------- |
| `<C-f>` | Next snippet placeholder     |
| `<C-b>` | Previous snippet placeholder |

## Tree-sitter Selection

| Key   | Action           |
| ----- | ---------------- |
| `gnn` | Start selection  |
| `grn` | Expand selection |
| `grc` | Expand to scope  |
| `grm` | Shrink selection |

## Spectre

### Open

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>S`  | Toggle Spectre          |
| `<leader>sw` | Search word / selection |
| `<leader>sp` | Search current file     |

### Inside Spectre

| Key          | Action                 |
| ------------ | ---------------------- |
| `<Tab>`      | Next field             |
| `<S-Tab>`    | Previous field         |
| `<CR>`       | Open result            |
| `dd`         | Toggle result          |
| `yy`         | Copy result            |
| `?`          | Help                   |
| `<leader>q`  | Send to quickfix       |
| `<leader>rc` | Replace current result |
| `<leader>R`  | Replace all            |
| `<leader>o`  | Options                |
| `<leader>v`  | Change result view     |
| `<leader>l`  | Resume last search     |
| `ti`         | Toggle ignore case     |
| `th`         | Toggle hidden files    |
| `tu`         | Toggle live update     |

## Notes

* In Oil, `<C-h>` and `<C-l>` override your normal window-navigation mappings.
* `<leader>f` is formatting, while `<leader>ff`, `<leader>fg`, etc. are Telescope commands.
* `gr` is LSP references, while `grn`, `grc`, `grm` are Tree-sitter mappings.

