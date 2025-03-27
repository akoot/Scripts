@echo off
title Syncing Time

REM erm, this doesn't really work
REM dual booters (me) stay losing

net stop w32time

w32tm /unregister

w32tm /register

net start w32time

w32tm /resync