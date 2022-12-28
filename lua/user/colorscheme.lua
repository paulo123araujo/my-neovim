vim.cmd [[
try
  colorscheme sonokai
  let g:sonokai_style = 'maia'
  let g:sonokai_better_performance = 1
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
