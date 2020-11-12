# macroscope.vim

Quick macro editing in vim

## Motivation

To save myself looking at [this
article](https://thoughtbot.com/blog/how-to-edit-an-existing-vim-macro) for the
100th time when I want to edit a macro, I thought I'd write a quick plugin for
it

## Features

- `:Macroscope {register}` to open a scratch window with the contents of the
  macro in register `{register}` (defaults to `q` if none supplied) pasted
- Leaving the scratch window will automatically update the macro

## Installation

Use your favourite plugin manager to install this package. I like `vim-plug`.

```
Plug 'dbatten5/vim-macroscope'
```
