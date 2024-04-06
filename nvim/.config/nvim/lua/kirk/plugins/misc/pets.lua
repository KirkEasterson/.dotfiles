local charset = {}
do -- [0-9a-zA-Z]
  for c = 48, 57 do
    table.insert(charset, string.char(c))
  end
  for c = 65, 90 do
    table.insert(charset, string.char(c))
  end
  for c = 97, 122 do
    table.insert(charset, string.char(c))
  end
end

local function randomString(length)
  if not length or length <= 0 then
    return ""
  end
  math.randomseed(os.clock() ^ 5)
  return randomString(length - 1) .. charset[math.random(1, #charset)]
end

local function queue()
  local out = {}
  local first, last = 0, -1
  out.push = function(item)
    last = last + 1
    out[last] = item
  end
  out.pop = function()
    if first <= last then
      local value = out[first]
      out[first] = nil
      first = first + 1
      return value
    end
  end
  out.iterator = function()
    return function()
      return out.pop()
    end
  end
  setmetatable(out, {
    __len = function()
      return (last - first + 1)
    end,
  })
  return out
end

local pets = queue()

return {
  "giusgad/pets.nvim",
  dependencies = {
    "giusgad/hologram.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "PetsHideToggle",
    "PetsIdleToggle",
    "PetsKill",
    "PetsKillAll",
    "PetsList",
    "PetsNew",
    "PetsNewCustom",
    "PetsPauseToggle",
    "PetsRemove",
    "PetsRemoveAll",
    "PetsSleepToggle",
  },
  keys = {
    {
      "<leader>pn",
      function()
        local name = randomString(5)
        vim.cmd({
          cmd = "PetsNew",
          args = {
            name,
          },
        })
        pets.push(name)
      end,
      desc = "Pets - new",
    },
    {
      "<leader>pk",
      function()
        local name = pets.pop()
        vim.cmd({
          cmd = "PetsKill",
          args = {
            name,
          },
        })
      end,
      desc = "Pets - kill",
    },
    {
      "<leader>pt",
      vim.cmd.PetsHideToggle,
      desc = "Pets - hide",
    },
    {
      "<leader>pl",
      vim.cmd.PetsList,
      desc = "Pets - list",
    },
  },
  opts = {},
}
