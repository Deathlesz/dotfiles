return {
	"saecki/crates.nvim",
	event = "BufEnter Cargo.toml",
	tag = "stable",
	opts = {
		completion = {
			cmp = {
				enabled = true, -- enable completion source
			},
		},
	},
}
