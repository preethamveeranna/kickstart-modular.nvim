-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc><Esc>', '<cmd>Floaterminal<CR>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Move focus to the previous buffer' })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Move focus to the next buffer' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Resize windows with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Move window upper' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Move window down' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Move window left' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Move window right' })

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- QuickFix
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = '' })
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = '' })
-- vim.keymap.set('n', '<C-q>', ':call QuickFixToggle()<CR>', { desc = 'check quickfix' })

-- dont copy edits to buffer
vim.keymap.set('n', 'c', '"_c', { desc = '' })
vim.keymap.set('n', 'x', '"_x', { desc = '' })
vim.keymap.set('n', 'dd', '"_dd', { desc = '' })
vim.keymap.set('v', 'p', '"_dP', { desc = '' })

local mode_adapters = {
  insert_mode = 'i',
  normal_mode = 'n',
  term_mode = 't',
  visual_mode = 'v',
  visual_block_mode = 'x',
  command_mode = 'c',
  operator_pending_mode = 'o',
}

vim.keymap.set('i', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
local defaults = {
  insert_mode = {
    -- Move current line / block with Alt-j/k ala vscode.
    ['<A-j>'] = '<Esc>:m .+1<CR>==gi',
    -- Move current line / block with Alt-j/k ala vscode.
    ['<A-k>'] = '<Esc>:m .-2<CR>==gi',
    -- navigation
    ['<A-Up>'] = '<C-\\><C-N><C-w>k',
    ['<A-Down>'] = '<C-\\><C-N><C-w>j',
    ['<A-Left>'] = '<C-\\><C-N><C-w>h',
    ['<A-Right>'] = '<C-\\><C-N><C-w>l',
  },

  term_mode = {
    -- Terminal window navigation
    ['<C-h>'] = '<C-\\><C-N><C-w>h',
    ['<C-j>'] = '<C-\\><C-N><C-w>j',
    ['<C-k>'] = '<C-\\><C-N><C-w>k',
    ['<C-l>'] = '<C-\\><C-N><C-w>l',
  },

  visual_mode = {
    -- Better indenting
    ['<'] = '<gv',
    ['>'] = '>gv',

    -- ["p"] = '"0p',
    -- ["P"] = '"0P',
  },

  visual_block_mode = {
    -- Move current line / block with Alt-j/k ala vscode.
    ['<A-j>'] = ":m '>+1<CR>gv-gv",
    ['<A-k>'] = ":m '<-2<CR>gv-gv",
  },

  command_mode = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ['<C-j>'] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ['<C-k>'] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  },
}
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
