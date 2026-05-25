#!/bin/bash
# https://github.com/wvverez
# Contributions: @JVJIXFMCQ=

cleanup() { printf "\n[+] Saliendo...\n"; exit 1; }
trap cleanup SIGINT

echo ""
printf "\e[1;32m"
printf "⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀\n"
printf "⠀⢀⣤⣾⣿⣾⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀\n"
printf "⢠⣾⣿⢛⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀\n"
printf "⣾⣯⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧\n"
printf "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿\n"
printf "⣿⡿⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⢿⡵\n"
printf "⢸⡇⠀⠀⠉⠛⠛⣿⣿⠛⠛⠉⠀⠀⣿⡇\n"
printf "⢸⣿⣀⠀⢀⣠⣴⡇⠹⣦⣄⡀⠀⣠⣿⡇\n"
printf "⠈⠻⠿⠿⣟⣿⣿⣦⣤⣼⣿⣿⠿⠿⠟⠀\n"
printf "⠀⠀⠀⠀⠸⡿⣿⣿⢿⡿⢿⠇⠀⠀⠀⠀\n"
printf "⠀⠀⠀⠀⠀⠀⠈⠁⠈⠁⠀⠀⠀⠀⠀⠀\n"
printf "\e[0m\n"

GREEN='\e[1;32m'; RED='\e[1;31m'; RESET='\e[0m'

command -v arp-scan &>/dev/null || { printf "${GREEN}[+] Instalando arp-scan...${RESET}\n"; sudo apt update && sudo apt install -y arp-scan; }

printf "${GREEN}[+] Interfaces (ej: eth0,ens33): ${RESET}"
read -re interfaces </dev/tty
IFS=',' read -ra iface_arr <<< "$interfaces"

for iface in "${iface_arr[@]}"; do
    [ -z "$iface" ] && { printf "${GREEN}[+] Interfaz no válida${RESET}\n"; exit 1; }
    printf "${GREEN}[+] Escaneando $iface${RESET}\n"
    my_mac=$(ip link show $iface 2>/dev/null | awk '/ether/{print $2}')
    result=$(sudo arp-scan -I $iface --localnet --ignoredups 2>/dev/null | grep -v "$my_mac" | grep -E '00:0c|08:00')
    [ -z "$result" ] && { printf "${GREEN}[+] Sin resultados en $iface${RESET}\n"; continue; }
    
    echo "$result" | while read line; do
        ip=$(echo "$line" | awk '{print $1}')
        mac=$(echo "$line" | awk '{print $2}')
        printf "${GREEN}[+] IP: ${RED}$ip${RESET} ${GREEN}| MAC: ${RED}$mac${RESET}\n"
        
        ttl=$(ping -c1 -W1 $ip 2>/dev/null | grep 'ttl' | awk '{print $6}' | cut -d'=' -f2)
        if [ -n "$ttl" ]; then
            if [ "$ttl" -eq 64 ]; then
                printf "${GREEN}[+] $ip -> Linux${RESET}\n"
            else
                printf "${GREEN}[+] $ip -> Windows${RESET}\n"
            fi
            
            printf "${GREEN}[+] ¿Escanear $ip con nmap? (y/n): ${RESET}"
            read -re ans </dev/tty
            if [[ "$ans" =~ ^[Yy]$ ]]; then
                printf "${GREEN}[+] Escaneando $ip...${RESET}\n"
                sudo nmap -p- --open -sS -sC -sV --min-rate 5000 -n -Pn $ip | grep -E "^[0-9]+/tcp|^PORT"
                printf "${GREEN}[+] Escaneo completado${RESET}\n"
            fi
        else
            printf "${GREEN}[+] TTL no disponible${RESET}\n"
        fi
        echo ""
    done
done
