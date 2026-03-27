local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- ─── Leader ──────────────────────────────────────────────────────────────────
vim.g.mapleader = " "

-- ─── File Navigation ─────────────────────────────────────────────────────────
map("n", "-", "<cmd>Oil<CR>", "Open oil file explorer")
map("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", "Find files")
map("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", "Live grep")
map("n", "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<CR>", "Recent files")
map("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", "Buffers")
map("n", "<leader>fh", "<cmd>lua require('fzf-lua').helptags()<CR>", "Help tags")
map("n", "<leader>fs", "<cmd>lua require('fzf-lua').grep_cword()<CR>", "Search word")

-- ─── Harpoon ─────────────────────────────────────────────────────────────────
map("n", "<leader>a", function() require("harpoon"):list():add() end, "Harpoon add file")
map("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Harpoon menu")
map("n", "<leader>1", function() require("harpoon"):list():select(1) end, "Harpoon file 1")
map("n", "<leader>2", function() require("harpoon"):list():select(2) end, "Harpoon file 2")
map("n", "<leader>3", function() require("harpoon"):list():select(3) end, "Harpoon file 3")
map("n", "<leader>4", function() require("harpoon"):list():select(4) end, "Harpoon file 4")

-- ─── Buffers ─────────────────────────────────────────────────────────────────
map("n", "<Tab>", "<cmd>bnext<CR>", "Next buffer")
map("n", "<S-Tab>", "<cmd>bprev<CR>", "Previous buffer")
map("n", "<leader>bb", "<cmd>e #<CR>", "Toggle previous buffer")
map("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete buffer")

-- ─── Windows ─────────────────────────────────────────────────────────────────
map("n", "<leader>wv", "<cmd>vsplit<CR>", "Vertical split")
map("n", "<leader>ws", "<cmd>split<CR>", "Horizontal split")
map("n", "<leader>wq", "<cmd>close<CR>", "Close window")
map("n", "<leader>we", "<C-w>=", "Equal window sizes")
-- Resize
map("n", "<leader>w+", "<cmd>resize +5<CR>", "Increase height")
map("n", "<leader>w-", "<cmd>resize -5<CR>", "Decrease height")
map("n", "<leader>w>", "<cmd>vertical resize +5<CR>", "Increase width")
map("n", "<leader>w<", "<cmd>vertical resize -5<CR>", "Decrease width")

-- ─── Git ─────────────────────────────────────────────────────────────────────
map("n", "<leader>gg", "<cmd>Neogit<CR>", "Neogit")
map("n", "<leader>gd", "<cmd>lua require('fzf-lua').git_diff()<CR>", "Git diff")

-- ─── LSP (set in lsp.lua on_attach, but defaults here) ───────────────────────
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
map("n", "<leader>xq", vim.diagnostic.setloclist, "Quickfix diagnostics")
map("n", "<leader>xx", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", "Document diagnostics")

-- ─── Formatting ──────────────────────────────────────────────────────────────
map({ "n", "v" }, "<leader>fo", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, "Format buffer")

-- ─── Quickfix / Location list ────────────────────────────────────────────────
map("n", "]q", "<cmd>cnext<CR>zz", "Next quickfix")
map("n", "[q", "<cmd>cprev<CR>zz", "Prev quickfix")
map("n", "]l", "<cmd>lnext<CR>zz", "Next location")
map("n", "[l", "<cmd>lprev<CR>zz", "Prev location")

-- ─── Better defaults ─────────────────────────────────────────────────────────
-- Keep cursor centered when scrolling
map("n", "<C-u>", "<C-u>zz", "Scroll up")
map("n", "<C-d>", "<C-d>zz", "Scroll down")
-- Keep cursor centered when searching
map("n", "n", "nzzzv", "Next search result")
map("n", "N", "Nzzzv", "Prev search result")
-- Better yank
map("n", "Y", "y$", "Yank to end of line")
-- Don't lose selection when indenting
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")
-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
-- Clear search highlights
map("n", "<CR>", "<cmd>noh<CR>", "Clear highlights")
-- Paste without losing register
map("v", "p", '"_dP', "Paste without yanking")
-- Display line navigation
map("n", "j", "gj", "Move down (display)")
map("n", "k", "gk", "Move up (display)")
-- Start/end of line
map({ "n", "v" }, "H", "g^", "Start of display line")
map({ "n", "v" }, "L", "g$", "End of display line")
-- Disable Q (ex mode)
map("n", "Q", "<nop>", "Disabled")

-- ─── Comments (mini.comment) ─────────────────────────────────────────────────
map("n", "<C-/>", "gcc", "Toggle comment")
map("v", "<C-/>", "gc", "Toggle comment")

-- ─── Misc ────────────────────────────────────────────────────────────────────
map("n", "<C-z>", "<nop>", "Disable suspend")
map("n", "<leader>q", "<cmd>qa<CR>", "Quit all")
