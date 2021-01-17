@echo off

set str=%date%
set str=%str:/=-%
set str=%userprofile%/dropbox/lists/day/%str%

nvim %str%.txt
