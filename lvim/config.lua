-- Additional Plugins
lvim.plugins = {
    { "ray-x/lsp_signature.nvim" },
}

require "lsp_signature".on_attach()

vim.cmd('source ~/.vimrc')

-- override vimrc settings
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true })
