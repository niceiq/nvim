local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'pyright',
})

-- Autocompletion Bindings --
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.setup_nvim_cmp({
  mapping = cmp.mapping.preset.insert({})
})



lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local key = vim.keymap.set
end)

lsp.setup()
