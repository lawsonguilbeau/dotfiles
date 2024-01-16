local bufferline = require("bufferline")
bufferline.setup({
	options = {
		seperator_style = "slant",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ""
				end

				return ""
			end,
			groups = {
				options = {
					toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
				},
				items = {
					{
						name = "Tests", -- Mandatory
						highlight = { underline = true, sp = "blue" }, -- Optional
						priority = 2, -- determines where it will appear relative to other groups (Optional)
						icon = "", -- Optional
						matcher = function(buf) -- Mandatory
							return buf.filename:match("%_test") or buf.filename:match("%_spec")
						end,
					},
					{
						name = "Docs",
						highlight = { undercurl = true, sp = "green" },
						auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
						matcher = function(buf)
							return buf.filename:match("%.md") or buf.filename:match("%.txt")
						end,
						separator = { -- Optional
							style = require("bufferline.groups").separator.tab,
						},
					},
				},
			},
		},
	},
})
