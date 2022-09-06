" Select range based on AST
nmap <silent><Leader>r <Plug>(coc-range-select)
xmap <silent><Leader>r <Plug>(coc-range-select)

" Navigations
nmap <Leader>o <Plug>(coc-definition)
nmap <Leader>O <Plug>(coc-type-definition)
nmap <Leader>I <Plug>(coc-implementation)
nmap <Leader>R <Plug>(coc-references)

" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

" Use <CR> to validate completion (allows auto import on completion)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

" Hover
nmap K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Text objects for functions and classes (uses document symbol provider)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
autocmd CursorHold * silent call CocActionAsync('highlight')
