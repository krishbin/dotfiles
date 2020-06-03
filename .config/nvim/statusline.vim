function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=\ %y
set statusline+=\ %m

set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ %c
set statusline+=\ %p%%
set statusline+=\ %l:%L
set statusline+=\
