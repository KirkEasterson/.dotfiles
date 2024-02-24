return {
  "donRaphaco/neotex",
  enabled = false,
  cond = not vim.g.started_by_firenvim,
  ft = {
    "tex",
  },
  cmd = {
    "NeoTex",
    "NeoTexOff",
    "NeoTexOn",
  },
  init = function()
    local neotex_settings = {
      ["delay"] = 100,
    }

    for k, v in pairs(neotex_settings) do
      vim.g["neotex_" .. k] = v
    end
  end,
}
