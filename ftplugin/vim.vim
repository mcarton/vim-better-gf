function! s:BetterGFVundle()

python << EOF
import re

def github(pattern, url):
    match = re.search("Plugin[ \t]*'{}'".format(pattern), vim.current.line)

    if match:
        vim.command('silent !xdg-open "{}"'.format(url).format(match.group(1)))
        return True

github("([^'/]*)", 'https://github.com/vim-scripts/{}') or \
github("([^']*/[^']*)", 'https://github.com/{}')

EOF

endfunction

nnoremap <silent> <Plug>BetterGFVundle :<C-U>call <SID>BetterGFVundle()<CR><C-L>

if !exists("g:bettergf_no_mappings") || ! g:bettergf_no_mappings
    nmap <buffer> gf <Plug>BetterGFVundle
endif
