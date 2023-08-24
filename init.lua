-- Use relative line numbers
vim.opt.relativenumber = true
-- Use absolute line number in guter
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


-- vim.keymap.set configurations that work both in standalone-nvim and VS Code:

-- Keybindings to insert blank rows above or below without going into insert mode
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>o', 'o<Esc>k$')
vim.keymap.set('n', '<leader>O', 'O<Esc>j0')

-- Modify `S` behavior so does not remove entire line but just from current placement
vim.keymap.set('n', 'S', 'DA')

-- Keybinding to clear highlighting of searched term by hitting enter
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

-- Quick way to write -- and --- in Markdown formats
vim.keymap.set('n', '@n', 'qna &ndash; <Esc>q')
vim.keymap.set('n', '@m', 'qma &mdash; <Esc>q')

-- Quick way to write | | | for making a two-column table row in Markdown formats
vim.keymap.set('n', '@p', 'qpo<Esc>xi| | |<Esc>0q')

-- vim.keymap.set configurations that work in standalone-nvim but are ignored by VS Code:

-- Seems like the vim.keymap configs are not picked up by VS Code; see closed issue here: 
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
