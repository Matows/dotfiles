local awful = require("awful")
local naughty = require("naughty")

timers = { 5,10 }
screenshot_dir = "$(xdg-user-dir PICTURES)/screenshot/"
screenshot = screenshot_dir .. "$(date +%F_%T).png"
awful.spawn.with_shell("mkdir " .. screenshot_dir .. " 2> /dev/null")

function scrot_full()
    scrot("scrot " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of entire screen")
end

function scrot_selection()
    scrot("sleep 0.5 && scrot -s " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of selection")
end

function scrot_window()
    scrot("scrot -u " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of focused window")    
end

function scrot_delay()
    items={}
    for key, value in ipairs(timers)  do
        items[#items+1]={tostring(value) , "scrot -d ".. value.." " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'","Take a screenshot of delay" }
    end
    awful.menu.new(
    {
        items = items
    }
    ):show({keygrabber= true})
    scrot_callback()
end

function scrot(cmd , callback, args)
    awful.util.spawn_with_shell(cmd)
    sleep(1)
    callback(args)
end

function scrot_callback(text)
    naughty.notify({
        text = text,
        timeout = 2
    })
end

function sleep(n)
  os.execute("sleep " .. tonumber(n))
end
