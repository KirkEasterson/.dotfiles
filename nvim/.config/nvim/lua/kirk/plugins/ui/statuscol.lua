local gitsigns_bar = "│"

local gitsigns_hl_pool = {
  GitSignsAdd = "DiagnosticOk",
  GitSignsChange = "DiagnosticWarn",
  GitSignsChangedelete = "DiagnosticWarn",
  GitSignsDelete = "DiagnosticError",
  GitSignsTopdelete = "DiagnosticError",
  GitSignsUntracked = "NonText",
}

local diag_signs_icons = {
  DiagnosticSignError = "󰅘",
  DiagnosticSignWarn = "",
  DiagnosticSignInfo = "󰋽",
  DiagnosticSignHint = "󰌶",
  DiagnosticSignOk = "󰄬",
}

local debug_signs_icons = {
  DapBreakpoint = "",
  DapBreakpointCondition = "󰋗",
  DapBreakpointRejected = "󰅙",
  DapLogPoint = "󰛿",
}

local test_signs_icons = {
  neotest_failed = "",
  neotest_passed = "",
  neotest_running = "",
  neotest_skipped = "",
  neotest_unknown = "",
}

local function get_sign_name(cur_sign)
  if cur_sign == nil then
    return nil
  end

  cur_sign = cur_sign[1]

  if cur_sign == nil then
    return nil
  end

  cur_sign = cur_sign.signs

  if cur_sign == nil then
    return nil
  end

  cur_sign = cur_sign[1]

  if cur_sign == nil then
    return nil
  end

  return cur_sign["name"]
end

local function mk_hl(group, sym)
  return table.concat({ "%#", group, "#", sym, "%*" })
end

local function get_name_from_group(bufnum, lnum, group)
  local cur_sign_tbl = vim.fn.sign_getplaced(bufnum, {
    group = group,
    lnum = lnum,
  })

  return get_sign_name(cur_sign_tbl)
end

local get_statuscol_gitsign = function(bufnr, lnum)
  local cur_sign_nm = get_name_from_group(bufnr, lnum, "gitsigns_vimfn_signs_")

  if cur_sign_nm ~= nil then
    return mk_hl(gitsigns_hl_pool[cur_sign_nm], gitsigns_bar)
  else
    return gitsigns_bar
  end
end

local get_statuscol_diag = function(bufnum, lnum)
  local cur_sign_nm = get_name_from_group(bufnum, lnum, "*")

  if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "DiagnosticSign") then
    return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm] .. "")
  else
    return " "
  end
end

local get_statuscol_marks = function(bufnum, lnum)
  local cur_sign_nm = get_name_from_group(bufnum, lnum, "MarkSigns")

  if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "Marks") then
    return mk_hl(cur_sign_nm, string.gsub(cur_sign_nm, "Marks_", ""))
  else
    return " "
  end
end

local get_statuscol_debug = function(bufnum, lnum)
  local cur_sign_nm = get_name_from_group(bufnum, lnum, "dap_breakpoints")

  if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "Dap") then
    return mk_hl(cur_sign_nm, debug_signs_icons[cur_sign_nm] .. "")
  else
    return " "
  end
end

local get_statuscol_test = function(bufnum, lnum)
  local cur_sign_nm = get_name_from_group(bufnum, lnum, "neotest-status")

  if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "neotest_") then
    return mk_hl(cur_sign_nm, test_signs_icons[cur_sign_nm] .. "")
  else
    return " "
  end
end

local filter_table = function(t, filterIter)
  local out = {}
  for _, v in pairs(t) do
    if filterIter(v) then
      table.insert(out, v)
    end
  end
  return out
end

return {
  "luukvbaal/statuscol.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    -- "kevinhwang91/nvim-ufo",
    -- "mfussenegger/nvim-dap",
  },
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      ft_ignore = {
        "NeogitStatus",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "null-ls-info",
        "NvimTree",
        "packer",
        "scratch",
        "startify",
        "term",
        "terminal",
        "toggleterm",
        "trouble",
      },
      segments = {
        { -- marks
          text = {
            function()
              return get_statuscol_marks(vim.fn.bufnr(), vim.v.lnum)
            end,
          },
          condition = {
            function()
              local cur_sign_tbl = vim.fn.sign_getplaced(vim.fn.bufnr(), {
                group = "MarkSigns",
              })
              return next(cur_sign_tbl[1].signs) ~= nil
            end,
          },
        },
        { -- diagnostics
          text = {
            function()
              return get_statuscol_diag(vim.fn.bufnr(), vim.v.lnum)
            end,
          },
        },
        { -- testing
          text = {
            function()
              return get_statuscol_test(vim.fn.bufnr(), vim.v.lnum)
            end,
            " ",
          },
          condition = {
            function()
              local cur_sign_tbl = vim.fn.sign_getplaced(vim.fn.bufnr(), {
                group = "neotest-status",
              })
              return next(cur_sign_tbl[1].signs) ~= nil
            end,
          },
          -- click = "v:lua.ScLa",
        },
        { -- dap
          text = {
            function()
              return get_statuscol_debug(vim.fn.bufnr(), vim.v.lnum)
            end,
          },
          condition = {
            function()
              local cur_sign_tbl = vim.fn.sign_getplaced(vim.fn.bufnr(), {
                group = "dap_breakpoints",
              })
              return next(cur_sign_tbl[1].signs) ~= nil
            end,
          },
        },
        { -- line numbers
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        -- { -- fold
        --   text = { " ", builtin.foldfunc },
        --   click = "v:lua.ScFa",
        -- },
        { -- git signs
          text = {
            function()
              return get_statuscol_gitsign(vim.fn.bufnr(), vim.v.lnum)
            end,
          },
          condition = { true },
        },
      },
    })
  end,
}
