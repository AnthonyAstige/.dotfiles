" Add this to somewhere like ~./.vim/bundle/nerdtree/nerdtree_plugin/mymapping.vim
" :so ~/.vim/nerdtree-mymapping.vim

function! OpenInNewTab(node)
	call a:node.activate({'where': 't'})
endfunction
call NERDTreeAddKeyMap({
  \ 'key': '<c-t>',
  \ 'scope': "Node",
  \ 'callback': 'OpenInNewTab',
  \ 'quickhelpText': 'Open in new tab'
\})

function! OpenInNewSplitVertical(node)
	call a:node.activate({'where': 'v'})
endfunction
call NERDTreeAddKeyMap({
  \ 'key': '<c-x>',
  \ 'scope': "Node",
  \ 'callback': 'OpenInNewSplitVertical',
  \ 'quickhelpText': 'Open in vertical window split'
\})

function! OpenInNewSplitHorizontal(node)
	call a:node.activate({'where': 'h'})
endfunction
call NERDTreeAddKeyMap({
  \ 'key': '<c-s>',
  \ 'scope': "Node",
  \ 'callback': 'OpenInNewSplitHorizontal',
  \ 'quickhelpText': 'Open in vertical window split'
\})

function! CloseNerdTree()
	:NERDTreeClose
endfunction
call NERDTreeAddKeyMap({
  \ 'key': '<esc>',
  \ 'callback': 'CloseNerdTree',
  \ 'quickhelpText': 'Close nerd tree'
\})
