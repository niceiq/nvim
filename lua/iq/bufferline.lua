local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    offsets = {
        {
            filetype = "NvimTree",
            text = "",
            highlight = "Directory",
            padding = 1,
        }
    },
    hover = {
        enabled = true,
        delay = 0,
        reveal = {'close'}
    },
  }
}
