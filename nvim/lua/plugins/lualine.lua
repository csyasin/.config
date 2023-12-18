return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Remove the ugly powerline arrow, i don't like it
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }
    -- I don't need the time, cause tmux will always show it
    opts.sections.lualine_z = {}
  end,
}
