
if isdirectory('C:\wx-3.1.5\include')
  set path+=C:\\wx-3.1.5\\include
endif

if filereadable('C:\wx-3.1.5\include\cscope.out')
  set nocsverb
  cs add C:\\wx-3.1.5\\include\\cscope.out
  set csverb
endif

if filereadable('C:\wx-3.1.5\include\tags')
  set tags+=C:\\wx-3.1.5\\include\\tags
endif

