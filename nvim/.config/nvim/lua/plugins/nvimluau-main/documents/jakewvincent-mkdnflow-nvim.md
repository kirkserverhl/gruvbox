---
name: jakewvincent/mkdnflow.nvim
slug: jakewvincent-mkdnflow-nvim
category: Note Taking
created: 'Mar 12, 2022 11:09'
description: Tools for markdown notebook navigation and management
url: 'https://github.com/jakewvincent/mkdnflow.nvim'
stars: 97
topics:
  - markdown
  - neovim
  - vimwiki
  - wiki
updated_at: '2022-03-05T22:22:53Z'
---
# ⬇️ mkdnflow

Jump to: [Installation](#-installation) / [Features](#-features) / [Configuration](#%EF%B8%8F-configuration) / [Commands & default mappings](#-commands-and-default-mappings) / [To do](#%EF%B8%8F-to-do) / [Recent changes](#-recent-changes) / [Other plugins and links](#-links)

## 📝 Description

This plugin is designed to replicate the features I use most from [Vimwiki](https://github.com/vimwiki/vimwiki), implementing them in Lua instead of VimL. It is a set of functions and keybindings (optional, but enabled by default) that make it easy to navigate and manipulate markdown notebooks/journals/wikis in Neovim.

If you have a suggestion or problem with anything, file an [issue](https://github.com/jakewvincent/mkdnflow.nvim/issues); or if you'd like to contribute, work on a fork of this repo and submit a [pull request](https://github.com/jakewvincent/mkdnflow.nvim/pulls).

### ⚡ Requirements

*   Linux or macOS (for full functionality)
*   Windows (for partial functionality; see [Caveats/warnings](#-caveats-warnings))
*   Neovim >= 0.5.0

### ➖ Differences from [Vimwiki](https://github.com/vimwiki/vimwiki)

*   Vimwiki doesn't use markdown by default; mkdnflow only works for markdown.
*   I'm intending mkdnflow to be a little lighter weight/less involved than Vimwiki. Mkdnflow doesn't and won't provide syntax highlighting and won't create new filetypes.

## 📦 Installation

### init.lua

<details>
<summary>Install with Packer</summary><p>

```lua
use({'jakewvincent/mkdnflow.nvim',
     config = function()
        require('mkdnflow').setup({
            -- Config goes here; leave blank for defaults
        })
     end
})
```

</p></details>

<details>
<summary>Install with Paq</summary><p>

```lua
require('paq')({
    -- Your other plugins;
    'jakewvincent/mkdnflow.nvim';
    -- Your other plugins;
})

-- Include the setup function somewhere else in your init.lua/vim file, or the
-- plugin won't activate itself:

require('mkdnflow').setup({
    -- Config goes here; leave blank for defaults
})
```

</p></details>

### init.vim

<details>
<summary>Install with Vim-Plug, NeoBundle, Vundle, Pathogen, or Dein</summary><p>

```vim
" Vim-Plug
Plug 'jakewvincent/mkdnflow.nvim'

" NeoBundle
NeoBundle 'jakewvincent/mkdnflow.nvim'

" Vundle
Bundle 'jakewvincent/mkdnflow.nvim'

" Pathogen
git clone https://github.com/jakewvincent/mkdnflow.nvim.git ~/.vim/bundle/mkdownflow.nvim

" Dein
call dein#add('jakewvincent/mkdnflow.nvim')

" Include the setup function somewhere else in your init.vim file, or the
" plugin won't activate itself:
lua << EOF
require('mkdnflow').setup({
    -- Config goes here; leave blank for defaults
})
EOF
```

</p></details>

## ✨ Features

*   Create links from (a) word under cursor or (b) visual selection (mapped to `<CR>` by default)
    *   Automatically prefix filenames created in the above manner with the current date: `YYYY-MM-DD_<word>.md`. The prefix can be changed; see [Configuration](#%EF%B8%8F-configuration).
*   Jump to the next/previous link in the file, optionally wrapping to beginning/end of file (mapped to `<Tab>` and `<S-Tab>` by default, respectively)
*   Follow links relative to the first-opened file or current file (as specified in your config) or, if the path is prefixed with `file:`, the path can be absolute (starting with `/`) or relative to your home directory (starting with `~/`) (mapped to `<CR>` by default)
    *   `<CR>`ing on a link to a text file will open it in the current window (i.e. `:e <filename>`)
    *   `<CR>`ing on a link to a file prefixed with `file:` (formerly `local:`), e.g. `[My Xournal notes](file:notes.xopp)`, will open that file with whatever the system's associated program is for that filetype (using `xdg-open` on Linux or `open` on macOS)
    *   `<CR>`ing on a link to an absolute path or a path in \~/, as long as that path is prefixed with `file:`, will open that file with the system's associated program for that filetype (see above)
    *   `<CR>`ing on a link to a web URL will open that link in your default browser
*   Create missing directories if a link goes to a file in a directory that doesn't exist
*   `<BS>` to go to previous file/buffer opened in the window
*   Enable/disable default keybindings (see [Configuration](#%EF%B8%8F-configuration))

### ❗ Caveats/warnings

*   The plugin won't start *automatically* if the first-opened file is not one of the default or named extensions (see [Configuration](#%EF%B8%8F-configuration)), but you can manually start the plugin with the defined command `:Mkdnflow`.
*   On Windows, the plugin should successfully load, but the use of certain functions will result in a message in the command line: `Function unavailable for Windows`. The functionality currently unavailable for Windows includes:
    *   Opening local files and URLs outside of Neovim
    *   Following links within Neovim while `create_dirs` is enabled. If you are on Windows, you should set `create_dirs` to `false` and make sure that all directories you specify as part of a link already exist.

## ⚙️ Configuration

Currently, the setup function uses the defaults shown below. See the descriptions and non-default options in the comments above each setting. **To use these defaults, simply call the setup function without any argument:** `require('mkdnflow').setup({})`. To change these settings, specify new values for any of them them in the setup function.

```lua
require('mkdnflow').setup({
    -- Type: boolean. Use default mappings (see '❕Commands and default
    --     mappings').
    -- 'false' disables mappings
    default_mappings = true,        

    -- Type: boolean. Create directories (recursively) if link contains a
    --     missing directory.
    -- 'false' prevents missing directories from being created
    create_dirs = true,             

    -- Type: string. Navigate to links relative to the directory of the first-
    --     opened file.
    -- 'current' navigates links relative to currently open file
    links_relative_to = 'first',    

    -- Type: key-value pair(s). The plugin's features are enabled only when one
    -- of these filetypes is opened; otherwise, the plugin does nothing. NOTE:
    -- extensions are converted to lowercase, so any filetypes that convention-
    -- ally use uppercase characters should be provided here in lowercase.
    filetypes = {md = true, rmd = true, markdown = true},

    -- Type: boolean. When true, the createLinks() function tries to evaluate
    --     the string provided as the value of new_file_prefix.
    -- 'false' results in the value of new_file_prefix being used as a string,
    --     i.e. it is not evaluated, and the prefix will be invariant.
    evaluate_prefix = true,

    -- Type: string. Defines the prefix that should be used to create new links.
    --     This is evaluated at the time createLink() is run, which is to say
    --     that it's run whenever <CR> is pressed (under the default mappings).
    --     This makes for many interesting possibilities.
    new_file_prefix = [[os.date('%Y-%m-%d_')]],

    -- Type: boolean. When true and Mkdnflow is searching for the next/previous
    --     link in the file, it will wrap to the beginning of the file (if it's
    --     reached the end) or wrap to the end of the file (if it's reached the
    --     beginning during a backwards search).
    wrap_to_beginning = false,
    wrap_to_end = false
})
```

### 👍 Recommended vim settings

It is recommended to turn on `autowriteall` in Neovim. This will ensure that changes to buffers are saved when you navigate away from that buffer, e.g. by following a link to another file. See `:h awa`.

```lua
-- If you have an init.lua
vim.o.autowriteall = true
```

```vim
" If you have an init.vim
set autowriteall
```

### ❕ Commands and default mappings

These default mappings can be disabled; see [Configuration](#%EF%B8%8F-configuration). Commands with no mappings trigger functions that are called by the functions with mappings, but I've given them a command name so you can use them as independent functions if you'd like to.

| Keymap    | Mode | Command               | Description                                                                                                                                                  |
| --------- | ---- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `<Tab>`   | n    | `:MkdnNextLink<CR>`   | Move cursor to the beginning of the next link (if there is a next link)                                                                                      |
| `<S-Tab>` | n    | `:MkdnPrevLink<CR>`   | Move the cursor to the beginning of the previous link (if there is one)                                                                                      |
| `<BS>`    | n    | `:MkdnGoBack<CR>`     | Open the last-active buffer in the current window                                                                                                            |
| `<CR>`    | n    | `:MkdnFollowPath<CR>` | Open the link under the cursor, creating missing directories if desired, or if there is no link under the cursor, make a link from the word under the cursor |
| --        | --   | `:MkdnGetPath<CR>`    | With a link under the cursor, extract (and return) just the path part of it (i.e. the part in parentheses, following the brackets)                           |
| --        | --   | `:MkdnCreateLink<CR>` | Replace the word under the cursor with a link in which the word under the cursor is the name of the link                                                     |
| --        | --   | `:Mkdnflow<CR>`       | Manually start Mkdnflow                                                                                                                                      |

### Miscellaneous notes on remapping

*   The back-end function for `:MkdnGoBack`, `require('mkdnflow).files.goBack()`, returns a boolean indicating the success of `goBack()` (thanks, @pbogut!). This is useful if the user wishes to remap `<BS>` so that when `goBack()` is unsuccessful, another function is performed.

## ☑️ To do

*   [ ] Easy *forward* navigation through buffers (with `<S-BS>`?)
*   [ ] "Undo" a link (replace link w/ the text part of the link)
*   [ ] Lists
    *   [ ] To-do list functions & mappings
    *   [ ] Smart `<CR>` when in lists, etc.
*   [ ] Fancy table creation & editing
    *   [ ] Create a table of x columns and y rows
    *   [ ] Add/remove columns and rows
    *   [ ] Horizontal and vertical navigation through tables (with `<Tab>` and `<CR>`?)
    *   [ ] Make a way for the user to define specialized tables (e.g. time sheets)
*   [ ] Full compatibility with Windows
*   [x] Add a config option to wrap to the beginning of the document when navigating between links (11/08/21)
*   [ ] Function to increase/decrease the level of headings
*   [ ] Jump to in-file locations by `<CR>`ing on links to headings
*   [ ] Easily rename file in link
*   [ ] Better way of dealing w/ paths to directories
    *   Option to open in GUI or w/ some tool in vim?
*   [x] Allow reference to absolute paths (interpret relatively \[following config] if not prepended w/ `~` or `/`)
*   [ ] Allow parentheses in link names ([issue #8](https://github.com/jakewvincent/mkdnflow.nvim/issues/8))
*   [ ] Command to add a "quick note" (add link to a specified file, e.g. `index.md`, and open the quick note)

## 🔧 Recent changes

*   02/03/22: Fixed case issue w/ file extensions ([issue #13](https://github.com/jakewvincent/mkdnflow.nvim/issues/13))
*   01/21/22: Path handler can now identify links with the file: prefix that have absolute paths or paths starting with `~/`
*   11/10/21: Merged [@pbogut's PR](https://github.com/jakewvincent/mkdnflow.nvim/pull/7), which modifies `require('mkdnflow').files.goBack()` to return a boolean (`true` if `goBack()` succeeds; `false` if `goBack()` isn't possible). For the default mappings, this causes no change in behavior, but users who wish `<BS>` to perform another function in the case that `goBack()` fails can now use `goBack()` in the antecedent of a conditional. @pbogut's mapping, for reference:

```lua
if not require('mkdnflow').files.goBack() then
  vim.cmd('Dirvish %:p')
end
```

*   11/08/21: Add option to wrap to beginning/end of file when jumping to next/previous link. Off by default.
*   11/01/21: Added vimdoc documentation
*   10/30/21: Added capability for manually starting the plugin with `:Mkdnflow`, addressing [issue #5](https://github.com/jakewvincent/mkdnflow.nvim/issues/5)
*   09/23/21: Fixed [issue #3](https://github.com/jakewvincent/mkdnflow.nvim/issues/3)
*   09/23/21: Added compatibility with macOS
*   09/21/21: Fixed [issue #1](https://github.com/jakewvincent/mkdnflow.nvim/issues/1). Implemented a push-down stack to better handle backwards navigation through previously-opened buffers.
*   09/19/21: Fixed [issue #2](https://github.com/jakewvincent/mkdnflow.nvim/issues/2). Paths with spaces can now be created.

## 🔗 Links

*   Plugins that would complement mkdnflow:
    *   [clipboard-image.nvim](https://github.com/ekickx/clipboard-image.nvim) (Paste links to images in markdown syntax)
    *   [mdeval.nvim](https://github.com/jubnzv/mdeval.nvim) (Evaluate code blocks inside markdown documents)
    *   Preview plugins
        *   [Markdown Preview for (Neo)vim](https://github.com/iamcco/markdown-preview.nvim) ("Preview markdown on your modern browser with synchronised scrolling and flexible configuration")
        *   [nvim-markdown-preview](https://github.com/davidgranstrom/nvim-markdown-preview) ("Markdown preview in the browser using pandoc and live-server through Neovim's job-control API")
        *   [glow.nvim](https://github.com/npxbr/glow.nvim) (Markdown preview using [glow](https://github.com/charmbracelet/glow)—render markdown in Neovim, with *pizzazz*!)
        *   [auto-pandoc.nvim](https://github.com/jghauser/auto-pandoc.nvim) ("\[...] allows you to easily convert your markdown files using pandoc.")
*   [Awesome Neovim's list of markdown plugins](https://github.com/rockerBOO/awesome-neovim#markdown) (a big list of plugins for Neovim)
*   [Vimwiki](https://github.com/vimwiki/vimwiki) (Full-featured journal navigation/maintenance)
