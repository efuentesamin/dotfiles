return {
	"efuentesamin/nvim-winpick",
    keys = {
        { "<leader>wp", "<cmd>lua require('winpick').show_picker()<cr>", desc = "Pick Window" },
    },
	config = function()
		require("winpick")
	end,
}