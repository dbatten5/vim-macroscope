# macroscope.vim

Quick macro editing in vim.

## Motivation

To save myself looking at [this
article](https://thoughtbot.com/blog/how-to-edit-an-existing-vim-macro) for the
100th time when I want to edit a macro, I thought I'd write a quick plugin for
it.

## Features

- `:Macroscope {register}` to open a `macroscope` scratch window with the
  contents of the macro in register `{register}` pasted (defaults to `q` if
  no register supplied).
- Leaving the window will automatically update the macro with whatever was
  inside the `macroscope` window.
- Alternatively, `s` in normal mode in the `macroscope` window to update the
  macro.

See the docs for configuration options.

## Installation

Use your favourite plugin manager to install this plugin. I like `vim-plug`.

```
Plug 'dbatten5/vim-macroscope'
```
