let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'M',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'U',
      \ 'Renamed'   :'R',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'D',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

let s:palette = edge#get_palette(g:edge_style)
function! DeviconsColors(config, my_colors)
  let colors = keys(a:config)
  augroup devicons_colors
    autocmd!
    for color in colors
      " if color == 'normal'
      "   exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
      "         \ 'highlight devicons_'.color.' guifg='.a:my_colors.dark[0].' ctermfg='.a:my_colors.dark[1].' | '.
      "         \ 'else | '.
      "         \ 'highlight devicons_'.color.' guifg='.a:my_colors.light[0].' ctermfg='.a:my_colors.light[1].' | '.
      "         \ 'endif'
      " elseif color == 'emphasize'
      "   exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
      "         \ 'highlight devicons_'.color.' guifg='.a:my_colors.light[0].' ctermfg='.a:my_colors.light[1].' | '.
      "         \ 'else | '.
      "         \ 'highlight devicons_'.color.' guifg='.a:my_colors.dark[0].' ctermfg='.a:my_colors.dark[1].' | '.
      "         \ 'endif'
      " else
        exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.a:my_colors[color][0].' ctermfg='.a:my_colors[color][1]
      " endif
      exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
    endfor
  augroup END
endfunction
let g:devicons_colors = {
      \'normal': ['', '', ''],
      \'emphasize': ['', '', '', '', '', '', '', '', '', '', '', ''],
      \'yellow': ['', '', ''],
      \'orange': ['', '', '', 'λ', '', ''],
      \'red': ['', '', '', '', '', '', '', '', ''],
      \'magenta': [''],
      \'violet': ['', '', '', ''],
      \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \'cyan': ['', '', '', ''],
      \'green': ['', '', '', '']
      \}
let g:colors_for_devicons = {
      \'emphasize': ["#8b90b0", "7", "LightGrey"],
      \'normal': ["#696d8a", "14", "Grey"],
      \'yellow': s:palette.yellow,
      \'orange': ['#cb4b16', '9', 'Orange'],
      \'red': s:palette.red,
      \'magenta': s:palette.purple,
      \'violet': ['#6c71c4', '13', 'DarkMagenta'],
      \'blue': s:palette.blue,
      \'cyan': s:palette.cyan,
      \'green': s:palette.green
      \}
call DeviconsColors(g:devicons_colors, g:colors_for_devicons)
