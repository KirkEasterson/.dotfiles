-- TODO: replace rust-tools with a rust-analyzer implementation that uses
--		my common `on_attach` function
-- require('kirk.lsp.on_attach')

-- First implementation
-- local nvim_lsp = require'lspconfig'

-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

-- nvim_lsp.rust_analyzer.setup({
--     on_attach=on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "self",
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })

-- Second implementation
-- require'lspconfig'.rust_analyzer.setup({
-- 	on_attach=on_attach,
-- })

require('rust-tools').setup({})
