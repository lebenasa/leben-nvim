require('plugins')

-- Rarely used config:
require('cmp-conf')
require('treesitter-conf')
require('nvim-tree-conf')
require('telescope-conf')

-- Frequently used config:
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}
