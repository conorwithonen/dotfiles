local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leaders (set these before Lazy loads plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================
-- Core / "Workspace" intent
-- =========================

-- Zed: "space f f" -> file_finder::Toggle
-- Neovim: Telescope find files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", vim.tbl_extend("force", opts, { desc = "Find files" }))

-- Zed: "ctrl-r" -> OpenRecent
-- Neovim: Telescope oldfiles (recent files)
map("n", "<C-r>", "<cmd>Telescope oldfiles<cr>", vim.tbl_extend("force", opts, { desc = "Recent files" }))

-- Zed: "++" -> Save
-- Neovim: "++" in normal mode to :write
map("n", "++", "<cmd>write<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))

-- Zed: "space c" -> CloseActiveItem
-- Neovim: close buffer (doesn't kill window)
map("n", "<leader>c", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Close buffer" }))

-- =========================
-- Editor / LSP equivalents
-- =========================

-- Zed: shift-k -> Hover
-- Neovim LSP hover
map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))

-- Zed: space l f -> Format
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, vim.tbl_extend("force", opts, { desc = "Format" }))

-- Zed: space d -> Diagnostics::Deploy (roughly "open diagnostics")
-- Neovim: open floating diagnostic under cursor
map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Diagnostics (float)" }))

-- =========================
-- Comment toggles
-- =========================
-- Zed: "space /" and "g b" -> ToggleComments
-- In Neovim this is usually provided by a plugin (Comment.nvim, mini.comment, etc.)
-- If you add Comment.nvim, these will work.
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, vim.tbl_extend("force", opts, { desc = "Toggle comment" }))

map("n", "gb", function()
  require("Comment.api").toggle.linewise.current()
end, vim.tbl_extend("force", opts, { desc = "Toggle comment" }))

map("v", "<leader>/", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, vim.tbl_extend("force", opts, { desc = "Toggle comment (visual)" }))

map("v", "gb", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, vim.tbl_extend("force", opts, { desc = "Toggle comment (visual)" }))

-- =========================
-- Visual mode line movement
-- =========================
-- Zed: shift-j / shift-k move line down/up (visual)
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- =========================
-- Tab / buffer navigation
-- =========================
-- Zed: tab / shift-tab previous/next item
-- In Neovim, Tab is often used for completion; if you don't rely on that, this is fine.
map("n", "<Tab>", "<cmd>bnext<cr>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
map("n", "<S-Tab>", "<cmd>bprevious<cr>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))

-- =========================
-- Pane navigation (Zed: cmd-k h/j/k/l)
-- =========================
-- Neovim window navigation (macOS "cmd" depends on terminal support)
-- If your terminal sends <D-h> etc, these are great. Otherwise use <C-w>h/j/k/l or leader variants.
map("n", "<D-k><D-h>", "<C-w>h", opts)
map("n", "<D-k><D-j>", "<C-w>j", opts)
map("n", "<D-k><D-k>", "<C-w>k", opts)
map("n", "<D-k><D-l>", "<C-w>l", opts)

-- Moving windows around: Neovim doesn't have a perfect 1:1; this is a common approach:
-- swap windows by moving current window into another position
map("n", "<D-k><D-S-h>", "<C-w>H", opts) -- move to far left
map("n", "<D-k><D-S-j>", "<C-w>J", opts) -- move to bottom
map("n", "<D-k><D-S-k>", "<C-w>K", opts) -- move to top
map("n", "<D-k><D-S-l>", "<C-w>L", opts) -- move to far right

