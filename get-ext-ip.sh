#!/bin/bash
#BLUE='\e[44m'
GREEN='\033[32;1m'
#RED='\e[41m'
NC='\e[0m'
#ENTER you domain in the line below
#example dm=google.gr
dm=
dip=$(host $dm |awk {'print $4'})
ex=$(curl -s ipinfo.io/ip || curl -s ifconfig.me/ip)
echo -e " ┌──────────────────────────────────────────────────────────────┐"
echo -e " │  $GREEN Domain$NC        : $BLUE$dm$NC     	       		│"
echo -e " │  $GREEN EXT IP$NC        : $BLUE$ex$NC				│"
echo -e " │  $GREEN NO  IP$NC        : $RED$dip$NC				│"
echo " └──────────────────────────────────────────────────────────────┘"
