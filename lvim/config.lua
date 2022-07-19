-- Additional Plugins
lvim.plugins = {
    { "ray-x/lsp_signature.nvim" },
}

require "lsp_signature".on_attach()

vim.cmd('source ~/.vimrc')
