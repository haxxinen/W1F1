#!/usr/bin/env bash
# Scan WiFi APs and get a signal coverage by range.

airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'

## iterate a few scans to get a larger list of APs
for i in `seq 4`; do
   ap_list=`$airport -s`
done
header=`echo "$ap_list" | head -n 1`

ap_list_sorted=`echo "$ap_list" | grep -oE '([0-9a-zA-Z]{2}\:){5}[0-9a-zA-Z]{2} \-[0-9]{2}' | sort -nk2 -r`

echo "$header"
for i in `echo "$ap_list_sorted"`
do
    echo "$ap_list" | grep "$i" 2>/dev/null
done
