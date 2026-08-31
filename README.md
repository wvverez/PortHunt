<h1 align="center">
  <br>
  <a href="https://github.com/wvverez/VurtaC2/">
    <img src="https://raw.githubusercontent.com/wvverez/VurtaC2/main/docs/vurta.png" width="160" height="150" alt="Vurta">
  </a>
  <br>
  Vurta
  <br>
</h1>

<h4 align="center">Host Discovering & Port Scanner</h4>

<p align="center">
  <img src="https://img.shields.io/badge/platform-Linux-orange">
  <img src="https://img.shields.io/badge/Bash-5.3%2B-orange">
  <img src="https://img.shields.io/badge/license-MIT-orange">
</p>

<p align="center">
  Made with ❤️ by Wvverez
</p>

## Características

- [x] Escaneo de redes locales mediante `arp-scan`.
- [x] Soporte para múltiples interfaces de red.
- [x] Detección de direcciones IP y MAC.
- [x] Filtrado de dispositivos según fabricante/OUI.
- [x] Identificación básica del sistema operativo mediante TTL.
- [x] Detección de puertos TCP abiertos.
- [x] Interfaz de línea de comandos.
- [x] Cancelación segura mediante `SIGINT`.

## Requisitos

- Linux
- Bash
- `ip`
- `ping`
- `sudo`
- `arp-scan`
- `nmap`

> El script puede instalar automáticamente `arp-scan` mediante `apt` si no está disponible.

# Modo de uso

Clona el repositorio:

```bash
git clone https://github.com/wvverez/Vurta.git
cd Vurta
```



## Mode Of Use

```Bash
chmod +x scan.sh
./scan.sh
```


```Java
⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀
⠀⢀⣤⣾⣿⣾⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀
⢠⣾⣿⢛⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀
⣾⣯⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⡿⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⢿⡵
⢸⡇⠀⠀⠉⠛⠛⣿⣿⠛⠛⠉⠀⠀⣿⡇
⢸⣿⣀⠀⢀⣠⣴⡇⠹⣦⣄⡀⠀⣠⣿⡇
⠈⠻⠿⠿⣟⣿⣿⣦⣤⣼⣿⣿⠿⠿⠟⠀
⠀⠀⠀⠀⠸⡿⣿⣿⢿⡿⢿⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠁⠈⠁⠀⠀⠀⠀⠀⠀

[+] Interfaces (ej: eth0,ens33): eth0
[+] Escaneando eth0
[+] IP: 192.168.91.212 | MAC: 00:0c:29:e3:d8:a4
[+] 192.168.91.212 -> Windows
[+] ¿Escanear 192.168.91.212 con nmap? (y/n): y
[+] Escaneando 192.168.91.212...
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows 7 Home Basic 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
[+] Escaneo completado
```

### AVISO LEGAL Y ÉTICO

Vurta es una herramienta exclusivamente educativa para el aprendizaje y la auditoría de seguridad informática. El uso de este software sin el consentimiento explícito del propietario de la red o sistema objetivo está estrictamente prohibido y puede constituir un delito en la mayoría de los países.

Al utilizar Vurta, el usuario acepta estas condiciones y se compromete a emplearla únicamente en redes y entornos controlados sobre los que tenga autorización previa.

La seguridad informática es para proteger, no para dañar. Actúa siempre con responsabilidad :)

### Donaciones

<img src="https://cryptologos.cc/logos/ethereum-eth-logo.svg" width="20" height="20"> **Ethereum (ETH):** `0x624DA9b65d42757713a469D57051701917C2D3f8`
[![Donate me a coffee](https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal&logoColor=white)](https://www.paypal.com/donate?hosted_button_id=99PC9L7CFB5ZL)
