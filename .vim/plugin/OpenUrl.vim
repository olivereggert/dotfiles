function! OpenUrlUnderCursor()
    let path="/Applications/Google Chrome.app"
    execute "normal BvEy"
    let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
    if url != ""
        silent exec "!open '".url."'" | redraw!
		echo "opened ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap <leader>o :call OpenUrlUnderCursor()<CR>
