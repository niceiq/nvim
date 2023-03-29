local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup ({
   -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 10 
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<m-\>]],
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 2, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  direction = 'horizontal',
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<m-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<m-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<m-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<m-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<m-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Fast Terminal Apps

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({cmd = "lazygit", hidden = true})
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({cmd = "node", hidden = true})
function _NODE_TOGGLE()
  node:toggle()
end

local htop = Terminal:new({cmd = "htop", hidden = true})
function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({cmd = "python", hidden = true})
function _PYTHON_TOGGLE()
  python:toggle()
end

