-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree focus<CR>', desc = 'NeoTree focus', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
      follow_current_file = {
        enabled = true,         -- This follows the active file
        leave_dirs_open = false, -- closes previously expanded directories to avoid clutter
      },
    },
  },
}
