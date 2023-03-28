-- Avoid errors if lsp-zero is not found
local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local cmp_action_status_ok, cmp_action = pcall(require, "lsp-zero")
if not cmp_action_status_ok then
  return
end


lsp.preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'pyright',
})

-- Autocompletion Bindings --
cmp_action.cmp_action()

lsp.setup_nvim_cmp({
  mapping = cmp.mapping.preset.insert({})
})



lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local key = vim.keymap.set
end)

lsp.setup()
