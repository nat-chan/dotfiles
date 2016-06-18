let s:save_cpo = &cpo
set cpo&vim

function! folcom#expr(lnum)
  let line = getline(a:lnum)
  if line =~ '^\s*\("\|//\|#\)\s\+'
    return 1
  elseif line =~ '^\s*\("\|//\|#\)$'
    return 1
  elseif line =~ '^\s*/\*'
    return 1
  elseif line =~ '^\s*\*'
    return '='
  elseif line =~ '^\s*\*/$'
    return 1
  else
    return 0
  end

endfunction

let &cpo = s:save_cpo
unset s:save_cpo
