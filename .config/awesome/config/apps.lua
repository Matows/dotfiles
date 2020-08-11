-- Command to start once at startup
return {
    'light-locker',
    'xautolock -detectsleep \z
    -notify 60 -notifier "xset dpms force off" \z
    -time 10 -locker "dm-tool lock" \z
    -killtime 20 -killer "systemctl suspend-then-hibernate"',
    'redshift -l 45.566267:5.920364',
    'picom'
}
