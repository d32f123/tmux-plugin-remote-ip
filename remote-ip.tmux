#!/usr/bin/env zsh

CURRENT_DIR="${0:a:h}"

ip_script="#($CURRENT_DIR/scripts/remote-ip.sh)"
ip_interpolation_string="#{remote_ip}"

do_interpolation() {
    local string="$1"
    local interpolated=${string//$ip_interpolation_string/$ip_script}
    echo "$interpolated"
}

update_tmux_option() {
    local option="$1"
    option_value="$(tmux show-option -gqv $option)"
    new_option_value="$(do_interpolation $option_value)"
    tmux set-option -gq "$option" "$new_option_value"
}

main() {
    update_tmux_option status-right
    # update_tmux_option status-left
}

main
