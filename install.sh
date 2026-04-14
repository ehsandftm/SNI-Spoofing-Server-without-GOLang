cat << 'EOF' > /usr/local/bin/install_sni && chmod +x /usr/local/bin/install_sni
#!/bin/bash
WORKDIR="/etc/sni-proxy"
BINARY_PATH="$WORKDIR/sni-proxy"
CONFIG_PATH="$WORKDIR/config.json"
SERVICE_PATH="/etc/systemd/system/sni.service"


YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


B64_DATA="f0PNLmFkZHJGdW5jLmZ1bmM1AG5ldC4oKm5ldEZEKS5hY2NlcHQuKCpuZXRGRCkuYWRkckZ1bmMuZnVuYzEAbmV0LigqbmV0RkQpLmFjY2VwdC4oKm5ldEZEKS5hZGRyRnVuYy5mdW5jMgB0eXBlOi5lcS5uZXQuVW5peEFkZHIAdHlwZTouZXEubmV0Lk9wRXJyb3IAdHlwZTouZXEubmV0Lm5ldEZEAHR5cGU6LmVxLm5ldC5BZGRyRXJyb3IAdHlwZTouZXEubmV0LkDNUEVycm9yAHR5cGU6LmVxLm5ldC5QYXJzZUVycm9yAHR5cGU6LmVxLm5ldC5Vbml4TGlzdGVuZXIAbmV0LmRvQmxvY2tpbmdXaXRoQ3R4W2dvLnNoYXBlLltdbmV0LklQQWRkcl0AbmV0LmRvQmxvY2tpbmdXaXRoQ3R4W2dvLnNoYXBlLmludF0AbmV0LigqSVApLk1hcnNoYWxUZXh0AG5ldC4oKklQKS5TdHJpbmcAbmV0Lm9ubHlWYWx1ZXNDdHgAbmV0Ligqb25seVZhbHVlc0N0eCkuRGVhZGxpbmUAbmV0Ligqb25seVZhbHVlc0N0eCkuRG9uZQBuZXQuKCpvbmx5VmFsdWVzQ3R4KS5Eb25lAG5ldC5vbmx5VmFsdWVzQ3R4LkVycgBuZXQuKCpvbmx5VmFsdWVzQ3R4KS5FcnIAbmV0LigqY2FuY2VsZWRFcnJvcikuRXJyb3IAbmV0LigqY2FuY2VsZWRFcnJvcikuSXMAbmV0LigqFkRyJubykuRXJyb3IAbmV0LigqYWRkcmluZm9FcnJubykuVGVtcG9yYXJ5AG5ldC4oKmFkZHJpbmZvRXJybm8pLlRpbWVvdXQAbmV0LigqVENQQ29ubikuQ2xvc2UAbmV0LigqVENQQ29ubikuUmVhZABuZXQuKCpUQ1BDb25uKS5TZXREZWFkbGluZQBuZXQuKCpUQ1BDb25uKS5Xcml0ZQBuZXQuKCpJUENvbm4pLkNsb3NlAG5ldC4oKklQQ29ubikuUmVhZABuZXQuKCpJUENvbm4pLlNldERlYWRsaW5lAG5ldC4oKklQQ29ubikuV3JpdGUAbmV0LigqVURQQ29ubikuQ2xvc2UAbmV0LigqVURQQ29ubikuUmVhZABuZXQuKCpVRFBDb25uKS5TZXREZWFkbGluZQBuZXQuKCpVRFBDb25uKS5Xcml0ZQBuZXQuKCpVbml4Q29ubikuQ2xvc2UAbmV0LigqVW5peENvbm4pLlJlYWQAbmV0LigqVW5peENvbm4pLlNldERlYWRsaW5lAG5ldC4oKlVuaXhDb25uKS5Xcml0ZQBuZXQuKCpVbmtub3duTmV0d29ya0Vycm9yKS5FcnErrorG5ldC4oKlVua25vd25OZXR3b3JrRXJyb3IsZXJyb3IAZ286aXRhYi4qbmV0Lk9wRXJyb3IsZXJyb3IAZ286aXRhYi4qc3lzY2FsbC5Tb2NrYWRkckluZXQ0LHN5c2NhbGwuU29ja2FkZHIAZ286aXRhYi4qbmV0LlVEUEFkZHIsbmV0LkFkZHIAZ286aXRhYi4qc3lzY2FsbC5Tb2NrYWRkckluZXQ2LHN5c2NhbGwuU29ja2FkZHIAZ286aXRhYi4qb3MuU3lzY2FsbEVycm9yLGVycm9yAGdvOml0YWIuKm5ldC5UQ1BBZGRyLG5ldC5BZGRyAGdvOml0YWIuKm5ldC5Vbml4Q29ubixpby5Xcml0ZXIAZ286aXRhYi4qbmV0LlRDUENvbm4saW8uUmVhZGVyAGdvOml0YWIubmV0LnRjcENvbm5XaXRob3V0V3JpdGVUbyxpby5SZWFkZXIAZ286aXRhYi4qbmV0LlVuaXhDb25uLGlvLlJlYWRlcgBnbzppdGFiLipuZXQuSVBBZGRyLG5ldC5BZGRyAGdvOml0YWIubmV0LnRjcENvbm5XaXRob3V0UmVhZEZyb20saW8uV3JpdGVyAGdvOml0YWIubmV0LmNhbmNlbGVkRXJyb3IsZXJyb3IAZ286aXRhYi4qbmV0LkFkZHRpbWVPdXRFcnJvcixlcnJvcgBnbzppdGFiLmludGVybmFsL3BvbGwuZXJyTmV0Q2xvc2luZyxlcnJvcgBuZXQuLmRpY3QuZG9CbG9ja2luZ1dpdGhDdHhbW11uZXQuSVBBZGRyXQBuZXQuLmRpY3QuZG9CbG9ja2luZ1dpdGhDdHhbaW50XQBnbzppdGFiLipvcy5maWxlU3RhdCxpby9mcy5GaWxlSW5mbwBnbzppdGFiLippby9mcy5QYXRoRXJyb3IsZXJyb3IAZ286aXRhYi5vcy5maWxlV2l0aG91dFdyaXRlVG8saW8uUmVhZGVyAGdvOml0YWIub3MuZmlsZVdpdGhvdXRSZWFkRnJvbSxpby5Xcml0ZXIAZ286aXRhYi5lbmNvZGluZy9iYXNlNjQuQ29ycnVwdElucHV0RXJyb3IsZXJyb3IAaW50ZXJuYWwvYnl0ZWFsZy4uZGljdC5IYXNoU3RyW3N0cmluZ10AaW50ZXJuYWwvYnl0ZWFsZy4uZGljdC5JbmRleFJhYmluS2FycFtzdHJpbmddAGNtcC4uZGljdC5pc05hTltpbnRdAGNtcC4uZGljdC5MZXNzW2ludF0Ac2xpY2VzLi5kaWN0Lmluc2VydGlvblNvcnRPcmRlcmVkW2ludF0Ac2xpY2VzLi5kaWN0LnNpZnREb3duT3JkZXJlZFtpbnRdAHNsaWNlcy4uZGljdC5oZWFwU29ydE9yZGVyZWRbaW50XQBzbGljZXMuLmRpY3QuYnJlYWtQYXR0ZXJuc09yZGVyZWRbaW50XQBzbGljZXMuLmRpY3Qub3JkZXIyT3JkZXJlZFtpbnRdAHNsaWNlcy4uZGljdC5tZWRpYW5PcmRlcmVkW2ludF0Ac2xpY2VzLi5kaWN0Lm1lZGlhbkFkamFjZW50T3JkZXJlZFtpbnRdAHNsaWNlcy4uZGljdC5jaG9vc2VQaXZvdE9yZGVyZWRbaW50XQBzbGljZXMuLmRpY3QucmV2ZXJzZVJhbmdlT3JkZXJlZFtpbnRdAHNsaWNlcy4uZGljdC5wYXJ0aWFsSW5zZXJ0aW9uU29ydE9yZGVyZWRbaW50XQBzbGljZXMuLmRpY3QucGFydGl0aW9uRXF1YWxPcmRlcmVkW2ludF0Ac2xpY2VzLi5kaWN0LnBhcnRpdGlvbk9yZGVyZWRbaW50XQBzbGljZXMuLmRpY3QucGRxc29ydE9yZGVyZWRbaW50XQBnbzppdGFiLmludGVybmFsL3JlZmxlY3RsaXRlLnJ0eXBlLGludGVybmFsL3JlZmxlY3RsaXRlLlR5cGUAZ286aXRhYi4qaW50ZXJuYWwvZm10c29ydC5Tb3J0ZWRNYXMapHNvcnQuSW50ZXJmYWNlAGdvOml0YWIucnVudGltZS5lcnJvclN0cmluZyxlcnJvcgBfY2dvX2luaXQAX2Nnb190aHJlYWRfc3RhcnQAX2Nnb19ub3RpZnlfcnVudGltZV9pbml0X2RvbmUAX2Nnb19jYWxsZXJzAF9jZ29feWllbGQAX2Nnb19wdGhyZWFkX2tleV9jcmVhdGVkAF9jZ29fYmluZG0AX2Nnb19nZXRzdGFja2JvdW5kAF9jZ29fbW1hcABfY2dvX3NpZ2FjdGlvbgBydW50aW1lLm1haW5QQwBnbzppdGFiLnRpbWUuZmlsZVNpemVFcnJvcixlcnJvcgBnbzppdGFiLip0aW1lLlBhcnNlRXJyb3IsZXJyb3IAdGltZS4uZGljdC5pc0RpZ2l0W1tddWludDhdAHRpbWUuLmRpY3QuYXVkaW5nSW50W1tddWludDhdAHRpbWUuLmRpY3QuYXRvaVtbXXVpbnQ4XQB0aW1lLi5kaWN0LnBhcnNlTmFub3NlY29uZHNbW111aW50OF0AdGltZS4uZGljdC5wYXJzZVJGQzMzMzlbW111aW50OF0AdGltZS4uZGljdC5sZWFkaW5nSW50W3N0cmluZ10AdGltZS4uZGljdC5hdG9pW3N0cmluZ10AdGltZS4uZGljdC5pc0RpZ2l0W3N0cmluZ10AdGltZS4uZGljdC5wYXJzZU5hbm9zZWNvbmRzW3N0cmluZ10AdGltZS4uZGljdC5wYXJzZVJGQzMzMzlbc3RyaW5nXQBnbzppdGFiLm5ldC9uZXRpcC5wYXJzZUFkZHJFcnJvcixlcnJvcgBnbzppdGFiLipjb250ZXh0LnZhbHVlQ3R4LGNvbnRleHQuQ29udGV4dABnbzppdGFiLipjb250ZXh0LmNhbmNlbEN0eCxjb250ZXh0LkNvbnRleHQAZ286aXRhYi5jb250ZXh0LndpdGhvdXRDYW5jZWxDdHgsY29udGV4dC5Db250ZXh0AGdvOml0YWIuKmNvbnRleHQudGltZXJDdHgsY29udGV4dC5Db250ZXh0AGdvOml0YWIuY29udGV4dC50b2RvQ3R4LGNvbnRleHQuQ29udGV4dABnbzppdGFiLipjb250ZXh0LnRpbWVyQ3R4LGNvbnRleHQuY2FuY2VsZXIAZ286aXRhYi5jb250ZXh0LnN0b3BDdHgsY29udGV4dC5Db250ZXh0AGdvOml0YWIuKmNvbnRleHQuY2FuY2VsQ3R4LGNvbnRleHQuY2FuY2VsZXIAZ286aXRhYi5jb250ZXh0LmRlYWRsaW5lRXhjZWVkZWRFcnJvcixlcnJvcgBnbzppdGFiLip2ZW5kb3IvZ29sYW5nLm9yZy94L25ldC9kbnMvZG5zbWVzc2FnZS5uZXN0ZWRFcnJvcixlcnJvcgBnbzppdGFiLippbnRlcm5hbC9nb2RlYnVnLnJ1bnRpbWVTdGRlcnIsaW50ZXJuYWwvYmlzZWN0LldyaXRlcgBnbzppdGFiLippbnRlcm5hbC9wb2xsLkRlYWRsaW5lRXhjZWVkZWRFcnJvcixlcnJvcgB4X2Nnb19wdGhyZWFkX2tleV9jcmVhdGVkAHhfY3Jvc3NjYWxsMl9wdHIAX2Nyb3NzY2FsbDJfcHRyAGdvOml0YWIuKmludGVybmFsL2Jpc2VjdC5wYXJzZUVycm9yLGVycm9yAGZyZWUAX19lcnJub19sb2NhdGlvbgBnYWlfc3RyZXJyb3IAbWFsbG9jAGdldGFkZHJpbmZvAGZyZWVhZGRyaW5mbwBfX3ZmcHJpbnRmX2NoawBhYm9ydABwdGhyZWFkX2NvbmRfYnJvYWRjYXN0AHB0aHJlYWRfZ2V0YXR0cl9ucABzaWdhY3Rpb24Ac2V0ZW52AHB0aHJlYWRfY29uZF93YWl0AG1tYXAAbmFub3NsZWVwAHB0aHJlYWRfa2V5X2NyZWF0ZQBmcHV0YwBwdGhyZWFkX2F0dHJfaW5pdABzaWdlbXB0eXNldABwdGhyZWFkX2F0dHJfZ2V0c3RhY2sAc2lnZmlsbHNldABwdGhyZWFkX211dGV4X3VubG9jawBwdGhyZWFkX2RldGFjaABwdGhyZWFkX3NpZ21hc2sAbXVubWFwAHB0aHJlYWRfY3JlYXRlAHB0aHJlYWRfc2VsZgB1bnNldGVudgBwdGhyZWFkX2F0dHJfZGVzdHJveQBzaWdpc21lbWJlcgBmd3JpdGUAX19mcHJpbnRmX2NoawBzdHJlcnJvcgBzaWdhZGRzZXQAcHRocmVhZF9tdXRleF9sb2NrAHB0aHJlYWRfYXR0cl9nZXRzdGFja3NpemUAcHRocmVhZF9zZXRzcGVjaWZpYwBzdGRlcnIAeF9jZ29faW5pdHRscwBnbzptYWluLmluaXR0YXNrcwBnbzpydW50aW1lLmluaXR0YXNrcwBydW50aW1lLmRlZmF1bHRHT1JPT1Quc3RyAHJ1bnRpbWUuYnVpbGRWZXJzaW9uLnN0cgBydW50aW1lLm1vZGluZm8uc3RyAGdvOmJ1aWxkaW5mbwBnbzpidWlsZGluZm8ucmVmAHR5cGU6KgBydW50aW1lLnRleHRzZWN0aW9ubWFwAAAudGV4dAAubm9wdHJkYXRhAC5kYXRhAC5ic3MALm5vcHRyYnNzAC5nby5mdXp6Y250cnMALmdvLmJ1aWxkaW5mbwAudGJzcwAubm90ZS5nby5idWlsZGlkAC5lbGZkYXRhAC5yb2RhdGEALnR5cGVsaW5rAC5pdGFibGluawAuZ29zeW10YWIALmdvcGNsbnRhYgAuc3ltdGFiAC5zdHJ0YWIALmRlYnVnX2FiYnJldgAuZGVidWdfZnJhbWUALmRlYnVnX2luZm8ALmRlYnVnX2xvYwAuZGVidWdfbGluZQAuZGVidWdfZ2RiX3NjcmlwdHMALmRlYnVnX3JhbmdlcwAuc2hzdHJ0YWIALmludGVycAAuaGFzaAAuZ290AC5nb3QucGx0AC5keW5hbWljAC5keW5zeW0ALmR5bnN0cgAucmVsYQAucmVsYS5wbHQALnBsdAAuZ251LnZlcnNpb24ALmdudS52ZXJzaW9uX3IA"

# نصب و ایجاد باینری
mkdir -p $WORKDIR
echo "$B64_DATA" | base64 -d > $BINARY_PATH
chmod 755 $BINARY_PATH

setup_config() {
    clear
    echo -e "${YELLOW}--- SNI Configuration Setup ---${NC}"
    read -p "Enter Listen Host [0.0.0.0]: " L_HOST
    L_HOST=${L_HOST:-"0.0.0.0"}
    read -p "Enter Listen Port [40443]: " L_PORT
    L_PORT=${L_PORT:-40443}
    read -p "Enter Connect IP [104.18.4.130]: " C_IP
    C_IP=${C_IP:-"104.18.4.130"}
    read -p "Enter Connect Port [443]: " C_PORT
    C_PORT=${C_PORT:-443}
    read -p "Enter Fake SNI [security.vercel.com]: " F_SNI
    F_SNI=${F_SNI:-"security.vercel.com"}

    echo -e "\n${YELLOW}Testing Connectivity...${NC}"
    echo -e "${YELLOW}Pinging Connect IP: $C_IP${NC}"
    ping -c 3 "$C_IP"
    
    echo -e "\n${YELLOW}Pinging Fake SNI: $F_SNI${NC}"
    ping -c 3 "$F_SNI"

    cat <<EOC > $CONFIG_PATH
{
  "LISTEN_HOST": "$L_HOST",
  "LISTEN_PORT": $L_PORT,
  "CONNECT_IP": "$C_IP",
  "CONNECT_PORT": $C_PORT,
  "FAKE_SNI": "$F_SNI"
}
EOC
}

cat <<EOC > $SERVICE_PATH
[Unit]
Description=SNI Proxy Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$WORKDIR
ExecStart=$BINARY_PATH
Restart=always

[Install]
WantedBy=multi-user.target
EOC

cat << 'EOM' > /usr/local/bin/sni
#!/bin/bash
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

while true; do
    clear
    echo -e "${GREEN}====================================${NC}"
    echo -e "${GREEN}        SNI Proxy Manager           ${NC}"
    echo -e "${GREEN}====================================${NC}"
    echo "1) Show Status"
    echo "2) Start Service"
    echo "3) Stop Service"
    echo "4) Restart Service"
    echo "5) Configuration Setup"
    echo "6) View Live Logs (Anonymous)"
    echo "7) Uninstall"
    echo "8) Exit"
    read -p "Choice [1-8]: " choice
    case $choice in
        1) systemctl status sni; read -p "Press Enter...";;
        2) systemctl start sni; echo "Started."; sleep 1;;
        3) systemctl stop sni; echo "Stopped."; sleep 1;;
        4) systemctl restart sni; echo "Restarted."; sleep 1;;
        5) install_sni --reconfig;;
        6) echo -e "${YELLOW}Showing Live Logs (Press Ctrl+C to stop)...${NC}"; journalctl -u sni -f -o cat;;
        7) systemctl stop sni; systemctl disable sni; rm -rf /etc/sni-proxy /usr/local/bin/sni /etc/systemd/system/sni.service; echo "Uninstalled."; exit;;
        8) exit 0;;
    esac
done
EOM
chmod +x /usr/local/bin/sni

if [ "$1" == "--reconfig" ]; then
    setup_config
    systemctl restart sni
else
    setup_config
    systemctl daemon-reload
    systemctl enable sni
    systemctl restart sni
    echo -e "${GREEN}Installation Complete! Type 'sni' to manage.${NC}"
fi
EOF
