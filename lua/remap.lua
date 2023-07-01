-- These are the remaps (keybindings) that use Neovim's built-in functionality.
-- Remaps that use plugin functionality are set in the "pluginremap.lua" file.

vim.g.mapleader = " "

-- Go to the directory of the currently edited file
vim.keymap.set("n", "<leader>cd", ":cd %:p:h <CR> :pwd <CR>")
-- Go up a directory
vim.keymap.set("n", "<leader>c.", ":cd .. <CR> :pwd <CR>")

-- Open an external terminal in the current working directory
vim.keymap.set("n", "<leader><Return>", ":cd %:p:h <CR> :!$TERM & disown <CR> :mode <CR>")

-- Show Netrw
vim.keymap.set("n", "<leader>lf", vim.cmd.Ex)

-- Easily yank (copy) stuff into the system clipoboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+y$]])

-- Easily delete (cut) stuff into the system clipoboard
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

-- Easily delete stuff without copying it
vim.keymap.set({"n", "v"}, "<leader>c", [["_c]])
vim.keymap.set("n", "<leader>C", [["_C]])

-- Keep the copied string in register when pasting over a highlight
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Splits
-- Navigate splits quickly in normal and insert mode
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("i", "<A-h>", "<Esc><C-w>h")
vim.keymap.set("i", "<A-j>", "<Esc><C-w>j")
vim.keymap.set("i", "<A-k>", "<Esc><C-w>k")
vim.keymap.set("i", "<A-l>", "<Esc><C-w>l")
-- Move splits quickly in normal mode
vim.keymap.set("n", "<A-H>", "<C-w>H")
vim.keymap.set("n", "<A-J>", "<C-w>J")
vim.keymap.set("n", "<A-K>", "<C-w>K")
vim.keymap.set("n", "<A-L>", "<C-w>L")
-- Resize splits quickly in normal mode
vim.keymap.set("n", "<A-=>", "<C-w>=")
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-Down>", ":resize -1<CR>")
vim.keymap.set("n", "<A-Up>", ":resize +1<CR>")
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>")

-- Replace a word in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file (not) executable
vim.keymap.set("n", "<leader>x", "<Cmd>!chmod +x %<CR><CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<Cmd>!chmod -x %<CR><CR>", { silent = true })

-- Set a new undo point and delete a word with ctrl-backspace in insert mode
-- (this is for terminals that pass ctrl-backspace as <C-BS> instead of <C-w> to neovim)
vim.keymap.set("i", "<C-BS>", "<C-G>u<C-W>" )

--The remaps below don't really add new functionality to Neovim, they just improve the behavior of already existent mappings. They could almost be regarded as settings.

-- Keep the cursor in the middle of the screen
-- when scrolling half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- when scrolling a full page
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
-- when viewing search results
vim.keymap.set("n", "n", "nzz") -- or "nzzzv"
vim.keymap.set("n", "N", "Nzz") -- or "Nzzzv"

-- Keep the cursor in the same place when appending lines
vim.keymap.set("n", "J", "mzJ`z")

-- Default bindings that I'd like to make sure I keep regardless of potential future updates
vim.keymap.set("n", "Y", "y$" )
-- Set a new undo point and delete a line with ctrl-u in insert mode
vim.keymap.set("i", "<C-U>", "<C-G>u<C-U>" )
-- Set a new undo point and delete a word with ctrl-w in insert mode
vim.keymap.set("i", "<C-W>", "<C-G>u<C-W>" )
