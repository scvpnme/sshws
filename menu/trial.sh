#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl icanhazip.com | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain)
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
wsl="$(cat ~/log-install.txt | grep -w "Ws" | cut -d: -f2)"
web="$(cat ~/log-install.txt | grep -w "WebSocket" | cut -d: -f2)"
won="$(cat ~/log-install.txt | grep -w "WsOvpn" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=70
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi Trial SSH & OpenVPN"
echo -e "USERNAME          : $Login "
echo -e "PASSWORD          : $Pass"
echo -e "================================="
echo -e "================================="
echo -e "HOST              : $domain"
echo -e "OPENSSH           : 22, 200"
echo -e "DROBEAR           : 109, 143"
echo -e "SSL/TLS           :$ssl"
echo -e "WS SSL/TLS        :$wsl"
echo -e "WEBSOCKET         :$web"
echo -e "WSOVPN            :$won" 
echo -e "SQUID             :$sqd"
echo -e "ZIP FILE          : http://$domain:81/ALL.zip"
echo -e "BADVPN            : 7100 , 7200 , 7300"
echo -e "================================="
echo -e "EXPIRED ON        : $exp"
echo -e "================================="
echo -e "================================="
echo -e "PAYLOAD SSH WEBSOCKET HTTP"                                                          
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "================================="
echo -e "PAYLOAD SSH WEBSOCKET SSL"
echo -e "GET wss://bug [protocol][crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "================================="
echo -e " ###SCRIPT MOD BY Nazren Naz###"
echo -e "================================="
