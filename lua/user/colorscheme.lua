vim.cmd [[
try
  colorscheme zephyr
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
