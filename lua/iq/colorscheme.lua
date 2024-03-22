local colorscheme = "gruvbox-material"

-- Gruvbox-material things
vim.cmd([[set background=dark]])
vim.cmd([[let g:gruvbox_material_background = 'medium']])
vim.cmd([[let g:gruvbox_matirial_foreground = 'mix']])
vim.cmd([[let g:gruvbox_material_spell_foreground = 'colored']])

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end


