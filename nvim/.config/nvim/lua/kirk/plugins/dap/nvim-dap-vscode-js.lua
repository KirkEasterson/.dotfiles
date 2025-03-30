return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  opts = {
    debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
    adapters = {
      "pwa-node",
      "pwa-chrome",
      "pwa-msedge",
      "node-terminal",
      "pwa-extensionHost",
    },
  },
  config = function(_, opts)
    require("dap-vscode-js").setup(opts)
    local dap = require("dap")

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      name = "Launch current file",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/src/dapDebugServer.ts",
          "${port}",
        },
      },
    }

    dap.adapters["node"] = function(cb, config)
      if config.type == "node" then
        config.type = "pwa-node"
      end
      local nativeAdapter = dap.adapters["pwa-node"]
      if type(nativeAdapter) == "function" then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    local vscode = require("dap.ext.vscode")
    vscode.type_to_filetypes["node"] = js_filetypes
    vscode.type_to_filetypes["pwa-node"] = js_filetypes

    for _, language in ipairs(js_filetypes) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}
