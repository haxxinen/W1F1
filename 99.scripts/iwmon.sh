#!/usr/bin/env bash
# WLAN interface management tool.
[ $EUID -ne 0 ] && echo 'Not root.' && exit

usage() {
    echo "Usage: $0 <iface> <channel> [managed|monitor]"
    status
}
status() {
	iw dev | awk '/Interface/{a=$2}/type/{b=$2}/channel/{print a":"b":"$2}'
}
([ -z $1 ] || [ -z $2 ] || [ -z $3 ]) && usage && exit
iface=$1; ch=$2; mode=$3

# mode management
ifconfig ${iface} down 2>/dev/null
iwconfig ${iface} mode ${mode} 2>/dev/null
ifconfig ${iface} up 2>/dev/null

# channel switch
channels=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 34 36 38 40 42 44 46 48 52 56 58 60 62 64 100 104 108 112)
case "${channels[@]}" in *${ch}*) iwconfig ${iface} channel ${ch} 2>/dev/null;; esac

status
