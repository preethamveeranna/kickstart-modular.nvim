-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = 'modern',
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      triggers = {
        { '<leader>', mode = { 'n', 'v' } },
      },
      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>w', '<cmd>w!<CR>', mode = { 'n', 'v' } },
        { '<leader>q', '<cmd>confirm q<CR>', mode = { 'n', 'v' }, desc = 'Quit window' },
        { '<leader>c', '<cmd>BufferKill<CR>', mode = { 'n', 'v' }, desc = 'Kill current buffer' },
        { '<leader>e', '<cmd>Neotree toggle<CR>', mode = { 'n', 'v' }, desc = 'toggle neo-tree' },
        -- b = {
        --   name = 'Buffers',
        --   j = { '<cmd>BufferLinePick<cr>', 'Jump' },
        --   f = { '<cmd>Telescope buffers previewer=false<cr>', 'Find' },
        --   b = { '<cmd>BufferLineCyclePrev<cr>', 'Previous' },
        --   n = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
        --   W = { '<cmd>noautocmd w<cr>', 'Save without formatting (noautocmd)' },
        --   -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
        --   e = {
        --     '<cmd>BufferLinePickClose<cr>',
        --     'Pick which buffer to close',
        --   },
        --   h = { '<cmd>BufferLineCloseLeft<cr>', 'Close all to the left' },
        --   l = {
        --     '<cmd>BufferLineCloseRight<cr>',
        --     'Close all to the right',
        --   },
        --   D = {
        --     '<cmd>BufferLineSortByDirectory<cr>',
        --     'Sort by directory',
        --   },
        --   L = {
        --     '<cmd>BufferLineSortByExtension<cr>',
        --     'Sort by language',
        --   },
        -- },
        -- d = {
        --   name = 'Debug',
        --   t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Toggle Breakpoint' },
        --   b = { "<cmd>lua require'dap'.step_back()<cr>", 'Step Back' },
        --   c = { "<cmd>lua require'dap'.continue()<cr>", 'Continue' },
        --   C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", 'Run To Cursor' },
        --   d = { "<cmd>lua require'dap'.disconnect()<cr>", 'Disconnect' },
        --   g = { "<cmd>lua require'dap'.session()<cr>", 'Get Session' },
        --   i = { "<cmd>lua require'dap'.step_into()<cr>", 'Step Into' },
        --   o = { "<cmd>lua require'dap'.step_over()<cr>", 'Step Over' },
        --   u = { "<cmd>lua require'dap'.step_out()<cr>", 'Step Out' },
        --   p = { "<cmd>lua require'dap'.pause()<cr>", 'Pause' },
        --   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Toggle Repl' },
        --   s = { "<cmd>lua require'dap'.continue()<cr>", 'Start' },
        --   q = { "<cmd>lua require'dap'.close()<cr>", 'Quit' },
        --   U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", 'Toggle UI' },
        -- },
        -- g = {
        --   name = 'Git',
        --   g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", 'Lazygit' },
        --   j = { "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", 'Next Hunk' },
        --   k = { "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", 'Prev Hunk' },
        --   l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
        --   L = { "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", 'Blame Line (full)' },
        --   p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
        --   r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
        --   R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
        --   s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
        --   u = {
        --     "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        --     'Undo Stage Hunk',
        --   },
        --   o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
        --   b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        --   c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
        --   C = {
        --     '<cmd>Telescope git_bcommits<cr>',
        --     'Checkout commit(for current file)',
        --   },
        --   d = {
        --     '<cmd>Gitsigns diffthis HEAD<cr>',
        --     'Git Diff',
        --   },
        -- },
        -- l = {
        --   name = 'LSP',
        --   a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
        --   d = { '<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>', 'Buffer Diagnostics' },
        --   w = { '<cmd>Telescope diagnostics<cr>', 'Diagnostics' },
        --   f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", 'Format' },
        --   i = { '<cmd>LspInfo<cr>', 'Info' },
        --   I = { '<cmd>Mason<cr>', 'Mason Info' },
        --   j = {
        --     '<cmd>lua vim.diagnostic.goto_next()<cr>',
        --     'Next Diagnostic',
        --   },
        --   k = {
        --     '<cmd>lua vim.diagnostic.goto_prev()<cr>',
        --     'Prev Diagnostic',
        --   },
        --   l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
        --   q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Quickfix' },
        --   r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
        --   s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
        --   S = {
        --     '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
        --     'Workspace Symbols',
        --   },
        --   e = { '<cmd>Telescope quickfix<cr>', 'Telescope Quickfix' },
        -- },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
