-- Use relative line numbers
vim.opt.relativenumber = true
-- Use absolute line number in gutter
vim.opt.number = true
-- Shows row and column number in bottomright of terminal
vim.opt.ruler = true

-- Modify searches done with `/` behavior
-- Highlights searches as you type
vim.opt.incsearch = true
-- Ignore case
vim.opt.ic = true
-- Show partial matches
vim.opt.is = true
-- Add underscore as a word character
vim.opt.iskeyword="@,48-57,192-255"


-- vim.keymap.set configurations that work both in standalone-nvim and VS Code:

-- Keybindings to insert blank rows above or below without going into insert
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>o', 'o<Esc>k$')
vim.keymap.set('n', '<leader>O', 'O<Esc>j0')

-- Clear nvim highlighting
vim.keymap.set('n', '<leader>C', ':nohlsearch<Enter>')

-- Keybinding to clear highlighting of searched term by hitting enter
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

-- Paste over rest of word with current selection
vim.keymap.set('n', '<leader>p', 'cw<C-r>0<Esc>l')

-- Modify `S` behavior so does not remove entire line but just from current
vim.keymap.set('n', 'S', 'DA')

-- Quick way to wrap a word in double quotes
vim.keymap.set('n', '<leader>d', 'ciw""<Esc>P')

-- Quick way to wrap a word in single quotes
vim.keymap.set('n', '<leader>s', "ciw''<Esc>P")

-- Quick way to toggle capitalization in a word
vim.keymap.set('n', '<leader>c', "viw~<Esc>")
vim.keymap.set('n', '<leader>C', "viW~<Esc>")

-- Quick way to copy the highlighted section of text to clipboard
vim.keymap.set('v', '<D-c>', '"+y')

-- vim.keymap.set configurations that work in nvim but are ignored by VS Code:
-- Seems like the vim.keymap configs are not picked up by VS Code;
-- see closed issue here: 
-- https://github.com/vscode-neovim/vscode-neovim/issues/1089
-- Keybindings to recenter cursor in window after a jump
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')


-- vim.keymap.set configurations that are not working in standalone-nvim nor VS Code:

-- Keybinding to retain your vim register when pasting over a highlighted item
-- instead of replacing your register with the item you are highlighting over
-- Seen at about minute 6 of this video: https://www.youtube.com/watch?v=qZO9A5F6BZs&ab_channel=ThePrimeagen
-- vim.keymap.set('n', '<leader>p', '\'_dP')
