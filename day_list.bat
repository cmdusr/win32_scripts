@echo off

set str=%date%
set str=%str:/=-%
call nvim %str%.txt
