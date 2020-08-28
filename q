[1mdiff --git a/i3/config b/i3/config[m
[1mindex 4fc1d1d..4816893 100644[m
[1m--- a/i3/config[m
[1m+++ b/i3/config[m
[36m@@ -10,7 +10,7 @@[m
 [m
 # Font for window titles. Will also be used by the bar unless a different font[m
 # is used in the bar {} block below.[m
[31m-font pango:SF Pro Display 11[m
[32m+[m[32mfont pango:Inconsolata 11[m
 [m
 # This font is widely installed, provides lots of unicode glyphs, right-to-left[m
 # text rendering and scalability on retina/hidpi displays (thanks to pango).[m
[36m@@ -26,28 +26,33 @@[m [mfont pango:SF Pro Display 11[m
 # use these keys for focus, movement, and resize directions when reaching for[m
 # the arrows is not convenient[m
 set $mod Mod4[m
[31m-set $term termite[m
[32m+[m[32mset $term alacritty[m
 #set $mod Mod1[m
[31m-set $up l[m
[31m-set $down k[m
[31m-set $left j[m
[31m-set $right semicolon[m
[32m+[m[32mset $up k[m
[32m+[m[32mset $down j[m
[32m+[m[32mset $left h[m
[32m+[m[32mset $right l[m
 [m
 # use Mouse+$mod to drag floating windows to their wanted position[m
 floating_modifier $mod[m
 [m
 # start a terminal[m
 # bindsym $mod+Return exec i3-sensible-terminal[m
[31m-bindsym $mod+Return exec $term[m
[32m+[m[32mbindsym $mod+Return exec --no-startup-id $term[m
 [m
 # kill focused window[m
 bindsym $mod+Shift+q kill[m
 #[m
 # lock shortcut[m
[31m-bindsym Control+mod1+l exec i3lock -i ~/Pictures/devilpun.png[m
[32m+[m[32mbindsym Control+mod1+l exec --no-startup-id i3lock -c "#000000"[m
 [m
 # start dmenu (a program launcher)[m
[31m-bindsym $mod+d exec dmenu_run[m
[32m+[m[32m#bindsym $mod+d exec --no-startup-id "i3-dmenu-desktop"[m
[32m+[m[32m#bindsym $mod+Shift+d exec --no-startup-id "dmenu_run"[m
[32m+[m[32m#bindsym $mod+Shift+d exec "dmenu_run -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#F8F8F2' -fn 'monospace-10'"[m
[32m+[m[32mbindsym $mod+d exec --no-startup-id "rofi -combi-modi drun#run -show combi"[m
[32m+[m[32mbindsym $mod+p exec --no-startup-id "passmenu -i"[m
[32m+[m
 # There also is the (new) i3-dmenu-desktop which only displays applications[m
 # shipping a .desktop file. It is a wrapper around dmenu, so you need that[m
 # installed.[m
[36m@@ -78,7 +83,7 @@[m [mbindsym $mod+Shift+Up move up[m
 bindsym $mod+Shift+Right move right[m
 [m
 # split in horizontal orientation[m
[31m-bindsym $mod+h split h[m
[32m+[m[32mbindsym $mod+c split h[m
 [m
 # split in vertical orientation[m
 bindsym $mod+v split v[m
[36m@@ -112,8 +117,8 @@[m [mbindsym $mod+minus scratchpad show[m
 [m
 # Define names for default workspaces for which we configure key bindings later on.[m
 # We use variables to avoid repeating the names in multiple places.[m
[31m-set $ws1 "1: "[m
[31m-set $ws2 "2: "[m
[32m+[m[32mset $ws1 "1"[m
[32m+[m[32mset $ws2 "2"[m
 set $ws3 "3"[m
 set $ws4 "4"[m
 set $ws5 "5"[m
[36m@@ -121,7 +126,7 @@[m [mset $ws6 "6"[m
 set $ws7 "7"[m
 set $ws8 "8"[m
 set $ws9 "9"[m
[31m-set $ws10 "10: "[m
[32m+[m[32mset $ws10 "10"[m
 [m
 [m
 # switch to workspace[m
[36m@@ -153,7 +158,7 @@[m [mbindsym $mod+Shift+c reload[m
 # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)[m
 bindsym $mod+Shift+r restart[m
 # exit i3 (logs you out of your X session)[m
[31m-bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"[m
[32m+[m[32mbindsym $mod+Shift+e exec --no-startup-id "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"[m
 [m
 # resize window (you can also use the mouse for that)[m
 mode "resize" {[m
[36m@@ -205,51 +210,66 @@[m [mmode "move" {[m
 bindsym $mod+r mode "resize"[m
 [m
 # class                 border  bground text    indicator child_border[m
[31m-client.focused          #1291FF #285577 #FFFFFF #2E9EF4   #1E82E5[m
[31m-client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A[m
[31m-client.unfocused        #333333 #222222 #888888 #292D2E   #222222[m
[31m-client.urgent           #2F343A #900000 #FFFFFF #900000   #900000[m
[31m-client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C[m
[32m+[m[32mclient.focused          #6272A4 #6272A4 #F8F8F2 #6272A4   #6272A4[m
[32m+[m[32mclient.focused_inactive #44475A #44475A #F8F8F2 #44475A   #44475A[m
[32m+[m[32mclient.unfocused        #282A36 #282A36 #BFBFBF #282A36   #282A36[m
[32m+[m[32mclient.urgent           #44475A #FF5555 #F8F8F2 #FF5555   #FF5555[m
[32m+[m[32mclient.placeholder      #282A36 #282A36 #F8F8F2 #282A36   #282A36[m
 [m
[31m-client.background       #FFFFFF[m
[32m+[m[32mclient.background       #F8F8F2[m
 [m
 # Start i3bar to display a workspace bar (plus the system information i3status[m
 # finds out, if available)[m
[31m-bar {[m
[31m-        #status_command i3status[m
[31m-        font pango:mono[m
[31m-        status_command SCRIPT_DIR=~/.scripts i3blocks -c ~/.i3/i3blocks/config[m
[31m-	    position top[m
[31m-}[m
[32m+[m[32m#bar {[m
[32m+[m[32m#        #status_command i3status[m
[32m+[m[32m#        font pango:mono[m
[32m+[m[32m#        status_command SCRIPT_DIR=~/.scripts i3blocks -c ~/.i3/i3blocks/config[m
[32m+[m[32m#	    position top[m
[32m+[m[32m#}[m
[32m+[m
[32m+[m[32m# WE WANT POLYBAR[m
[32m+[m[32mexec_always --no-startup-id ~/.config/polybar/launch.sh[m
[32m+[m
[32m+[m[32m# Make some stuff floating[m
[32m+[m[32mfor_window [class="Arandr"] floating enable[m
[32m+[m[32mfor_window [class="Blueman-manager"] floating enable[m
 [m
 for_window [class="^.*"] border pixel 3[m
[31m-gaps inner 10[m
[31m-gaps outer 10[m
[32m+[m[32mgaps inner 2[m
[32m+[m[32mgaps outer 2[m
[32m+[m[32m#smart_borders on[m
 [m
 # wallpaper[m
[31m-exec_always feh --bg-scale /home/bassam/walls/neko.jpg[m
[32m+[m[32m#exec_always --no-startup-id hsetroot -solid "#333333"[m
[32m+[m[32mexec_always --no-startup-id feh --bg-scale ~/Pictures/raininginsanfrancisco.jpg[m
[32m+[m
[32m+[m[32mexec_always --no_startup-id caffeine[m
[32m+[m[32m#exec_always --no-startup-id nm-applet[m
[32m+[m[32mexec_always --no-startup-id blueman-applet[m
[32m+[m
 # Alsa controls[m
 # Pulse Audio controls[m
[31m-bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% && pkill -RTMIN+1 i3blocks #increase sound volume[m
[31m-bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% && pkill -RTMIN+1 i3blocks #decrease sound volume[m
[31m-bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle && pkill -RTMIN+1 i3blocks # mute sound[m
[32m+[m[32mbindsym XF86AudioRaiseVolume exec --no-startup-id amixer sset Master 5%+[m
[32m+[m[32mbindsym XF86AudioLowerVolume exec --no-startup-id amixer sset Master 5%-[m
[32m+[m[32mbindsym XF86AudioMute exec --no-startup-id amixer sset Master toggle[m
 [m
 # Screen brightness controls[m
[31m-bindsym XF86MonBrightnessUp exec light -A 10 && pkill -RTMIN+1 i3blocks # increase screen brightness[m
[31m-bindsym XF86MonBrightnessDown exec light -U 10 && pkill -RTMIN+1 i3blocks # decrease screen brightness[m
[32m+[m[32mbindsym XF86MonBrightnessUp exec --no-startup-id light -A 10[m
[32m+[m[32mbindsym XF86MonBrightnessDown exec --no-startup-id light -U 10[m
 [m
 # Lock on lid close[m
[31m-exec_always --no-startup-id xss-lock -- i3lock -i ~/walls/neko.jpg[m
[32m+[m[32mexec_always --no-startup-id xss-lock -- i3lock -c 000000[m
 [m
 # Compton[m
[31m-exec_always --no-startup-id compton -f[m
[32m+[m[32mexec_always --no-startup-id picom[m
 [m
 # Natural Scrolling[m
 exec_always --no-startup-id xinput set-prop 12 288 1[m
 [m
[31m-# switch workspaces[m
[31m-bindsym Mod1+Control+Left workspace prev [m
[31m-bindsym Mod1+Control+Right workspace next[m
[32m+[m[32m# Spotify Controls[m
[32m+[m[32mbindsym $mod+Shift+p exec --no-startup-id playerctl play-pause[m
[32m+[m[32mbindsym $mod+Shift+o exec --no-startup-id playerctl next[m
[32m+[m[32mbindsym $mod+Shift+i exec --no-startup-id playerctl previous[m
 [m
[31m-bindsym Mod1+Shift+Control+Left move container to workspace prev[m
[31m-bindsym Mod1+Shift+Control+Right move container to workspace next[m
[32m+[m[32m# NetworkManager dmenu[m
[32m+[m[32mbindsym $mod+n exec --no-startup-id networkmanager_dmenu[m
