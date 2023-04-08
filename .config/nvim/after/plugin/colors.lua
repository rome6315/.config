function Colors(color)
	color = "everforest" --choose colorscheme 
	vim.cmd.colorscheme(color)

	-- uncomment for transparecny: 
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

end


Colors() -- call function




