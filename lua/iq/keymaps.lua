-- keymap option parameters
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function names
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)

-- Explorer Window
-- Only have one of them active
keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- Shows 30px left explorer window
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts) -- Toggles NvimTree

-- Resize with arrows
keymap("n", "<C-Up>", "resize +2<cr>", opts)
keymap("n", "<C-Down>", "resize -2<cr>", opts)
keymap("n", "<C-Left>", "vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts) -- goes to the next buffer
keymap("n", "<S-h>", ":bprevious<cr>", opts) -- goes to the previous buffer
keymap("n", "<leader>D", ":Bdelete<cr>", opts) -- Quits the current buffer

-- Formatting
keymap("n", "<m-f>", ":lua vim.lsp.buf.format()<cr>", opts) -- uses null-ls to format

-- Debugging
keymap("n", "<leader>bp", ":DapToggleBreakpoint<cr>", opts) -- toggles breakpoint
keymap("n", "<leader>dr", ":DapContinue<cr>", opts) -- starts or continue debugger
keymap("n", "<leader>dn", ":DapStepOver<cr>", opts) -- step over
keymap("n", "<leader>di", ":DapStepInto<cr>", opts) -- step into
keymap("n", "<leader>do", ":DapStepOut<cr>", opts) -- step out
keymap("n", "<leader>do", ":DapStepOut<cr>", opts) -- step out

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better yank & paste
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fp", ":Telescope projects<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)

-- autolist --
