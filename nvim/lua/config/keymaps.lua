local builtin = require("telescope.builtin")

--Telescope
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find find_files" })
vim.keymap.set("n", "<C-e>", builtin.live_grep, { desc = "Telescope find find_files" })

-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})

-- Navigatio
