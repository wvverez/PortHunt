#!/bin/bash
# Auto deploy y ejecución de el script
# Author: @wvverez

GREEN='\e[1;32m'; RESET='\e[0m'
printf "${GREEN}[+] Descargando lo necesario y ejecutando Vurta...${RESET}\n"
git clone https://github.com/wvverez/Vurta.git && cd Vurta
chmod +x scan.sh && ./scan.sh
