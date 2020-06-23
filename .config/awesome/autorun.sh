#!/usr/bin/env bash

function run {
    if ! pgrep -f $1 ;
    then
        $@ &
    fi
}

run xautolock -detectsleep -notify 5 -notifier "xset dpms force off" -time 20 -locker "slock" -killtime 20 -killer "systemctl suspend"
run redshift -l 45.566267:5.920364
run picom
