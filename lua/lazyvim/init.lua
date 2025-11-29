local M = {}

M.opts = {}

function M.setup(opts)
  local LazyVim = require("lazy.util")

	M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})

  LazyVim.try(function()
    if type(M.opts.colorscheme) == "function" then
      M.opts.colorscheme()
    else
      vim.cmd.colorscheme(M.opts.colorscheme)
    end
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      LazyVim.error(msg)
      vim.cmd.colorscheme("habamax")
    end,
  })
end

return M
