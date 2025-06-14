return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = {
    'ToggleTerm',
    'TermExec',
    'ToggleTermToggleAll',
    'ToggleTermSendCurrentLine',
    'ToggleTermSendVisualLines',
    'ToggleTermSendVisualSelection',
  },
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle Floating Terminal' },
  },
  opts = {
    direction = 'float',
    float_opts = {
      border = 'curved',
      winblend = 3,
    },
    start_in_insert = true,
    shade_terminals = true,
    close_on_exit = true, -- close the terminal window when the process exits
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    shell = nil, -- change the default shell
    active = true,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Map <Esc><Esc> to close the terminal in terminal mode
    vim.api.nvim_create_autocmd('TermOpen', {
      callback = function()
        vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { buffer = 0, noremap = true, silent = true, desc = 'close terminal' })

        -- Always start in insert mode
        vim.cmd 'startinsert'
      end,
    })
  end,

}
