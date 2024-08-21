#!/bin/bash
source /root/cybervpn/var.txt && echo $BOT_TOKEN > .bot
azi=$(cat .bot)
source /root/cybervpn/var.txt && echo $ADMIN > .id
aji=$(cat .id)


function send-log(){
CHATID=$aji
KEY="$azi"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>────────────────────</code>
<b>🕊NOTIF QUOTA HABIS🕊</b>
<code>────────────────────</code>
<code>Username  : </code><code>$user</code>
<code>Usage     : </code><code>$total</code>
<code>────────────────────</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}

function cekvmess(){
  data=($(cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
  if [[ ! -e /etc/limit/vmess ]]; then
  mkdir -p /etc/limit/vmess
  fi
  for user in ${data[@]}
  do
  mkdir -p /tmp/quota
  data=$(xray api statsquery --server=127.0.0.1:10085 | grep -C 2 $user | sed /"}"/d | sed /"{"/d | grep value | awk '{print $2}' | sed 's/,//g; s/"//g' | sort)
  inb=$(echo "$data" | sed -n 1p)
  outb=$(echo "$data" | sed -n 2p) 
  quota0=$(echo -e "$[ $inb + $outb ]")
        if [ -e /etc/limit/vmess/${user} ]; then
        quota1=$(cat /etc/limit/vmess/${user});
             if [[ ${#quota1} -gt 0 ]]; then
                quota2=$(( ${quota0} + ${quota1} ));
                echo "${quota2}" > /etc/limit/vmess/"${user}"
                xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
              else
                  echo "${quota0}" > /etc/limit/vmess/"${user}"
                  xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
                fi
           else
               echo "${quota0}" > /etc/limit/vmess/"${user}"
               xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
            fi
     done
}
function cekvless(){
  data=($(cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sort | uniq))
  if [[ ! -e /etc/limit/vless ]]; then
  mkdir -p /etc/limit/vless
  fi
  for user in ${data[@]}
  do
  mkdir -p /tmp/quota
  data=$(xray api statsquery --server=127.0.0.1:10085 | grep -C 2 $user | sed /"}"/d | sed /"{"/d | grep value | awk '{print $2}' | sed 's/,//g; s/"//g' | sort)
  inb=$(echo "$data" | sed -n 1p)
  outb=$(echo "$data" | sed -n 2p) 
  quota0=$(echo -e "$[ $inb + $outb ]")
        if [ -e /etc/limit/vless/${user} ]; then
        quota1=$(cat /etc/limit/vless/${user});
             if [[ ${#quota1} -gt 0 ]]; then
                quota2=$(( ${quota0} + ${quota1} ));
                echo "${quota2}" > /etc/limit/vless/"${user}"
                xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
              else
                  echo "${quota0}" > /etc/limit/vless/"${user}"
                  xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
                fi
           else
               echo "${quota0}" > /etc/limit/vless/"${user}"
               xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
            fi
     done
}
function cektrojan(){
  data=($(cat /etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq))
  if [[ ! -e /etc/limit/trojan ]]; then
  mkdir -p /etc/limit/trojan
  fi
  for user in ${data[@]}
  do
  mkdir -p /tmp/quota
  data=$(xray api statsquery --server=127.0.0.1:10085 | grep -C 2 $user | sed /"}"/d | sed /"{"/d | grep value | awk '{print $2}' | sed 's/,//g; s/"//g' | sort)
  inb=$(echo "$data" | sed -n 1p)
  outb=$(echo "$data" | sed -n 2p) 
  quota0=$(echo -e "$[ $inb + $outb ]")
        if [ -e /etc/limit/trojan/${user} ]; then
        quota1=$(cat /etc/limit/trojan/${user});
             if [[ ${#quota1} -gt 0 ]]; then
                quota2=$(( ${quota0} + ${quota1} ));
                echo "${quota2}" > /etc/limit/trojan/"${user}"
                xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
              else
                  echo "${quota0}" > /etc/limit/trojan/"${user}"
                  xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
                fi
           else
               echo "${quota0}" > /etc/limit/trojan/"${user}"
               xray api stats --server=127.0.0.1:10085 -name "user>>>${user}>>>traffic>>>downlink" -reset > /dev/null 2>&1
            fi
     done
}
function vmess(){
while true; do
sleep 30
cekvmess
data=($(cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
for user in ${data[@]}
do
   if [ -e /etc/vmess/${user} ]; then
     cekdulu=$(cat /etc/vmess/${user});
      if [[ ${#cekdulu} -gt 1 ]]; then
          if [ -e /etc/limit/vmess/${user} ]; then
             pakai=$(cat /etc/limit/vmess/${user});
               if [[ ${pakai} -gt ${cekdulu} ]]; then
                  exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                  sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
                  sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
                  systemctl restart xray >> /dev/null 2>&1
                  bol=$(cat /etc/limit/vmess/${user});
                  total=$(con ${bol})
                  echo $total > sisavmess.txt
                  send-log
                  rm -rf /etc/limit/vmess/${user} &> /dev/null
              else
               echo ""
          fi
           else
            echo ""
        fi
         else
          echo ""
      fi
       else
        echo ""
    fi
  done
done
}
function vless(){
while true; do
sleep 30
cekvless
data=($(cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sort | uniq))
for user in ${data[@]}
do
   if [ -e /etc/vless/${user} ]; then
     cekdulu=$(cat /etc/vless/${user});
      if [[ ${#cekdulu} -gt 1 ]]; then
          if [ -e /etc/limit/vless/${user} ]; then
             pakai=$(cat /etc/limit/vless/${user});
               if [[ ${pakai} -gt ${cekdulu} ]]; then
                  exp=$(grep -w "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                  sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
                  sed -i "/^#& $user $exp/d" /etc/vless/.vless.db
                  systemctl restart xray >> /dev/null 2>&1
                  bol=$(cat /etc/limit/vless/${user});
                  total=$(con ${bol})
                  send-log
                  echo $total > sisavless.txt
                  rm -rf /etc/limit/vless/${user}
              else
               echo ""
          fi
           else
            echo ""
        fi
         else
          echo ""
      fi
       else
        echo ""
    fi
  done
done
}
function trojan(){
while true; do
sleep 30
cektrojan
data=($(cat /etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq))
for user in ${data[@]}
do
   if [ -e /etc/trojan/${user} ]; then
     cekdulu=$(cat /etc/trojan/${user});
      if [[ ${#cekdulu} -gt 1 ]]; then
          if [ -e /etc/limit/trojan/${user} ]; then
             pakai=$(cat /etc/limit/trojan/${user});
               if [[ ${pakai} -gt ${cekdulu} ]]; then
                  exp=$(grep -w "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                  sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
                  sed -i "/^#! $user $exp/d" /etc/trojan/.trojan.db
                  systemctl restart xray >> /dev/null 2>&1
                  bol=$(cat /etc/limit/trojan/${user});
                  total=$(con ${bol})
                  send-log
                  echo $total > sisatrojan.txt
                  rm -rf /etc/limit/trojan/${user}
              else
               echo ""
          fi
           else
            echo ""
        fi
         else
          echo ""
      fi
       else
        echo ""
    fi
  done
done
}

if [[ ${1} == "vmess" ]]; then
vmess
elif [[ ${1} == "vless" ]]; then
vless
elif [[ ${1} == "trojan" ]]; then
trojan
fi