return {
  "NvChad/nvim-colorizer.lua",
  event = "VeryLazy",
  cmd = {
    "ColorizerAttachToBuffer",
    "ColorizerDetachFromBuffer",
    "ColorizerReloadAllBuffers",
    "ColorizerToggle",
  },
  opts = {
    user_default_options = {
      RGB = true, -- #f0f
      RRGGBB = true, -- #ff00ff
      names = false, -- Magenta
      RRGGBBAA = true, -- #ff00ffff
      rgb_fn = true, -- rgb(255, 0, 255) and rgba(255, 0, 255, 0.75)
      hsl_fn = true, -- hsl(300, 100%, 50%) and hsla(300, 100%, 50%, 0.75)
      mode = "background",
    },
  },
}
