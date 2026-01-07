# Neovim Keymaps Documentation

This document provides a comprehensive overview of all custom keymaps configured in this Neovim setup.

## Table of Contents
- [Mode Control & Escape Keys](#mode-control--escape-keys)
- [Saving Files](#saving-files)
- [Text Editing & Manipulation](#text-editing--manipulation)
- [Register Management](#register-management)
- [Motion & Navigation](#motion--navigation)
- [Search & Replace](#search--replace)
- [Buffer & Window Management](#buffer--window-management)
- [Git Integration](#git-integration)
- [File Navigation & Search](#file-navigation--search)
- [LSP Keymaps](#lsp-keymaps)
- [Plugin-Specific Keymaps](#plugin-specific-keymaps)
- [Miscellaneous](#miscellaneous)

---

## Mode Control & Escape Keys

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-Space>` | No-op | Disabled in normal mode |
| Terminal | `<A-w>` | `<C-\><C-n>` | Enter normal mode from terminal |
| Command | `<C-Space>` | `<C-c>` | Escape command mode |
| Insert | `<C-Space>` | `<Esc>l` | Escape insert mode and move cursor right |
| Visual | `<C-Space>` | `<Esc>` | Escape visual mode |
| Insert | `<C-[>` | Escape | Stop insert mode and move cursor right |
| Normal/Visual | `<C-c>` | `:` | Enter command mode |
| Insert | `<C-c>` | Escape | Stop insert mode |
| Insert | `<C-e>` | `<C-o>` | Execute one normal mode command from insert |

## Saving Files

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Insert | `<C-s>` | Save & move right | Save file silently |
| All | `<C-s>` | Save | Save file silently |

## Text Editing & Manipulation

### Line Manipulation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `"` | Insert line above | Insert empty line above current line |
| Normal | `'` | Push line down | Insert empty line above and stay there |
| Normal | `\|` | Insert line below | Insert empty line below current line |
| Normal | `K` | Split line | Split line at cursor position |
| Normal | `J` | `gJ` | Join lines without adding space |

### Replace & Change Operations
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `R` | `r` | Replace character(s) |
| Normal | `U` | `<C-r>` | Redo |
| Normal/Visual | `c` | `"_c` | Change without yanking to register |
| Normal | `<Leader><Space>` | Custom | Replace consecutive whitespaces with single space |
| Normal | `<Leader>d` | Custom | Delete consecutive whitespaces under cursor |

### Comments
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `` ` `` | `gcc` | Toggle comment on current line |
| Visual | `` ` `` | `gc` | Toggle comment on selection |

### Other Editing
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-c>` | `<C-a>` | Increment number under cursor |
| Normal/Visual | `x` | `~h` | Toggle case and move left |

## Register Management

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `X` | `d` | Cut (delete to default register) |
| Normal | `d` | `"dd` | Delete to 'd' register |
| Normal | `dd` | `"ddd` | Delete line to 'd' register |
| Visual | `d` | `"dd` | Delete selection to 'd' register |
| Normal/Visual | `<C-p>` | `"dp` | Paste from 'd' register |
| Visual | `p` | `"ddP` | Paste without overwriting register |

## Motion & Navigation

### Basic Motions
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| All | `<C-h>` | `_` | Go to start of line |
| Insert | `<C-h>` | `<C-o>I` | Go to start of line (insert mode) |
| All | `<C-l>` | `<C-o>` | Previous location (overrides default) |
| Insert | `<C-l>` | `<C-o>` | Previous location (insert mode) |
| All | `<C-o>` | `g_` | Go to end of line |
| Insert | `<C-o>` | `<C-o>A` | Go to end of line (insert mode) |
| Insert | `<C-d>` | `<Left>` | Move cursor left |
| Insert | `<C-f>` | `<Right>` | Move cursor right |

### Word Motions
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `w` | Custom | Jump to beginning of next word (Flash) |
| Normal/Visual | `W` | Custom | Jump to beginning of previous word (Flash) |
| Normal/Visual | `e` | Custom | Jump to end of next word (Flash) |
| Normal/Visual | `E` | Custom | Jump to end of previous word (Flash) |
| Normal | `<Leader>w` | Custom | Select previous word (Flash) |
| Normal | `<Leader>x` | Custom | Select next word (Flash) |

### Bracket & Quote Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `!` | `?[[({\\])}]<CR>` | Go to previous bracket |
| Normal/Visual | `,` | `/[[({\\])}]<CR>` | Go to next bracket |
| Normal/Visual | `^` | `?[\'"\`]<CR>` | Go to previous quote |
| Normal/Visual | `&` | `/[\'"\`]<CR>` | Go to next quote |

### Vertical Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `<C-t>` | Custom | Jump to vertical non-space character (down) |
| Normal/Visual | `<C-y>` | Custom | Jump to vertical non-space character (up) |

### Page & Screen Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `<C-r>` | `<C-y>` | Scroll page down |
| Normal | `(` | `Lzz` | Move to bottom of screen, center |
| Normal | `)` | `Hzz` | Move to top of screen, center |

### Jump List & Marks
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `b` | `<C-o>` | Jump to previous location |
| Normal | `B` | `<C-i>` | Jump to next location |
| Normal | `gm` | `` ` `` | Jump to mark |
| Normal/Visual | `ge` | `G` | Jump to end of buffer |

### Buffer Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `n` | `:Buffers` | Switch buffers (FZF) |
| Normal/Visual | `N` | `:Buffers` | Switch buffers (FZF) |
| Normal/Visual | `J` | `gJ` | Join without space |

### Fold Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `zj` | `zjzz` | Next fold below, centered |
| Normal/Visual | `zk` | `zkzz` | Previous fold above, centered |

### Function Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `{{` | `{{zz` | Previous function start, centered |
| Normal | `}}` | `}}zz` | Next function start, centered |

## Search & Replace

### Search
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `f` | Custom | Flash search forward |
| Normal/Visual | `r` | Custom | Flash search backward |
| Normal/Visual | `/` | Custom | Regular search forward |
| Normal/Visual | `?` | Custom | Regular search backward |
| Normal | `*` | `*zz` | Search word under cursor (centered) |
| Normal | `#` | `#zz` | Reverse search word under cursor (centered) |
| Normal | `+` | `nzz` | Next search result (centered) |
| Normal | `-` | `Nzz` | Previous search result (centered) |
| Command | `<CR>` | Custom | Center screen after search |
| Command | `<C-g>` | `<Up>` | Previous command/search in history |

### Replace
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<Leader>sr` | `:%s/` | Search and replace in entire file |
| Visual | `<Leader>sr` | `:s/` | Search and replace in selection |

## Buffer & Window Management

### Buffer Operations
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<Leader>q` | Delete buffer | Delete current buffer, switch to previous |
| Normal | `gs` | Split & close others | Split current buffer, close all others |
| Normal | `<Leader>cd` | Copy directory | Copy current directory path to clipboard |

### Surrounding
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Visual | `s` | VSurround | Surround selection |
| Normal | `s` | VSurround word | Surround word under cursor |

## Git Integration

### Fugitive Git Commands
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-g>` | `:Git` | Open Git status |
| Normal | `<Leader>gg` | `:G push` | Git push |
| Normal | `<Leader>gc` | `:G branch` | Git branch management |
| Normal | `<Leader>gb` | `:G blame` | Git blame |
| Normal | `<Leader>gd` | Custom | Delete git branch (in git buffer) |

### Diffview
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `df` | Toggle Diffview | Open/close diff view |

## File Navigation & Search

### FZF File Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-f>` | `:GFiles` | Search git files |
| Normal | `G` | `:GitGrep` | Git grep search |

### Yazi File Manager
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-d>` | Open Yazi | Open Yazi file manager in current file's directory |

### GrugFar (Find & Replace)

#### Opening GrugFar
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal/Visual | `gf` | Open GrugFar | Open find and replace in new window |
| Normal | `gw` | GrugFar word | Open GrugFar with word under cursor |

#### Inside GrugFar Buffer
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `gf` | Clear search | Clear search field (goes to line 2) |
| Normal | `<LocalLeader>r` | Replace | Execute replace operation |
| Normal | `<Leader>q` | Quickfix list | Send results to quickfix list |
| Normal | `<LocalLeader>s` | Sync locations | Sync all locations |
| Normal | `<LocalLeader>l` | Sync line | Sync current line |
| Normal | `<C-Space>` | Close | Close GrugFar window |
| Normal | `<LocalLeader>t` | History open | Open history |
| Normal | `<LocalLeader>a` | History add | Add to history |
| Normal | `<LocalLeader>f` | Refresh | Refresh results |
| Normal | `<Down>` | Next location | Open next location |
| Normal | `<Up>` | Previous location | Open previous location |
| Normal | `<Enter>` | Go to location | Go to selected location |
| Normal | `<LocalLeader>b` | Abort | Abort current operation |
| Normal | `g?` | Help | Show help |
| Normal | `<Leader>p` | Toggle command | Toggle show command |
| Normal | `<LocalLeader>e` | Swap engine | Swap search engine |
| Normal | `<LocalLeader>i` | Preview | Preview location |

## LSP Keymaps

These keymaps are only available when an LSP is attached to a buffer.

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<C-i>` | Hover | Show hover documentation |
| Normal | `gr` | References | Find references of symbol |
| Normal | `gd` | Definition | Go to definition |
| Normal | `<Leader>i` | Code action | Show code actions |
| Normal | `<Leader>e` | Show diagnostics | Show diagnostics for current line |
| Normal | `<Leader>f` | Next diagnostic | Jump to next diagnostic |
| Normal | `<Leader>b` | Previous diagnostic | Jump to previous diagnostic |

**Note:** When no LSP is attached, `gr` defaults to `*` (search word) to prevent accidental replace.

## Plugin-Specific Keymaps

### Claude Code AI Assistant
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<Leader>ac` | Toggle Claude | Toggle Claude Code terminal |
| Normal | `<Leader>af` | Focus Claude | Focus Claude Code window |
| Normal | `<Leader>ar` | Resume Claude | Resume previous Claude session |
| Normal | `<Leader>aC` | Continue Claude | Continue Claude conversation |
| Normal | `<Leader>am` | Select model | Select Claude model |
| Normal | `<Leader>ab` | Add buffer | Add current buffer to Claude context |
| Visual | `<Leader>as` | Send to Claude | Send selection to Claude |
| Normal (file tree) | `<Leader>as` | Add file | Add file from file tree to Claude |
| Normal | `<Leader>aa` | Accept diff | Accept Claude's diff suggestion |
| Normal | `<Leader>ad` | Deny diff | Deny Claude's diff suggestion |

### Windsurf AI Completions
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Insert | `<A-g>` | Accept completion | Accept AI suggestion |
| Insert | `<A-w>` | Accept next word | Accept next word of suggestion |
| Insert | `<A-e>` | Accept next line | Accept next line of suggestion |
| Insert | `<A-x>` | Clear suggestion | Clear current suggestion |
| Insert | `<A-a>` | Trigger completion | Manually trigger AI completion |

### Window Picker
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `<A-w>` | Pick window | Pick and jump to a window |

## Miscellaneous

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| Normal | `~` | `:qa` | Quit Neovim |
| Normal | `<Leader>z` | `:qa` | Quit Neovim |

---

## Key Terminology

- **Leader key**: The leader key is typically `\` or `,` (check `:let mapleader` in your config)
- **LocalLeader key**: A secondary leader key for buffer-local mappings (check `:let maplocalleader`)
- **Flash**: A plugin for enhanced navigation with visual hints
- **VSurround**: vim-surround plugin for surrounding text with quotes, brackets, etc.
- **GrugFar**: Advanced find and replace plugin with project-wide search capabilities
- **FZF**: Fuzzy file finder for quick file navigation
- **Yazi**: Terminal file manager with preview capabilities
- **Claude Code**: AI pair programming assistant powered by Claude

## Notes

1. Many keymaps use Flash for enhanced navigation with visual feedback
2. Register management is customized: 'd' register for deletions, default register for cuts
3. Centered search results for better visibility
4. Custom vertical and horizontal navigation optimized for code editing
5. LSP keymaps are buffer-local and only active when LSP is attached
6. Some keys have different mappings depending on mode (e.g., `<C-d>` opens Yazi in normal mode but moves cursor left in insert mode)
7. GrugFar has extensive keymaps that only work within the GrugFar buffer
8. Claude Code keymaps all start with `<Leader>a` for easy access to AI features

## File References

- Main keymaps: `lua/keymaps.lua`
- LSP keymaps: `lua/lsps.lua`
- Plugin keymaps:
  - `lua/externalPlugins/claudeCode.lua` - Claude Code AI assistant
  - `lua/externalPlugins/yazi.lua` - Yazi file manager
  - `lua/externalPlugins/grugFar.lua` - GrugFar find & replace
  - `lua/externalPlugins/nvimWindow.lua` - Window picker
  - `lua/externalPlugins/windsurf.lua` - Windsurf AI completions
  - `lua/externalPlugins/diffview.lua` - Git diff view
  - `lua/externalPlugins/flash.lua` - Flash navigation (config only, keymaps in keymaps.lua)
