-- Command to start once at startup
return {
    'xautolock -detectsleep -notify 5 -notifier "xset dpms force off" -time 20 -locker "slock" -killtime 20 -killer "systemctl suspend-then-hibernate"',
    'redshift -l 45.566267:5.920364',
    'picom'
}
