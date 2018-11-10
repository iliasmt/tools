#!/bin/bash
green="\033[32;1m"
NC="\033[m\n"
clear

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

start=${1:-"start"}

jumpto $start

start:
echo -e "${green}
\e[7m.:: Script to get ip and MAC info ::.\e[27m\n
-ip		) enter ip 
-dom		) enter domain
-MAC            ) enter mac address
-X		) exit
 ${NC}"
printf 'Enter Command 		: '
read cmd;

if [ $cmd = "ip" ] ; then {
printf 'Enter ip to get info	: '
read ip;
curl ipinfo.io/$ip
jumpto start
}
elif [ $cmd = "dom" ] ; then {
printf 'Enter domain to get info: '
read dom;
ip2=$(ping -c 1 -W 1 $dom  |head -n 1 | awk '{print $3}'| tr -d '()')
curl ipinfo.io/$ip2
jumpto start
}
elif [ $cmd = "MAC" ] || [ $cmd = "mac" ]; then {
printf 'Enter mac address to get vendor: '
read mac;
curl -s https://www.macvendorlookup.com/oui.php?mac=$mac  | python -m json.tool
jumpto start
}
elif [ $cmd = "X" ] ; then {
printf 'Exit Now \n'
}
else {
clear
echo
printf '	\e[41mWrong Input Start Over\033[m\n '
jumpto start
}
fi
