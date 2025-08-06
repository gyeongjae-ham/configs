return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })

		local icons = require("config.icons")

		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
			sync_root_with_cwd = true,
			view = {
				relativenumber = true,
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				root_folder_label = ":t",
				indent_width = 2,
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						none = " ",
					},
				},
				icons = {
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					glyphs = {
						default = icons.ui.Text,
						symlink = icons.ui.FileSymlink,
						bookmark = icons.ui.BookMark,
						folder = {
							arrow_closed = icons.ui.ChevronRight,
							arrow_open = icons.ui.ChevronShortDown,
							default = icons.ui.Folder,
							open = icons.ui.FolderOpen,
							empty = icons.ui.EmptyFolder,
							empty_open = icons.ui.EmptyFolderOpen,
							symlink = icons.ui.FolderSymlink,
							symlink_open = icons.ui.FolderOpen,
						},
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
			},
			update_focused_file = {
				enable = true,
				debounce_delay = 15,
				update_root = true,
				ignore_list = {},
			},

			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = icons.diagnostics.BoldHint,
					info = icons.diagnostics.BoldInformation,
					warning = icons.diagnostics.BoldWarning,
					error = icons.diagnostics.BoldError,
				},
			},
		})

		local function resize_nvim_tree_by_ratio(ratio)
			local total_width = vim.o.columns
			local target_width = math.floor(total_width * ratio)

			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
				if string.find(bufname, "NvimTree_") then
					vim.api.nvim_win_call(win, function()
						vim.cmd("vertical resize " .. target_width)
					end)
					break
				end
			end
		end

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "NvimTree_*",
			callback = function()
				vim.defer_fn(function()
					resize_nvim_tree_by_ratio(0.25)
				end, 50)
			end,
		})

		vim.api.nvim_create_autocmd("VimResized", {
			callback = function()
				resize_nvim_tree_by_ratio(0.25)
			end,
		})

		-- 여기에 추가
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePreviewerLoaded",
			callback = function()
				vim.defer_fn(function()
					resize_nvim_tree_by_ratio(0.25)
				end, 50)
			end,
		})
	end,
}

