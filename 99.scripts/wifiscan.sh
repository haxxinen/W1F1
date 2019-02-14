#!/usr/bin/env bash
# Scan for Wi-Fi access points.

[[ $EUID -ne 0 ]] && echo 'Not root.' && exit
[[ -z ${1} ]] && echo "Usage: $0 <wifi_interface>" && exit
iface=${1}

iface_sts=`iw dev | awk '/Interface/{a=$2}/type/{b=$2}/tx/{print a":"b}' | grep ${iface} | awk -F ':' '{print $2}'`
[ "$iface_sts" != 'managed' ] && \
ifconfig ${iface} down && \
(iwconfig ${iface} mode managed || (echo 'Interface not found.' && exit)) && \
ifconfig ${iface} up 2>/dev/null

data=`iwlist ${iface} scanning | grep 'Address\|Channel\|ESSID\|Signal'`

for line_no in `echo "$data" | grep -n ESSID | awk -F ':' '{print $1}'`
do
	ap_info=`echo "$data" | head -$line_no | tail -n 5 | sed -n '/Cell/,/ESSID/p'`
	ssid_info=`echo "$ap_info" | grep ESSID | awk -F ':' '{print $2}'`

	echo "$ap_info" \
	| awk '/Address:/{a=$5}/Channel:/{sub(":"," ");b=$2}/Quality/{sub("="," ");c=$2}/ESSID/{print "["a"]:["b"]:["c"]"}' | tr -d '\n' && \
	echo "[${ssid_info}]"
done | sort -k 8,8 -t ':' -dr
