vim.g.clang_complete_macros = 1
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "none", source = "never" },
})
vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})
require("config.lazy")
require("config.options")
