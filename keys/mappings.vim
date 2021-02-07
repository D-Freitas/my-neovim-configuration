smap <Leader>t :TagbarToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>p :Prettier<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd FIleTYpe html inoremap < <><left>
autocmd FileType javascript inoremap a!fn () => {}<left>
autocmd FileType typescript inoremap a!fn () => {}<left>
autocmd FileType javascript inoremap s!fn function() {}<left>
autocmd FileType typescript inoremap s!fn function() {}<left>
autocmd FileType cs inoremap c!tr using System;<S-Enter>using System.Collections.Generic;<S-Enter>using System.Linq;<S-Enter>using System.Threading.Tasks;<S-Enter>using Microsoft.AspNetCore.Mvc;<S-Enter>using Microsoft.Extensions.Logging;<S-Enter><S-Enter>namespace NameSpaceName.Controllers<S-Enter>{<S-Enter>[ApiController]<S-Enter>[Route("[controller]")]<S-Enter>public class NameController : ControllerBase<S-Enter>{<S-Enter><S-Enter>}<S-Enter>}
autocmd FileType cs inoremap c!cs using System;<S-Enter>using System.Collections.Generic;<S-Enter>using System.Linq;<S-Enter>using System.Text;<S-Enter>using System.Threading.Tasks;<S-Enter><S-Enter>namespace ConsoleApp<S-Enter>{<S-Enter>class Program<S-Enter>{<S-Enter>static void Main(string[] args)<S-Enter>{<S-Enter><S-Enter>}<S-Enter>}<S-Enter>}
autocmd FileType cs nmap <Leader>d :OmniSharpRename<CR>
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
nnoremap <silent> <Leader>a :AskVisualStudioCode<CR>
nnoremap <silent> <C-z> :ToggleTerminal<Enter>
nnoremap <silent>   <F7>    :FloatermNew<CR>
tnoremap <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap <silent>   <F8>    :FloatermPrev<CR>
tnoremap <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent>   <F9>    :FloatermNext<CR>
tnoremap <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap <silent>   <F12>   :FloatermToggle<CR>
tnoremap <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
" nnoremap <silent> <Leader>s :FloatermNew --height=0.3 --width=1.0 --wintype=float --name=floaterm1 --position=bottomleft<CR>

inoremap ` ``<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap r!c const ComponentName = () => {<S-Enter>return ();<S-Enter>}<S-Enter><S-Enter>export default ComponentName;


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
