#!/bin/bash

~/.my/autostart.sh
export XMODIFIERS="@im=nabi"

LANG='ko_KR.UTF-8'
SUPPORTED='ko_KR.UTF-8:ko_KR:ko'
LC_ALL='ko_KR.UTF-8'
LANGUAGE='ko_KR.UTF-8'
export LANG SUPPORTED LANGUAGE LC_ALL

exec awesome
