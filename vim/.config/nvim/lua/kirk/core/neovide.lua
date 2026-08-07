-- neovide
if vim.g.neovide then
  vim.opt.linespace = 4
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_window_blurred = false
  vim.g.neovide_transparency = 1.0
  vim.g.neovide_floating_blur_amount_y = 0.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_show_border = false

  vim.g.neovide_position_animation_length = 0.1
  vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_cursor_animation_length = 0.0
  vim.g.neovide_cursor_trail_size = 0.0
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false

  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5

  vim.keymap.set("v", "<D-c>", "\"+y") -- Copy
  vim.keymap.set("i", "<D-v>", "<ESC>l\"+Pli") -- Paste insert mode
end
