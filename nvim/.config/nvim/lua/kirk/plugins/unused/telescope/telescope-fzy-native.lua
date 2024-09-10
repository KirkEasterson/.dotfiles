return {
  "nvim-telescope/telescope-fzy-native.nvim",
  enabled = false,
  opts = {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzy_native")
  end,
}
