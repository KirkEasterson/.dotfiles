return {
  "nvim-telescope/telescope.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",

    -- "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",

    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-smart-history.nvim",

    -- "folke/trouble.nvim",
  },
  cmd = {
    "Telescope",
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      borderchars = { "─", "", "─", "", "─", "─", "─", "─" },
      path_display = { "truncate" },
      layout_strategy = "center",
      layout_config = {
        center = {
          -- anchor = "CENTER",
          anchor = "S",
          anchor_padding = 0,
          prompt_position = "top",
          -- preview_height = 0.7, -- 60% of available lines
          -- height = 0.3, -- maximally available lines
          width = function(_, max_columns, _)
            return max_columns
          end,
          height = function(_, _, max_lines)
            return math.floor(0.3 * max_lines)
            -- return max_lines
          end,
        },
      },
      cache_picker = {
        num_pickers = 3,
      },
      history = {
        path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3", -- TODO: rewrite this with vimdata
        limit = 100,
      },
      file_ignore_patterns = {
        "%.a",
        "%.aac",
        "%.cache",
        "%.class",
        -- "%.gif",
        "%.git/",
        "%.mkv",
        "%.mp3",
        "%.mp4",
        "%.o",
        "%.out",
        "%.pdf",
        "%.wav",
        "%.zip",
        "./node%_modules/*",
        "mocks/*",
        "packer_compiled.lua",
      },
      vimgrep_arguments = {
        "rg",

        -- color codes not yet interpreted
        "--color=never",

        -- the following are required for telescope
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",

        "--hidden", -- include hidden files
        "--max-depth=99", -- max num dirs to descend
        "--smart-case", -- use smart case
      },
      preview = {
        mime_hook = function(filepath, bufnr, opts)
          local is_image = function(fp)
            local image_extensions = { "png", "jpg" } -- Supported image formats
            local split_path = vim.split(fp:lower(), ".", { plain = true })
            local extension = split_path[#split_path]
            return vim.tbl_contains(image_extensions, extension)
          end
          if is_image(filepath) then
            local term = vim.api.nvim_open_term(bufnr, {})
            local function send_output(_, data, _)
              for _, d in ipairs(data) do
                vim.api.nvim_chan_send(term, d .. "\r\n")
              end
            end
            vim.fn.jobstart({
              "catimg",
              filepath, -- Terminal image viewer command
            }, {
              on_stdout = send_output,
              stdout_buffered = true,
              pty = true,
            })
          else
            require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
          end
        end,
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      oldfiles = {
        cwd_only = true,
      },
      lsp_references = {
        show_line = false,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    opts.defaults.mappings = {
      i = {
        -- ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
      },
      n = {
        -- ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
      },
    }

    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("smart_history")
    -- telescope.load_extension("fzy_native")

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.opt_local.number = true
      end,
      desc = "Enable line numbers in telescope results",
    })
  end,
}
