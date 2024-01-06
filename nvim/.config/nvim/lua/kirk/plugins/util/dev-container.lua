return {
  "esensar/nvim-dev-container",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "DevcontainerAttach",
    "DevcontainerEditNearestConfig",
    "DevcontainerExec",
    "DevcontainerLogs",
    "DevcontainerRemoveAll",
    "DevcontainerStart",
    "DevcontainerStop",
    "DevcontainerStopAll",
  },
  opts = {
    container_runtime = "docker",
    backup_runtime = "podman",
    compose_command = "docker-compose",
    backup_compose_command = "podman-compose",
    attach_mounts = {
      neovim_config = {
        enabled = true,
        -- options = { "readonly" },
      },
      neovim_data = {
        enabled = true,
      },
      neovim_state = {
        enabled = true,
      },
    },
    terminal_handler = function(command)
      print("---------------")
      print(command)
    end,
  },
}
