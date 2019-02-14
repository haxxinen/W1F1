#!/usr/bin/env bash
# WPS scanner for Wi-Fi APs.

[[ ${EUID} -ne 0 ]] && echo 'Not root.' && exit
[[ -z ${1} ]] && echo "Usage: ${0} <wifi_interface>" && exit

minstrength=70
sec=120
outfile='/tmp/'${RANDOM}${RANDOM}

iface=${1}
iface_sts=`iw dev | awk '/Interface/{a=$2}/type/{b=$2}/tx/{print a":"b}' | grep ${iface} | awk -F ':' '{print $2}'`
[ "${iface_sts}" != 'monitor' ] && echo 'Interface not in monitor mode or not found.' && exit

wash -2 -5 -i ${iface} >${outfile} &
echo "Running 'wash' in background for ${sec} seconds ..." && sleep ${sec} && kill $! 2>/dev/null

vals=`sort -k 3,3 ${outfile} | grep No | awk '{print $3}' | awk 'NF' | tr -d '-'`
n=`for i in ${vals}; do [[ ${i} < ${minstrength} ]] && echo ${i}; done | wc -l`
sort -k 3,3 ${outfile} | grep No | head -n ${n}
rm ${outfile}
