@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
doskey vi=nvim $*
doskey vim=nvim $*
doskey ls=dir $*
doskey clear=cls $*
