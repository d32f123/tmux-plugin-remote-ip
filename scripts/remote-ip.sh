#!/usr/bin/env zsh

local i="$(tmux show-option -gvq @remote-ip-iter)"
local curr_ip="$(tmux show-option -gvq @remote-ip)"
(( i = ${i:=0} + 1 ))
tmux set-option -gq @remote-ip-iter "$i"
(( i % 60 )) && [ -n "$curr_ip" ] && echo "$curr_ip" && exit


local ip="$(curl ifconfig.me 2>/dev/null || echo "No IP")"
tmux set-option -gq @remote-ip "$ip"
echo "$ip"
